
$fn=64;

module holes()
{
        translate([-10,-10,-21]) cylinder(r=4,h=31);
        translate([ 10,-10,-21]) cylinder(r=4,h=31);
        translate([-10, 10,-21]) cylinder(r=4,h=31);
        translate([ 10, 10,-21]) cylinder(r=4,h=31);
        translate([-10,-10,-21]) cylinder(r=2.6,h=42);
        translate([ 10,-10,-21]) cylinder(r=2.6,h=42);
        translate([-10, 10,-21]) cylinder(r=2.6,h=42);
        translate([ 10, 10,-21]) cylinder(r=2.6,h=42);
    
    
}

module lefthand_corner()
{
 difference(){
   translate([-20,-20,-20]) cube([40,40,40]);
   holes();
   rotate([0,90,0]) holes();
   rotate([90,90,0]) holes();  
   }
 }
 
module lefthand_corner()
{
 difference(){
   translate([-20,-20,-20]) cube([40,40,40]);
   holes();
   rotate([0,90,0]) holes();
   rotate([90,90,0]) holes();  
   }
 }
 
 module righthand_corner()
{
 difference(){
   translate([-20,-20,-20]) cube([40,40,40]);
   holes();
   rotate([0,90,0]) holes();
   rotate([-90,90,0]) holes();  
   }
 }
 
 translate([ 50, 0, 20]) rotate([180,0,0]) righthand_corner();
 
 translate([-50, 0 ,20]) rotate([180,0,0]) lefthand_corner();