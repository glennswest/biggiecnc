use <Profile.scad>

//%translate([20,20,0]) V40x40_6(50);
//%translate([60.1,20,0]) V40x40_6(50);

module m5_bolt(tl)
{
    rotate([0,0,0]) translate([0,0,0]) cylinder(r=5,h=4);
    rotate([0,0,0]) translate([0,0,2.9]) cylinder(r=3,h=tl+1);
    
}

module theplate()
{
 translate([-40,0,0]) cube([120,40,5]);
 translate([0,40,0]) cube([40,40,5]); 
     
    
}

module tplate()
{
difference(){
 theplate();
 translate([10,30,-3]) m5_bolt(30);
 translate([30,10,-3]) m5_bolt(30);
 translate([10,10,-3]) m5_bolt(30);
 translate([30,30,-3]) m5_bolt(30);
 translate([40+10,30,-3]) m5_bolt(30);
 translate([40+30,10,-3]) m5_bolt(30);
 translate([40+10,10,-3]) m5_bolt(30);
 translate([40+30,30,-3]) m5_bolt(30);
 translate([0+10,30+40,-3]) m5_bolt(30);
 translate([0+30,10+40,-3]) m5_bolt(30);
 translate([0+10,10+40,-3]) m5_bolt(30);
 translate([0+30,30+40,-3]) m5_bolt(30); 
 translate([-40+10,30,-3]) m5_bolt(30);
 translate([-40+30,10,-3]) m5_bolt(30);
 translate([-40+10,10,-3]) m5_bolt(30);
 translate([-40+30,30,-3]) m5_bolt(30);    
 
}   
tsize = 10;
}

//translate([0,0,50]) theplate();
tplate();