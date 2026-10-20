// Usage: node capture.mjs <cfg.json> <outDir> <frames> [onlyFrame]
// Steps the page's renderFrame deterministically and screenshots each frame.
import { chromium } from 'playwright-core';
import { mkdirSync } from 'node:fs';
import { homedir } from 'node:os';

const [cfg, out, framesArg, only] = process.argv.slice(2);
const frames = Number(framesArg);
mkdirSync(out, { recursive: true });

const browser = await chromium.launch({
  executablePath: `${homedir()}/Library/Caches/ms-playwright/chromium-1243/chrome-mac-arm64/Google Chrome for Testing.app/Contents/MacOS/Google Chrome for Testing`,
  args: ['--use-angle=metal', '--enable-gpu', '--ignore-gpu-blocklist'],
});
const page = await browser.newPage({ viewport: { width: 1200, height: 800 } });
page.on('console', (m) => console.log('page:', m.text()));
page.on('pageerror', (e) => { console.error('pageerror:', e.message); process.exit(1); });
await page.goto(`http://localhost:8765/holo.html?cfg=/${cfg}`);
await page.waitForFunction(() => window.ready === true, null, { timeout: 120000 });

const list = only !== undefined ? [Number(only)] : [...Array(frames).keys()];
for (const i of list) {
  await page.evaluate((p) => window.renderFrame(p), i / frames);
  await page.screenshot({ path: `${out}/f${String(i).padStart(4, '0')}.png` });
}
await browser.close();
