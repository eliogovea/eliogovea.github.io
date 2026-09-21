# eliogovea.github.io

Personal site — resume and projects. Hosted on GitHub Pages.

## Structure

```
index.html              Landing page — intro, highlights, all projects
TAILORING.md            How to adapt the base CV per application
resume/
  index.html            Full CV — the canonical source for the PDF
assets/
  cv.pdf                Generated from resume/index.html by scripts/build-pdf.sh
  og-image.png          1200x630 share card (kept external for OG crawlers)
scripts/
  build-pdf.sh          Render resume/index.html → assets/cv.pdf via headless Chrome
```

Both pages are self-contained (CSS, JS, favicons inlined) and share the same
`<style>` block. The two pages hold **distinct** content — only the identity
header and the projects link are common — so edits do not need mirroring.

No build step for the live site. Push to `main`; GitHub Pages serves it.

## Local preview

```sh
python3 -m http.server 8000
```

Then open <http://localhost:8000/> and <http://localhost:8000/resume/>.

## Rebuild the CV PDF

```sh
./scripts/build-pdf.sh
```

Renders `resume/index.html` to `assets/cv.pdf` via headless Chrome (auto-detects
macOS Chrome, `google-chrome`, or `chromium`; override with `$CHROME`).

The print stylesheet at the bottom of `resume/index.html` targets a **2-page**
PDF. After changing CV content, rebuild and check the page count:

```sh
python3 -c "import re;d=open('assets/cv.pdf','rb').read();print(re.findall(rb'/Type\s*/Pages.{0,200}?/Count\s+(\d+)',d,re.S))"
```

Then re-read the extracted text — this is what an ATS parser sees:

```sh
gs -q -dNOPAUSE -dBATCH -sDEVICE=txtwrite -sOutputFile=- assets/cv.pdf
```

Shared figures (170+ countries, 2,500+ systems, 200+ partners, 80% CDN) appear on both
pages and in the PDF. Keep them in agreement. See [TAILORING.md](TAILORING.md) for adapting
the CV to a specific application.
