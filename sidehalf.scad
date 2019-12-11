use <Profile.scad>

%translate([20,20,0]) V40x40_6(50);

module m5_bolt(tl)
{
    rotate([0,90,0]) translate([0,0,0]) cylinder(r=5,h=4);
    rotate([0,90,0]) translate([0,0,2.9]) cylinder(r=3,h=tl+1);
    
}

difference(){
   translate([0,0,50]) cube([40,40,10]);
   translate([30,30,61]) rotate([0,90,0]) m5_bolt(30);
   translate([30,10,61]) rotate([0,90,0]) m5_bolt(30); 
    }
difference(){
   translate([0,0,60]) cube([20,40,40]);
   translate([-11,10,80]) m5_bolt(30);
   translate([-11,30,80]) m5_bolt(30); 
   }
difference(){
 translate([-10,0,0]) cube([10,40,100]);
 translate([-11,10,80]) m5_bolt(30);
 translate([-11,30,80]) m5_bolt(30);
 translate([-11,10,30]) m5_bolt(30);
 translate([-11,30,30]) m5_bolt(30);      
 }   
tsize = 10;


