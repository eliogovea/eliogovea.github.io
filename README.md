# eliogovea.github.io

Personal site — resume, projects, notes. Hosted on GitHub Pages.

## Structure

```
index.html              Resume / home (includes Projects section)
blog/index.html         Notes (empty)
assets/
  css/styles.css
  js/main.js
  cv.pdf                Compiled from cv.tex
  favicon.svg, favicon-32.png, apple-touch-icon.png
  og-image.png          1200x630 share card
cv.tex                  Source of truth for the CV
```

No build step. Push to `main`; GitHub Pages serves it.

## Local preview

```sh
python3 -m http.server 8000
```

## Rebuild the CV PDF

After editing `cv.tex`:

```sh
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=assets cv.tex
rm assets/cv.{aux,log,out}
```

Requires a TeX distribution with `moderncv` (e.g. MacTeX, TeX Live with
`texlive-latex-extra` and `texlive-fonts-extra`).
