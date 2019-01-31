//femaleheader_serial
//Version 2.0
//Licence: CC-0
//Author: Remi Sarrailh <remi@madnerd.org>

use <../base/panelas.scad>
use <../base/espacios.scad>
use <../base/protos.scad>

module rect(w,l,h){
    resize([w,l,h]) cube(4);
}

module femaleheader_serial_headers(){
    height=1.3;
    pos=-2.5;
    color("brown") translate([12.5,pos,height]) import("femaleHeader.stl"); //error margin
    color("brown") translate([11,pos,height]) import("femaleHeader.stl");
    color("brown") translate([7,pos,height]) import("femaleHeader.stl");
    color("brown") translate([9,pos,height]) import("femaleHeader.stl");
    color("brown") translate([5,pos,height]) import("femaleHeader.stl");
    color("brown") translate([3.5,pos,height]) import("femaleHeader.stl"); //error margin
}

module femaleheader_serial_stripboard(){
    color("red") translate([1.5,-2.5,0]) rect(13,1,4);
}

module femaleheader_serial_components(){
    translate([0,0,0]) femaleheader_serial_stripboard();
    translate([0,0,0]) femaleheader_serial_headers();
}


module femaleheader_serial_bottom(){
    panelas(6,4,fillet=false); 
    translate([4,0,0]) vertical_screw(3,screw_height=7);
    translate([0,12,0]) vertical_screw(0,screw_height=7);
    translate([20,12,0]) vertical_screw(0,screw_height=7);
}

module femaleheader_serial_top_1(){
    difference(){
        espacios(6,4,fillet=false); 
        color("red") translate([6,11,-1]) rect(12,6,4); //connector
        color("red") translate([8,-1,-1]) rect(8,6,4);  //Cables
    }   
    translate([0,0,2]) difference(){
        espacios(6,4,1,fillet=false); 
        color("red") translate([6,11,-1]) rect(12,6,4); //connector
    }   

    
}

module femaleheader_serial_top_2(){
       difference(){
        panelas(6,4,1,fillet=false); 
        color("red") translate([6,5,-1]) rect(12,2,6); //stripboard
    }  
}

module femaleheader_serial_top(){
    femaleheader_serial_top_1();
    translate([0,0,3]) femaleheader_serial_top_2();
}

module femaleheader_serial(){
    color("green") femaleheader_serial_bottom();
    color("yellow") translate([0,0,2]) femaleheader_serial_top();
    translate([4,8,2]) femaleheader_serial_components();
}

femaleheader_serial();

//femaleheader_serial_bottom(); //x1 
//femaleheader_serial_top(); //x1


