use <suction-cup-hook.scad>
include <MCAD/units.scad>

rotate (180, X)
intersection () {
    suction_cup_hook ();

    mirror (Z)
    linear_extrude (h=100)
    square ([400, 400], center=true);
}
