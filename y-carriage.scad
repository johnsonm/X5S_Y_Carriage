x1 = 12;
x2 = 37;
x3 = 62;
y1 = -22;
y2 = -62;
z = 5;
s_h = 8;
d = 5.2;
r1 = 8;
r2 = 5;

module crosshair(x, y, z, d) {
    // Used to locate centers and size holes
    translate([x, y, 0]) union() {
        translate([-d/2, -0.1, 0]) cube([d, 0.2, z]);
        translate([-0.1, -d/2, 0]) cube([0.2, d, z]);
    }
}
module support(x, y) {
    $fn=60;
    // this holds the wheel
    translate([x, y, 0]) difference() {
        translate([0, 0, z-0.01]) cylinder(r1=r1, r2=r2, h=s_h+0.01);
        cylinder(d=d, h=z+s_h+0.01);
    }
}

module carriage() {
    import("X5S_Y-carriage_3w_ridged.stl"); // FreeCAD exported from .iges
    support(x1, y1);
    support(x2, y2);
    support(x3, y1);
    //crosshair(12, -22, 5, 5);
    //crosshair(62, -22, 5, 5);
    //crosshair(37, -62, 5, 5);
}
carriage();