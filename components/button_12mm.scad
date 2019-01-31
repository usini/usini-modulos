//button_12mm
//Version 2.0
//Licence: CC-0
//Author: Remi Sarrailh <remi@madnerd.org>

use <../base/protos.scad>
use <../base/panelas.scad>
use <../base/espacios.scad>
use <../base/block.scad>
use <../base/screw.scad>

module button_12mm_stripboard(){
    color([0.2,0.2,0.2]) translate([0,0,1]) import("button_12mm.stl");
    translate([-0.5,-4,0]) color ("brown") blocks(3.5,3.25,1);
}

module button_12mm_bottom(){
    panelas(6,6,fillet=false);
    move(1,1) blocks(4,4);
    move(0,2) vertical_screw(2);
    move(5,2) vertical_screw(2);
}

module button_12mm_top_1(){
    difference(){
        espacios(6,6,fillet=false);        
        move(2) block_panelas(2,1);  
    }
    
}

module button_12mm_top(){
    button_12mm_top_1();
    move(z=2) button_12mm_top_2();
}

module button_12mm_top_2(){
    difference(){
        panelas(6,6,fillet=false);
        move(2,2) block_panelas(2,2);        
    }
}

module button_12mm(){
    button_12mm_bottom();
    move(z=2) button_12mm_top();

    translate([5.5,9.6,2]) button_12mm_stripboard();
}

button_12mm();

//button_12mm_bottom(); //x1 (TP)
//button_12mm_top(); //x1 (TP)