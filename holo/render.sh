#!/usr/bin/env bash
# Renders both hologram loops from the exported STLs into ../assets.
# Needs: npm ci here, ffmpeg, and Playwright's Chromium (npx playwright install chromium).
set -euo pipefail
HERE=$(cd "$(dirname "$0")" && pwd)
cd "$HERE"

python3 -m http.server 8765 > /dev/null 2>&1 &
server=$!
trap 'kill $server 2> /dev/null' EXIT
sleep 1
# A server already on the port would serve some other directory's STLs without a word.
kill -0 $server 2> /dev/null || { echo "port 8765 is taken, stop that server first"; exit 1; }

# 160 frames at 20 fps = an 8 s loop. GIFs drop to 15 fps and a small palette to stay
# under ~5 MB, because the glow gradients compress badly. The MP4 keeps full quality.
render() { # <config> <name> <gif colours>
  local cfg=$1 name=$2 colours=$3 f="fps=15,scale=640:-1:flags=lanczos"
  rm -rf "frames-$name"
  node capture.mjs "$cfg" "frames-$name" 160
  mkdir -p out
  ffmpeg -loglevel error -y -framerate 20 -i "frames-$name/f%04d.png" \
    -vf "$f,palettegen=max_colors=$colours:stats_mode=diff" out/pal.png
  ffmpeg -loglevel error -y -framerate 20 -i "frames-$name/f%04d.png" -i out/pal.png \
    -lavfi "$f[x];[x][1:v]paletteuse=dither=bayer:bayer_scale=5:diff_mode=rectangle" \
    -loop 0 "../assets/$name-holo.gif"
  ffmpeg -loglevel error -y -framerate 20 -i "frames-$name/f%04d.png" \
    -c:v libx264 -pix_fmt yuv420p -crf 20 -movflags +faststart "out/$name-holo.mp4"
}

render pi5.json pi5-runners 64
render hex.json hexrack-sbc 48
ls -la ../assets out
