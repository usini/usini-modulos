use <protos.scad>

//Espacios 
//Version 2.0
//Licence: CC-0
//Author: Remi Sarrailh <remi@madnerd.org>

module espacios(x=4,y=4,z=2,fillet=true){
    x = x-1;
    y= y-1;
    for(a=[0:x])
        translate([4*a,0,0])
        if(a==0 && fillet) {protos_fillet(z=z,bottom_left=true);}
        else if(a==x && fillet) {protos_fillet(z=z,bottom_right=true);}
        else{protos(z=z);};
    for(a=[1:y]) 
        translate([0,4*a,0]) 
        if(a==y && fillet) {protos_fillet(z=z,top_left=true);}
        else{protos(z=z);}
    for(a=[1:x]) 
        translate([4*a,4*y,0]) 
        if(a==x && fillet) {protos_fillet(z=z,top_right=true);}
        else{protos(z=z);}
    for(a=[1:y-1]) 
        translate([4*x,4*a,0])
        protos(z=z);
        //if(a==x+2 && fillet) {protos_fillet(z=z,top_right=true);}
        //else{protos(z=z);}
}

//espacios(x=4,y=4,z=2);

