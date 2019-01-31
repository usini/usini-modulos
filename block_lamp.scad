// Base
use <base/block.scad>
use <base/espacios.scad>
use <base/panelas.scad>
use <base/protos.scad>
use <base/screw.scad>


//move(x=1) espacios();

//espacios(x=4,y=4,z=2,fillet=true);

/*
difference(){
    espacios();
    move(x=1) block_espacios(x=2,y=1);
}
*/

difference(){
    panelas(x=12,y=12,z=4,fillet=true);
    move(x=1,y=1) block_panelas(x=10,y=10,z=3);
}
//block_panelas(x=8,y=8,z=2);

//panelas(x=4,y=4,z=2,fillet=true);
//screw(z=2,screw_z=4,upper=false);
//horizontal_screw(x=3,z=2,screw_z=4,upper=false);
//vertical_screw(y=3,z=2,screw_z=4);
