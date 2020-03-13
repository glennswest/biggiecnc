// Source
// https://www.thingiverse.com/thing:1092611/#files

inch = 25.4;
estowall = .067 * inch;
estosize = .87 * inch;
bsize=4;
strutsize=2;
struthole=strutsize * .25 * inch;
thickness=5;

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
   rotate([0,0,45]) linear_extrude(height = thickness, center = true, convexity = 10, twist = 0) arc(bsize * inch ,strutsize * inch,90,100);
}

module mounting_ear(){
    difference(){
        translate([0,(strutsize*inch),0]) cube([estosize,strutsize*inch,thickness]);
        translate([(.5*estosize),(bsize*inch)-1.5*inch,1-thickness]) rotate([0,0,0]) cylinder(r=2.75,h=thickness+5);
        translate([(.5*estosize),(bsize*inch)-.5*inch, 1-thickness]) rotate([0,0,0]) cylinder(r=2.75,h=thickness+5);
    }    
}

module half_ear(){
    difference(){
        translate([0,(strutsize*inch),0]) cube([estosize,strutsize*inch,thickness]);
        translate([(.70*estosize),(bsize*inch)-1.5*inch,1-thickness]) rotate([0,0,0]) cylinder(r=2.75,h=thickness+5);
        translate([(.70*estosize),(bsize*inch)-.5*inch, 1-thickness]) rotate([0,0,0]) cylinder(r=2.75,h=thickness+5);
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

module radius_plate(){
    strut();
    rotate([0,180,0]) translate([0,(strutsize*inch),0-(thickness/2)]) mounting_ear();
    rotate([0,0,-90]) translate([0,(strutsize*inch),0-(thickness/2)]) mounting_ear();
}

module strut_holes(){
 translate([(0-.50*estosize),(bsize*inch)-1.5*inch,1-thickness]) rotate([0,0,0]) cylinder(r=2.75,h=thickness+5);
  translate([(0-.50*estosize),(bsize*inch)-.5*inch, 1-thickness]) rotate([0,0,0]) cylinder(r=2.75,h=thickness+5);   
}

module universal_radius_plate(){
    difference(){
        strut();
        rotate([0,180,0]) translate([0,(strutsize*inch),0-(thickness/2)]) strut_holes();
        rotate([0,0,-90]) translate([0,(strutsize*inch),0-(thickness/2)]) strut_holes();
        }
    rotate([0,180,0]) translate([0-estosize/2,(strutsize*inch),0-(thickness/2)]) half_ear();
    rotate([0,0,-90]) translate([0-estosize/2,(strutsize*inch),0-(thickness/2)]) half_ear();
    rotate([0,180,0]) translate([0-thickness,(strutsize*inch),0-(thickness/2)])  translate([0,(strutsize*inch),-10]) cube([4,strutsize*inch,thickness+5]);
    rotate([0,0,-90])  translate([0-thickness,(strutsize*inch),0-(thickness/2)])  translate([0,(strutsize*inch),5]) cube([4,strutsize*inch,thickness+5]);
}


module midradius_plate(){
   radius_plate();
   translate([0-(estosize),0,0]) rotate([0,180,0]) radius_plate();
   }
 
universal_radius_plate();
   
//radius_plate();  
//translate([0,0,0]) projection(cut = true) radius_plate();
//midradius_plate();
//translate([0,0,0]) projection(cut = true) midradius_plate();   