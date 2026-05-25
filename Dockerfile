# Reproducible build environment for cv.tex.
#
#   docker build -t cv-builder .
#   docker run --rm -v "$PWD":/work cv-builder
#
# The container writes the compiled PDF to assets/cv.pdf.

FROM debian:bookworm-slim

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        texlive-latex-base \
        texlive-latex-recommended \
        texlive-latex-extra \
        texlive-fonts-recommended \
        texlive-fonts-extra \
        lmodern \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /work

# pdflatex args:
#   -interaction=nonstopmode  → don't stop on warnings
#   -halt-on-error            → stop on real errors
#   -output-directory=assets  → write build artifacts (including cv.pdf) into assets/
ENTRYPOINT ["pdflatex", "-interaction=nonstopmode", "-halt-on-error", "-output-directory=assets"]
CMD ["cv.tex"]
