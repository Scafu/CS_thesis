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

TMP_INPUT="$(mktemp)"
TMP_ACCEPTED="$(mktemp)"
TMP_WORDS="$(mktemp)"
TMP_OUTPUT="$(mktemp)"
trap 'rm -f "${TMP_INPUT}" "${TMP_ACCEPTED}" "${TMP_WORDS}" "${TMP_OUTPUT}"' EXIT

for path in "${INCLUDE_PATHS[@]}"; do
  if [[ -f "${path}" ]]; then
    printf '%s\0' "${path}"
  elif [[ -d "${path}" ]]; then
    find "${path}" -type f \( -name '*.typ' -o -name '*.md' \) -print0
  fi
done |
while IFS= read -r -d '' file; do
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
    s/\b[[:alpha:]]*[A-Z][[:alpha:]]*\b/ /g;
    s/\b[[:alpha:]]{1,3}\b/ /g;
    s/[^[:alpha:][:space:]'\''àèéìíîòóùÀÈÉÌÍÎÒÓÙ]/ /g;
    s/\s+/ /g;
  ' "${file}" >> "${TMP_INPUT}"
  printf '\n' >> "${TMP_INPUT}"
done

if [[ "${USE_LOCAL_DICTS}" == true ]]; then
  HUNSPELL_CMD=(env "DICPATH=${HUNSPELL_DIR}" hunspell -d "${HUNSPELL_DICTS}" -l)
else
  HUNSPELL_CMD=(hunspell -d "${HUNSPELL_DICTS}" -l)
fi

"${HUNSPELL_CMD[@]}" < "${TMP_INPUT}" |
  awk 'length($0) > 1' |
  sort -u > "${TMP_WORDS}"

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

  awk '
    function is_lowercase(s) {
      return s == tolower(s) && s != toupper(s)
    }
    function is_uppercase(s) {
      return s == toupper(s) && s != tolower(s)
    }
    function is_capitalized(s, first, rest) {
      if (length(s) < 2) {
        return 0
      }
      first = substr(s, 1, 1)
      rest = substr(s, 2)
      return first == toupper(first) && first != tolower(first) && rest == tolower(rest)
    }
    FNR == NR {
      accepted[++n] = $0
      next
    }
    {
      word = $0
      for (i = 1; i <= n; i++) {
        allowed = accepted[i]
        if (is_lowercase(allowed)) {
          if (tolower(word) == allowed) {
            next
          }
        } else if (is_uppercase(allowed)) {
          if (word == allowed) {
            next
          }
        } else if (is_capitalized(allowed)) {
          if (word == allowed || word == toupper(allowed)) {
            next
          }
        } else {
          if (word == allowed) {
            next
          }
        }
      }
      print word
    }
  ' "${TMP_ACCEPTED}" "${TMP_WORDS}" > "${TMP_OUTPUT}"
else
  cp "${TMP_WORDS}" "${TMP_OUTPUT}"
fi

if [[ -s "${TMP_OUTPUT}" ]]; then
  cat "${TMP_OUTPUT}"
  exit 1
fi

echo "Spellcheck completato senza errori."
