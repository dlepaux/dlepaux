#!/usr/bin/env bash
# Exports every animated piece twice, closed and exploded, from the CAD checkouts.
# The renderer derives each piece's motion from the two positions, so the CAD stays
# the only owner of the explode logic.
#
# Usage: ./export.sh <path/to/pi5-runners/cad> <path/to/hexrack-sbc/cad>
set -euo pipefail

PI5_CAD=$(cd "$1" && pwd)
HEX_CAD=$(cd "$2" && pwd)
HERE=$(cd "$(dirname "$0")" && pwd)
OPENSCAD=${OPENSCAD:-/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD}

export_stl() { # <cad dir> <out> <scad> [-D ...]
  local cad=$1 out=$2 scad=$3; shift 3
  OPENSCADPATH=$cad "$OPENSCAD" --backend=manifold --export-format binstl -o "$out" "$@" "$scad" \
    > /dev/null 2> "$out.log" || { echo "FAIL $out"; cat "$out.log"; return 1; }
}

# pi5-runners: case.scad without its own entry block, plus ours. Built at run time
# so no copy of the case's source lives in this repo.
mkdir -p "$HERE/pi5/stl"
sed '/^\/\/ ENTRY/,$d' "$PI5_CAD/case.scad" | cat - "$HERE/pi5/entry.scad" > "$HERE/pi5/stl/piece.scad"
for a in 0 20; do
  export_stl "$PI5_CAD" "$HERE/pi5/stl/lid-0-a$a.stl" "$HERE/pi5/stl/piece.scad" \
    -D 'piece="lid"' -D assembly_space=$a -D "cad_dir=\"$PI5_CAD\"" &
  for k in 0 1 2; do
    for p in module tray board fan filter; do
      export_stl "$PI5_CAD" "$HERE/pi5/stl/$p-$k-a$a.stl" "$HERE/pi5/stl/piece.scad" \
        -D "piece=\"$p\"" -D k=$k -D assembly_space=$a -D "cad_dir=\"$PI5_CAD\"" &
    done
  done
done

# hexrack-sbc: top-supports holds only the board preview, so with show_sbc on it is the board.
mkdir -p "$HERE/hex/stl"
for a in 0 40; do
  for p in dust face fan noctua back-bottom back-top back-face; do
    export_stl "$HEX_CAD" "$HERE/hex/stl/$p-a$a.stl" "$HERE/hex/piece.scad" \
      -D "piece=\"$p\"" -D bodyAssembly_space=$a -D show_sbc=false &
  done
  export_stl "$HEX_CAD" "$HERE/hex/stl/board-a$a.stl" "$HERE/hex/piece.scad" \
    -D 'piece="supports"' -D bodyAssembly_space=$a -D show_sbc=true &
done

fails=0
for job in $(jobs -p); do wait "$job" || fails=$((fails + 1)); done
[ "$fails" -eq 0 ] || { echo "$fails export(s) failed"; exit 1; }
rm -f "$HERE"/pi5/stl/*.log "$HERE"/hex/stl/*.log
echo "exported $(ls "$HERE"/pi5/stl/*.stl "$HERE"/hex/stl/*.stl | wc -l | tr -d ' ') pieces"
