
// ----------------------------------------------------------------------------
// ENTRY (holo): one positioned piece, so the animation can move each on its own.
piece = "module"; k = 0; cad_dir = ".";
if (piece == "lid") translate(explodeLid()) lidAt() lidPart();
else translate(explodeModule(k)) moduleAt(k) {
  if (piece == "module") modulePart();
  translate(explodeTray()) {
    if (piece == "tray")  trayPart();
    if (piece == "board") onBoard() pi5Board();
  }
  if (piece == "fan")
    translate([front_wall_t + fan_depth / 2, fan_yc, fan_zc])
      rotate([0, 0, -90]) import(str(cad_dir, "/", fan_asset), center = true);
  if (piece == "filter") filterMounted(assembly_space);
}
