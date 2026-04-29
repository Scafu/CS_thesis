#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
HUNSPELL_DIR="${ROOT_DIR}/.hunspell"
IGNORE_FILE="${HUNSPELL_DIR}/ignore.yaml"
HUNSPELL_DICTS="it_IT,en_US"
INCLUDE_PATHS=(
  "${ROOT_DIR}/chapters"
  "${ROOT_DIR}/preface"
  "${ROOT_DIR}/appendix"
)

if ! command -v hunspell >/dev/null 2>&1; then
  echo "hunspell non trovato. Installa hunspell e rilancia." >&2
  echo "Debian/Ubuntu: sudo apt install hunspell" >&2
  exit 1
fi

USE_LOCAL_DICTS=true
for dict in it_IT en_US; do
  if [[ ! -f "${HUNSPELL_DIR}/${dict}.aff" || ! -f "${HUNSPELL_DIR}/${dict}.dic" ]]; then
    USE_LOCAL_DICTS=false
    break
  fi
done

TMP_ACCEPTED="$(mktemp)"
trap 'rm -f "${TMP_ACCEPTED}"' EXIT

is_lowercase() {
  local s="$1"
  [[ "$s" == "${s,,}" && "$s" != "${s^^}" ]]
}

is_uppercase() {
  local s="$1"
  [[ "$s" == "${s^^}" && "$s" != "${s,,}" ]]
}

is_capitalized() {
  local s="$1"
  local first="${s:0:1}"
  local rest="${s:1}"
  [[ "${#s}" -ge 2 ]] || return 1
  [[ "$first" == "${first^^}" && "$first" != "${first,,}" && "$rest" == "${rest,,}" ]]
}

is_accepted_word() {
  local word="$1"
  local allowed

  for allowed in "${ACCEPTED_WORDS[@]:-}"; do
    if is_lowercase "$allowed"; then
      [[ "${word,,}" == "$allowed" ]] && return 0
    elif is_uppercase "$allowed"; then
      [[ "$word" == "$allowed" ]] && return 0
    elif is_capitalized "$allowed"; then
      [[ "$word" == "$allowed" || "$word" == "${allowed^^}" ]] && return 0
    else
      [[ "$word" == "$allowed" ]] && return 0
    fi
  done

  return 1
}

preprocess_file() {
  local file="$1"

  perl -0pe '
    s/\x{2019}/'\''/g;
    s/\x{201C}|\x{201D}/"/g;
    s{^#import.*$}{}mg;
    s{^#show.*$}{}mg;
    s{^#set.*$}{}mg;
    s{^#let.*$}{}mg;
    s{#\[[^\]]*\]}{ }g;
    s{\b[[:alpha:]_]+:\s*}{ }g;
    s{```.*?```}{ }gs;
    s{`[^`\n]+`}{ }g;
    s{//.*$}{}mg;
    s{https?://\S+}{ }g;
    s{<[^>\n]+>}{ }g;
    s{#link\([^)]*\)\[([^\]]*)\]}{$1}g;
    s{#\w+\([^)]*\)}{ }g;
    s{^=+\s+}{}mg;
    s{^/\s+}{}mg;
    s{^\s*[-*]\s+}{}mg;
    s/\[[^\]]*\]\([^)]+\)/ /g;
    s/[@#][[:alnum:]_:-]+/ /g;
    s/\b(UC|UCS)\d*\b/ /g;
    s/\bv\d+\b/ /g;
    s/(?<=[[:alpha:]])(PASS|FAIL)\b/ /g;
    s/\b(?:[dlmnst]|un|all|dall|nell|sull|quest|quell|l)'\''([[:alpha:]]+)/$1/gi;
    s/(?<=\s)'\''([[:alpha:]]+)/$1/g;
    s/\b[[:alpha:]]*[A-Z][[:alpha:]]*\b/ /g;
    s/\b[[:alpha:]]{1,3}\b/ /g;
    s/[^[:alpha:][:space:]'\''àèéìíîòóùÀÈÉÌÍÎÒÓÙ]/ /g;
    s/\s+/ /g;
  ' "${file}"
}

if [[ -f "${IGNORE_FILE}" ]]; then
  awk '
    BEGIN {
      in_accepted = 0
    }
    /^accepted_words:[[:space:]]*$/ {
      in_accepted = 1
      next
    }
    in_accepted && /^[^[:space:]#][^:]*:/ {
      in_accepted = 0
    }
    in_accepted {
      if (match($0, /^[[:space:]]*-[[:space:]]*(.+)[[:space:]]*$/, m)) {
        word = m[1]
        sub(/[[:space:]]+#.*$/, "", word)
        gsub(/^["'"'"']|["'"'"']$/, "", word)
        if (length(word) > 0) {
          print word
        }
      }
    }
  ' "${IGNORE_FILE}" > "${TMP_ACCEPTED}"
else
  : > "${TMP_ACCEPTED}"
fi

mapfile -t ACCEPTED_WORDS < "${TMP_ACCEPTED}"

if [[ "${USE_LOCAL_DICTS}" == true ]]; then
  HUNSPELL_CMD=(env "DICPATH=${HUNSPELL_DIR}" hunspell -d "${HUNSPELL_DICTS}" -l)
else
  HUNSPELL_CMD=(hunspell -d "${HUNSPELL_DICTS}" -l)
fi

had_errors=0

while IFS= read -r -d '' file; do
  file_words="$(mktemp)"
  file_errors="$(mktemp)"

  preprocess_file "${file}" |
    "${HUNSPELL_CMD[@]}" |
    awk 'length($0) > 1' |
    sort -u > "${file_words}"

  while IFS= read -r word; do
    if ! is_accepted_word "$word"; then
      printf '%s\n' "$word" >> "${file_errors}"
    fi
  done < "${file_words}"

  if [[ -s "${file_errors}" ]]; then
    had_errors=1
    printf '%s\n' "${file#${ROOT_DIR}/}"
    sed 's/^/  - /' "${file_errors}"
  fi

  rm -f "${file_words}" "${file_errors}"
done < <(
  for path in "${INCLUDE_PATHS[@]}"; do
    if [[ -f "${path}" ]]; then
      printf '%s\0' "${path}"
    elif [[ -d "${path}" ]]; then
      find "${path}" -type f \( -name '*.typ' -o -name '*.md' \) -print0
    fi
  done
)

if [[ "${had_errors}" -eq 1 ]]; then
  exit 1
fi

echo "Spellcheck completato senza errori."
