hook_diameter = 3.35;
plug_diameter = 4.5;
ball_diameter = 8;

plug_height = 5;
hook_height = 20;

curve_diameter = 20 - hook_diameter;

include <MCAD/units.scad>
use <MCAD/2Dshapes.scad>

module hook ()
{
    intersection () {
        rotate_extrude ()
        translate ([curve_diameter / 2, 0, 0])
        circle (d=hook_diameter, $fn=20);

        linear_extrude (h=curve_diameter + epsilon, center=true)
        pieSlice (size=curve_diameter + epsilon, start_angle=-90, end_angle=90);
    }
}

module suction_cup_hook () {
    rotate (90, X) {
        sphere (d=ball_diameter, $fn=30);

        translate ([0, 0, ball_diameter/4]) {
            cylinder (d=plug_diameter, h=plug_height + ball_diameter/4, $fn=20);

            translate ([0, 0, plug_height - epsilon]) {
                cylinder (d=hook_diameter, h=hook_height + epsilon * 2, $fn=20);

                translate ([-curve_diameter/2, 0, hook_height])
                rotate (-90, Y)
                rotate (90, X)
                hook ();
            }
        }
    }
}

suction_cup_hook ();
