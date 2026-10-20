// One positioned body section. Offsets mirror body.scad and sections/body/back.scad.
include <config.scad>
use <lib/shapes.scad>
use <components/fan.scad>
use <sections/body/face.scad>
use <sections/body/fan.scad>
use <sections/body/back-top.scad>
use <sections/body/back-face.scad>
use <sections/body/back-bottom.scad>
use <sections/body/dust.scad>
use <sections/body/top-supports.scad>
piece = "face"; s = bodyAssembly_space; back_y = face_depth + fan_depth + s*2;
if (piece == "dust") translate([0, -s, 0]) sectionDust();
if (piece == "face") sectionFace();
if (piece == "fan") translate([0, face_depth + s, 0]) sectionFan();
if (piece == "noctua") translate([0, face_depth + s, 0])
  translate([body_width/2, fan_depth, hex_flat_to_flat(body_width)/2]) fanVisualization92();
if (piece == "back-bottom") translate([0, back_y + s/4, -s/4]) sectionBackBottom();
if (piece == "back-top") translate([0, back_y + s/4, s/4]) sectionBackTop();
if (piece == "back-face") translate([0, back_y + s/2 + back_depth, 0]) sectionBackFace();
if (piece == "supports") translate([0, back_y + s/4, s/6]) sectionTopSupports();
