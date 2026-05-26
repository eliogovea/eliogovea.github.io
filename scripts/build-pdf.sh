#!/usr/bin/env bash
# Render index.html → assets/cv.pdf via headless Chrome.
# Honors $CHROME; auto-detects common binaries otherwise.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT/index.html"
OUT="$ROOT/assets/cv.pdf"

find_chrome() {
  if [[ -n "${CHROME:-}" ]]; then
    echo "$CHROME"; return
  fi
  local candidates=(
    "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
    "/Applications/Chromium.app/Contents/MacOS/Chromium"
    "google-chrome"
    "google-chrome-stable"
    "chromium"
    "chromium-browser"
  )
  for c in "${candidates[@]}"; do
    if [[ -x "$c" ]] || command -v "$c" >/dev/null 2>&1; then
      echo "$c"; return
    fi
  done
  echo "ERROR: no Chrome/Chromium binary found. Set \$CHROME." >&2
  exit 1
}

CHROME_BIN="$(find_chrome)"
echo "Using: $CHROME_BIN"
echo "Source: $SRC"
echo "Output: $OUT"

"$CHROME_BIN" \
  --headless=new \
  --disable-gpu \
  --no-pdf-header-footer \
  --print-to-pdf="$OUT" \
  "file://$SRC"

echo "Wrote $OUT ($(wc -c < "$OUT") bytes)"
