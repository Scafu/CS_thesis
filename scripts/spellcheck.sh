#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DICT_FILE="${ROOT_DIR}/config/spellcheck-ignore.txt"
ASPELL_LANG="${ASPELL_LANG:-it}"
INCLUDE_PATHS=(
  "${ROOT_DIR}/chapters"
  "${ROOT_DIR}/preface"
  "${ROOT_DIR}/appendix"
)

if ! command -v aspell >/dev/null 2>&1; then
  echo "aspell non trovato. Installa aspell e il dizionario italiano, poi rilancia." >&2
  echo "Debian/Ubuntu: sudo apt install aspell aspell-it" >&2
  exit 1
fi

TMP_INPUT="$(mktemp)"
TMP_WORDS="$(mktemp)"
trap 'rm -f "${TMP_INPUT}" "${TMP_WORDS}"' EXIT

for path in "${INCLUDE_PATHS[@]}"; do
  if [[ -f "${path}" ]]; then
    printf '%s\0' "${path}"
  elif [[ -d "${path}" ]]; then
    find "${path}" -type f \( -name '*.typ' -o -name '*.md' \) -print0
  fi
done |
while IFS= read -r -d '' file; do
  perl -0pe '
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
    s/\b[[:alpha:]]*[A-Z][[:alpha:]]*\b/ /g;
    s/\b[[:alpha:]]{1,3}\b/ /g;
    s/[^[:alpha:][:space:]'\''àèéìíîòóùÀÈÉÌÍÎÒÓÙ]/ /g;
    s/\s+/ /g;
  ' "${file}" >> "${TMP_INPUT}"
  printf '\n' >> "${TMP_INPUT}"
done

aspell --lang="${ASPELL_LANG}" list < "${TMP_INPUT}" |
  tr '[:upper:]' '[:lower:]' |
  awk "length(\$0) > 1" |
  sort -u > "${TMP_WORDS}"

if [[ -f "${DICT_FILE}" ]]; then
  grep -vxFf "${DICT_FILE}" "${TMP_WORDS}" || true
else
  cat "${TMP_WORDS}"
fi
