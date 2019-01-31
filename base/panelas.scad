//Panelas
//Version 2.0
//Licence: CC-0
//Author: Remi Sarrailh <remi@madnerd.org>

use <protos.scad>
use <block.scad>

module panelas(x=4,y=4,z=2,fillet=true){
    x=x-1; //We started our loop at 0 not 1 so everything will be 1 block too large
    y=y-1;
    for(a=[0:x])
        translate([4*a,0,0])
    for(b=[0:y]) 
        translate([0,4*b,0]) 
        /*fillet management */
        if(a==0 && b==0 && fillet){protos_fillet(z=z,bottom_left=true);}  //Bottom_left
        else if(a==x && b==0 && fillet) {protos_fillet(z=z,bottom_right=true);} //Bottom Right
        else if(a==0 && b==y && fillet) {protos_fillet(z=z,top_left=true);} //Top Left
        else if(a==x && b==y && fillet) {protos_fillet(z=z,top_right=true);} //Top Right
        /*                  */
        else {protos(z=z);};
}

//panelas(x=4,y=4,z=2);

