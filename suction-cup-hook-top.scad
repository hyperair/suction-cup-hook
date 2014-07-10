use <suction-cup-hook.scad>

intersection () {
    suction_cup_hook ();

    linear_extrude (h=100)
    square ([400, 400], center=true);
}
