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

The site links to `assets/cv.pdf`. After editing `cv.tex`, regenerate it with:

```sh
pdflatex -output-directory=assets cv.tex
rm assets/cv.aux assets/cv.log assets/cv.out 2>/dev/null
```

Requires a TeX distribution with the `moderncv` package (e.g. MacTeX, TeX Live).

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
