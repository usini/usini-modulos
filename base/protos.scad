//Protos
//Version 2.0
//Licence: CC-0
//Author: Remi Sarrailh <remi@madnerd.org>

$fn = 30; //Improve cylinder resolution 

//Move object block by block (4mm)
module move(x=0,y=0,z=0){
    translate([x*4,y*4,z]) children();
}

//Base for panelas/espacios, size are 4mm and hole diameter is 2mm
module protos(z=2){
    difference(){
        cube([4,4,z]);
        translate([2,2,-1])
         cylinder(z*2+1,1.5,1.5);
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

//Protos with round corner
module protos_fillet(z=2,r=1,bottom_left=false,bottom_right=false,top_left=false,top_right=false){
    if(bottom_left){
        difference(){
            protos(z=z);
            fillet(r=r,z=z);
        }
    }
    if(bottom_right){
        difference(){
            protos(z=z);
            fillet(z=z,rotation=90,x=3);
        }
    }
    if(top_left){
        difference(){
            protos(z=z);
            fillet(z=z,rotation=270,y=3);
        }
    }
    
    if(top_right){
        difference(){
            protos(z=z);
            fillet(z=z,rotation=180,x=3,y=3);
        }
    }
}

//protos(z=2);
//protos_fillet(z=2,r=1,bottom_left=true);



