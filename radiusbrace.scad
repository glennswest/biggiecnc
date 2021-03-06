// Source
// https://www.thingiverse.com/thing:1092611/#files

inch = 25.4;
estowall = .067 * inch;
estosize = .87 * inch;
bsize=4;
strutsize=2;
struthole=strutsize * .25 * inch;

module arc(radius, thickness, angle, fragments){
  $fn=fragments;
	intersection(){
		union(){
			rights = floor(angle/90);
			remain = angle-rights*90;
			if(angle > 90){
				for(i = [0:rights-1]){
					rotate(i*90-(rights-1)*90/2){
						polygon([[0, 0], [radius+thickness, (radius+thickness)*tan(90/2)], [radius+thickness, -(radius+thickness)*tan(90/2)]]);
					}
				}
				rotate(-(rights)*90/2)
					polygon([[0, 0], [radius+thickness, 0], [radius+thickness, -(radius+thickness)*tan(remain/2)]]);
				rotate((rights)*90/2)
					polygon([[0, 0], [radius+thickness, (radius+thickness)*tan(remain/2)], [radius+thickness, 0]]);
			}else{
				polygon([[0, 0], [radius+thickness, (radius+thickness)*tan(angle/2)], [radius+thickness, -(radius+thickness)*tan(angle/2)]]);
			}
		}
		difference(){
			circle(radius+thickness);
			circle(radius);
		}
	}
}

module brace_body(){
   rotate([0,0,45]) linear_extrude(height = estosize, center = true, convexity = 10, twist = 0) arc(bsize * inch ,strutsize * inch,90,100);
}

module mounting_ear(){
    difference(){
        translate([0,0,0-estosize/2]) cube([estosize/2,5 * inch,estosize]);
        translate([0-inch,.5*inch,0]) rotate([0,90,0]) cylinder(r=2.5,h=estosize+100);
        translate([0-inch,4.5*inch, 0]) rotate([0,90,0]) cylinder(r=2.5,h=estosize+100);
        translate([-5,.5*inch, 0]) rotate([0,90,0]) cylinder(r=3.5,h=10,$fn=5);
        translate([-5,4.5*inch, 0]) rotate([0,90,0]) cylinder(r=3.5,h=10,$fn=5);
    }    
}

module strut(){
  difference(){
    brace_body();
    rotate([0,0,-20]) translate([0,((strutsize+3)*inch),0-estosize+5]) cylinder(r=struthole,h=estosize+10);
    rotate([0,0,-45]) translate([0,(strutsize+3)*inch,0-estosize+5]) cylinder(r=struthole,h=estosize+10);
    rotate([0,0,-70]) translate([0,(strutsize+3)*inch,0-estosize+5]) cylinder(r=struthole,h=estosize+10);
    }
}

strut();
rotate([0,180,0]) translate([0-estosize/2,(strutsize+.5)*inch,0]) mounting_ear();
rotate([0,0,-90]) translate([0-estosize/2,(strutsize+.5)*inch,0]) mounting_ear();
