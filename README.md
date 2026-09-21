# eliogovea.github.io

Personal site — CV and projects. Hosted on GitHub Pages, served from `main`.

## Structure

```
index.html              The CV — the canonical source for the PDF
projects/
  index.html            Projects, long form
assets/
  cv.pdf                Generated from index.html by scripts/build-pdf.sh
  og-image.png          1200x630 share card (kept external for OG crawlers)
scripts/
  build-pdf.sh          Render index.html → assets/cv.pdf via headless Chrome
TAILORING.md            How to adapt the base CV per application
.nojekyll               Pages serves the files verbatim, no Jekyll
```

Both pages are self-contained (CSS, JS, favicons inlined) and share the same
`<style>` block. They hold **distinct** content — only the identity header, the
nav and the footer are common — so edits do not need mirroring.

No build step for the live site. Push to `main`; GitHub Pages serves it.

## Local preview

```sh
python3 -m http.server 8000
```

Then open <http://localhost:8000/> and <http://localhost:8000/projects/>.

## Rebuild the CV PDF

```sh
./scripts/build-pdf.sh
```

Renders `index.html` to `assets/cv.pdf` via headless Chrome (auto-detects macOS
Chrome, `google-chrome`, or `chromium`; override with `$CHROME`).

The print stylesheet at the bottom of `index.html` targets a **2-page** PDF.
After changing CV content, rebuild and check the page count:

```sh
python3 -c "import re;d=open('assets/cv.pdf','rb').read();print(re.findall(rb'/Type\s*/Pages.{0,200}?/Count\s+(\d+)',d,re.S))"
```

Then re-read the extracted text — this is what an ATS parser sees:

```sh
gs -q -dNOPAUSE -dBATCH -sDEVICE=txtwrite -sOutputFile=- assets/cv.pdf
```

See [TAILORING.md](TAILORING.md) for adapting the CV to a specific application.
