# holo

Renders the hologram loops in `../assets/` from the cases' own CAD.

Each piece is exported twice, closed and fully exploded, and the renderer moves it along the difference between the two positions. The explode logic stays in the CAD, so a design change only needs a re-export.

## Regenerate

Needs OpenSCAD 2026.01 or later, ffmpeg, Node 22 and Playwright's Chromium.

```bash
npm ci
npx playwright install chromium   # once; capture.mjs expects chromium-1243
./export.sh ../../pi5-runners/cad ../../hexrack-sbc/cad
./render.sh
```

## Files

- `holo.html` is the three.js scene: a fresnel shader, edge lines, a scan band and bloom. `window.renderFrame(p)` draws loop position `p` in [0, 1), so frames are deterministic.
- `pi5.json` and `hex.json` list the pieces, colours, camera and overlay text. The overlay only states what the projects' readmes state.
- `pi5/entry.scad` is appended to pi5-runners' `case.scad` (minus its own entry block) at export time. No copy of that case's source lives here.
- `hex/piece.scad` mirrors the offsets in hexrack's `body.scad` and `sections/body/back.scad`. If those change, update it.
