use <../base/protos.scad>
use <../base/panelas.scad>
use <../base/espacios.scad>

module tsop_stripboard(){
    translate([8,10,1]) color([0.2,0.2,0.2]) import("tsop.stl");
    translate([3,3,0]) color("brown") rect(10,15,1);
}

module tsop_bottom(){
    difference(){
    espacios(5,6,fillet=false);
    translate([8,-1,-1]) color("red") rect(8,6,6);
    }
}

module tsop_top(){
    difference(){
        panelas(5,6,fillet=false);
        translate([7,5,-1]) rect(6,8,6);
    }
    
}

module tsop(components=components){
    tsop_bottom();
    translate([0,0,2]) tsop_bottom();
    translate([0,0,2]) tsop_top();

    if(components){
        translate([2,1.5,0]) tsop_stripboard();
    }
}

components=true;
tsop();

//tsop_bottom(); //x2
//tsop_top(); //x1