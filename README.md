# eliogovea.github.io

Personal site — resume, projects, and notes. Hosted on GitHub Pages.

## Structure

```
index.html              Resume / home
projects.html           Projects showcase
blog/                   Notes (empty for now)
assets/
  css/styles.css        Single stylesheet
  js/main.js            Theme toggle + footer year
  cv.pdf                Compiled CV (generated from cv.tex)
cv.tex                  Source of truth for the CV
```

No build step. Push to `main` and GitHub Pages serves it.

## Local preview

```sh
python3 -m http.server 8000
```

Open <http://localhost:8000>.

## Rebuild the CV PDF

The site links to `assets/cv.pdf`. After editing `cv.tex`, rebuild it via the
included Docker image — no local TeX install needed:

```sh
./build-cv.sh
```

The script:

1. Builds the `cv-builder` image on first run (Debian + the TeX Live packages
   that `cv.tex` needs — `moderncv`, `enumitem`, `import`, FontAwesome glyphs,
   etc.). ~1.5 GB, takes a few minutes once.
2. Mounts the repo into the container and runs `pdflatex` against `cv.tex`.
3. Writes `assets/cv.pdf` and cleans up the `.aux`, `.log`, `.out` intermediates.

Subsequent runs reuse the cached image and finish in a few seconds.

### Without the wrapper script

Equivalent to what `build-cv.sh` does:

```sh
docker build -t cv-builder .
docker run --rm --user "$(id -u):$(id -g)" -v "$PWD":/work cv-builder
```

### Using a local TeX install instead

If you'd rather not use Docker, any TeX distribution with `moderncv` works
(MacTeX on macOS, TeX Live on Linux):

```sh
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=assets cv.tex
rm assets/cv.{aux,log,out} 2>/dev/null
```

## Optional: ship the design fonts

The CSS targets **Source Serif 4** (headings) and **Inter** (body) with system
serif/sans fallbacks. The site looks polished out of the box on the fallbacks.
To pin the exact typefaces, drop woff2 files into `assets/fonts/` and prepend to
`assets/css/styles.css`:

```css
@font-face {
  font-family: "Source Serif 4";
  src: url("../fonts/SourceSerif4-Regular.woff2") format("woff2");
  font-weight: 400; font-display: swap;
}
@font-face {
  font-family: "Source Serif 4";
  src: url("../fonts/SourceSerif4-SemiBold.woff2") format("woff2");
  font-weight: 600; font-display: swap;
}
@font-face {
  font-family: "Inter";
  src: url("../fonts/Inter-Regular.woff2") format("woff2");
  font-weight: 400; font-display: swap;
}
@font-face {
  font-family: "Inter";
  src: url("../fonts/Inter-Medium.woff2") format("woff2");
  font-weight: 500; font-display: swap;
}
```

Sources: <https://fonts.google.com/specimen/Source+Serif+4>, <https://rsms.me/inter/>.
