# Tailoring the CV per application

`resume/index.html` is the **base CV**: one document that reads well for any C++ systems
role. For a specific application, swap the four things below, rebuild the PDF, and send it.
Keep the base intact on `main` — tailor on a branch or in a scratch copy.

Everything here is a reordering or a substitution. Never add a claim you cannot defend in
an interview.

---

## 1. Systems / embedded C++ — the default

This is what the base CV already is. Send as-is.

- **Summary opens with:** "Eight years of production C++ across networking, embedded Linux
  and cross-platform delivery."
- **Skills order:** Languages → Networking → Protocols → Platforms → Build & CI →
  Frameworks → Concepts.
- **Projects:** DNS library · Router-network Docker testbed · C++ project template.
- **Lead bullet at F-Secure:** the 80% CDN cut.

## 2. Platform / infrastructure / developer experience

Your Vaisala work is closer to this than to product C++ — lead with it.

- **Summary opens with:** the AviMet simulation tooling and the Alma Linux build-matrix
  expansion, then the eight-years anchor. Move the CDN metric to the second sentence.
- **Skills order:** move **Build & CI** and **Platforms** above Networking and Protocols.
- **Projects:** C++ project template · Router-network Docker testbed · DNS library.
- **Lead bullet at F-Secure:** move "Owned the cross-platform build system…" and "Designed
  the Jenkins/AWS CI pipelines…" from the Software Engineer role up to the top of their list.
- **Emphasize:** reproducible builds, cross-compilation, quality gates, test infrastructure.

## 3. Broad senior backend / software engineer

Widest reach, weakest signal — use only when the posting is genuinely generalist.

- **Summary opens with:** "Eight years building and shipping production systems" — drop
  "embedded Linux" from the first clause so the filter does not read you as niche.
- **Skills order:** Languages → Build & CI → Protocols → Frameworks → Networking →
  Platforms → Concepts.
- **Projects:** Baseball Limits 2D · Automatic layout for a growing DAG · DNS library —
  the two with live demos show product sense and front-end range.
- **De-emphasize:** MIPS, Buildroot, OpenWrt, nfqueue/nflog/conntrack — keep them listed,
  just not first.

---

## Always, before sending

1. **Mirror the posting's vocabulary.** If it says "firmware" and you wrote "embedded", use
   theirs — ATS matching is literal. Only where it is true.
2. **Rebuild and check the page count stays at 2:**
   ```sh
   ./scripts/build-pdf.sh
   python3 -c "import re;d=open('assets/cv.pdf','rb').read();print(re.findall(rb'/Type\s*/Pages.{0,200}?/Count\s+(\d+)',d,re.S))"
   ```
3. **Re-read the extracted text** — this is what an ATS sees, not the rendered page:
   ```sh
   gs -q -dNOPAUSE -dBATCH -sDEVICE=txtwrite -sOutputFile=- assets/cv.pdf
   ```
4. **Keep `index.html` and `resume/index.html` in agreement** on any shared number
   (currently: 170+ countries, 2,500+ systems, 200+ partners, 80% CDN).
