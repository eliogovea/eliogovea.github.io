#!/usr/bin/env bash
#
# Compile cv.tex → assets/cv.pdf using the cv-builder Docker image.
#
# First run builds the image (a few minutes, ~1.5 GB). Subsequent runs
# reuse the cached image and finish in a few seconds.

set -euo pipefail

cd "$(dirname "$0")"

IMAGE=cv-builder

if ! docker image inspect "$IMAGE" >/dev/null 2>&1; then
    echo "→ building $IMAGE image (first time, ~1.5 GB)"
    docker build -t "$IMAGE" .
fi

echo "→ compiling cv.tex"
docker run --rm \
    --user "$(id -u):$(id -g)" \
    -v "$PWD":/work \
    "$IMAGE"

# Tidy up LaTeX intermediates; keep only the PDF.
rm -f assets/cv.aux assets/cv.log assets/cv.out

echo "→ done: assets/cv.pdf"
