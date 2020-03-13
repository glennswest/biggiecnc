
inch = 25.4;
estowall = .067 * inch;
estosize = .87 * inch;

$fn=100;

module rounded_cube(thex,thez)
{
 difference(){
         cube([thex,thex,thez]);
         translate([thex/2,thex/2,0]) tube(estosize/2+6,4,1.5 * inch);    
 }
}

module tube(rx,tx,size)
{
    difference(){
      cylinder(r=rx,h=size);
      translate([0,0,-.5]) cylinder(r=rx-tx,h=size+1);
    }
}



    hull(){
	   translate([-1*inch,0,0]) cube([3*inch,1*inch,2]);
       cube([1*inch,1*inch,10]);
       translate([7,0,28]) rotate([0,45,0]) cube([1*inch,1*inch,1]);    
       }
       
    
 translate([estowall+7,estowall,28]) rotate([0,45,0])  rounded_cube(estosize,inch);
       
//t
