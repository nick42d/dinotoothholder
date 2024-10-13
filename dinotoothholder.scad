translate([0,0,5])
	body() {}

module body() {
	epsilon = 0.01;

	width = 100;
	depth = 50;
	height = 10;

	translate([-width/2,0,0])
		cube([width, depth, height]);

	base_h = 5;

	translate([-width/2,-height,-base_h])
		cube([width, depth + height, base_h]);

	triangle = [
		[0, 0],
		[0,height],
		[height,0],
		[0,0]
	];

	cylinder_h = 50;
	cylinder_r = 3;

	translate([width/3, depth/2, 0])
		cylinder(cylinder_h, r1 = cylinder_r, r2 = cylinder_r);

	text_h = 2;

	difference() {
	 rotate([90,0,270]) 
	 	linear_extrude(height = width, center = true) 
	 			polygon(points = triangle);
		translate([0,-height,0])
			// Angle should depend on triangle dims
			rotate([45,0,0])
				translate([0,0,-text_h + epsilon])
					linear_extrude(text_h)
							text("Spinosaurus", halign = "center", valign = "bottom");
	}

	translate([-45,15,height])
		linear_extrude(text_h/2)
			multiLine([
				"Real dinosaur tooth from North Africa",
				"The largest carnivore to ever live, including T. rex.",
				"From the cretaceous age (100m y.o) in Morocco.",
			], 3);

	rotate_extrude(angle = 360) 
		translate([0,-50,0])
			square(size = [10,20]);
}

// Multi line text
module multiLine(lines, size){
  union(){
    for (i = [0 : len(lines)-1])
      translate([0 , -i * (size + 2), 0 ]) text(lines[i], size);
  }
}

