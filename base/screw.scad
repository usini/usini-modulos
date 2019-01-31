//Screws
//Version 2.0
//Licence: CC-0
//Author: Remi Sarrailh <remi@madnerd.org>

$fn = 30; //Increase resolution of cylinder

module screw(z=2,screw_z=4,upper=false){
        if(upper){
            translate([0.5,0.5,screw_z]) cube([3,3,z]);
            translate([2,2,0]) cylinder(h=screw_z,r1=1,r2=1);
        } else {
            translate([0.5,0.5,0]) cube([3,3,z]);
            translate([2,2,z]) cylinder(h=screw_z,r1=1,r2=1);
        }      
}

module vertical_screw(y=3,z=2,screw_z=4,upper=false){
    y=y-1;
    for(a=[0:y])
      translate([0,4*a,0])
      screw(z=z,screw_z=screw_z,upper=upper);
}

module horizontal_screw(x=3,z=2,screw_z=4,upper=false){
    x=x-1;  
    for(a=[0:x])  
        translate([4*a,0,0])
        screw(z=z,screw_z=screw_z,upper=upper);
}

//screw(z=2,screw_z=4,upper=false);
//horizontal_screw(x=3,z=2,screw_z=4,upper=true);
//vertical_screw(y=3,z=2,screw_z=4);
