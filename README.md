# eliogovea.github.io

Personal site — resume and projects. Hosted on GitHub Pages.

## Structure

```
index.html              Resume / home — self-contained (CSS, JS, favicons inlined)
assets/
  cv.pdf                Generated from index.html by scripts/build-pdf.sh
  og-image.png          1200x630 share card (kept external for OG crawlers)
scripts/
  build-pdf.sh          Render index.html → assets/cv.pdf via headless Chrome
```

No build step for the live site. Push to `main`; GitHub Pages serves it.

## Local preview

```sh
python3 -m http.server 8000
```

## Rebuild the CV PDF

```sh
./scripts/build-pdf.sh
```

Renders `index.html` to `assets/cv.pdf` via headless Chrome (auto-detects
macOS Chrome, `google-chrome`, or `chromium`; override with `$CHROME`).
