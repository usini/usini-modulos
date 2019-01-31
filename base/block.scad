//Block
//Version 2.0
//Licence: CC-0
//Author: Remi Sarrailh <remi@madnerd.org>
$fn = 30;
module block(z=2){
    cube([4,4,z]);
}

module block_espacios(x=4,y=4,z=2){
    x = x-1;
    y = y-1;
    z= z+0.05;
    
    for(a=[0:x])
        translate([-0.05,-0.05,0]) //Margin for difference
        translate([4*a,0,-0.05])
        cube(4.1,4.1,z=z);
    if(y >= 1){
        for(a=[1:y]) 
            translate([-0.05,-0.05,0]) //Margin for difference
            translate([0,4*a,-0.05]) 
            cube(4.1,4.1,z=z);
    }
    if(x >= 1){
        for(a=[1:x]) 
            translate([-0.05,-0.05,0]) //Margin for difference
            translate([4*a,4*y,-0.05]) 
            cube(4.1,4.1,z=z);
    }
    if(y >=2){
        for(a=[1:y-1]) 
            translate([-0.05,-0.05,0]) //Margin for difference
            translate([4*x,4*a,-0.05])
            cube(4.1,4.1,z=z);
    }
}

module block_panelas(x=4,y=4,z=2){
    translate([-0.05,-0.05,-0.05]) cube([x*4+0.1,y*4+0.1,z+0.1]);
}

module blocks(x=4,y=4,z=2,fillet=false){
    if(fillet){
        difference(){
            cube([x*4,y*4,z]);
            fillet();
            fillet(x=(x*4-1),z=z,rotation=90);
            fillet(y=(y*4-1),z=z,rotation=270);
            fillet(x=(x*4-1),y=(y*4-1),z=z,rotation=180);
        }
    }else{     
        cube([x*4,y*4,z]);
    }
}

//Rounded corner
//http://forum.openscad.org/rounded-corners-td3843.html
module fillet(r=1, z=2,rotation=0, x=0, y=0) {
    translate([r / 2 + x, r / 2 + y, 0]) 
    rotate(rotation,0,0)
        difference() {
            cube([r + 0.01, r + 0.01, z*2 +1], center = true);

            translate([r/2, r/2, 0])
                cylinder(r = r, h = z*2 +1, center = true);

        }
}

//block_panelas(x=4,y=4,z=2);
block_espacios(x=4,y=4,z=2);


//color("red") block_panelas();
//block_espacios();



