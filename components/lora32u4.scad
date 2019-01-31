//lora32u4
//Version 2.0
//Licence: CC-0
//Author: Remi Sarrailh <remi@madnerd.org>

use <../base/panelas.scad>
use <../base/espacios.scad>
use <../base/protos.scad>
use <../base/screw.scad>
use <../base/block.scad>
use <femaleheader_serial.scad>

g_x=14;
g_y=8;
g_z=10;

module lora32u4_bottom_1(){
   espacios(g_x,g_y,fillet=false);   
   move(8) horizontal_screw(x=4,screw_z=g_z);
   move(8,7) horizontal_screw(x=4,screw_z=g_z);
   move(0,1) block_panelas(1,6);
}

module lora32u4_bottom_2(){
    difference(){
        espacios(g_x,g_y,fillet=false); 
        move(0,0.5,0) block_panelas(g_x-1,g_y-1);
    }
}

module lora32u4_top_1(){
    difference(){
        espacios(g_x,g_y,fillet=false);        
        move(1) block_panelas(4,1); //battery/cables
        move(1,g_y-1) block_panelas(4,1); //battery/cables
        move(0.25,4.8) block_panelas(1,1); //spacing for capacitor
        move(0,3) block_panelas(1,2.3); //microusb
    }
}

module lora32u4_top_2(){
    difference(){
        espacios(g_x,g_y,fillet=false); 
        move(1) block_panelas(4,1); //battery/cables
        move(1,g_y-1) block_panelas(4,1); //battery/cables
        move(0,3) block_panelas(1,2.3,1); //microusb   
    } 
       
}

module lora32u4_top_3(){
    difference(){
        espacios(g_x,g_y,fillet=false);   
        move(1) block_panelas(4,1); //battery/cables
        move(1,g_y-1) block_panelas(4,1); //battery/cables 
    }
}

module lora32u4_top_4(){
    difference(){
        panelas(g_x,g_y,fillet=false);
        move(5,1) block_panelas(8,g_y-2); //placeholder for components   
    }
    move(0,1) block_panelas(5,g_y-2);
}

module lora32u4_top(){
    lora32u4_top_1();
    move(z=2) lora32u4_top_2();
    move(z=4) lora32u4_top_3();
    move(z=6) lora32u4_top_4();
}

module lora32u4_bottom(){
    lora32u4_bottom_1();
    move(z=2) lora32u4_bottom_2();
    
}

module lora32u4(){
    lora32u4_bottom();
    move(z=4) lora32u4_top();

    color([0.3,0.3,0.3]) scale([0.86,1,1]) translate([0,5,3.8])import("lora32u4.stl");
}

lora32u4();
//lora32u4_bottom(); //x1 (TP)
//lora32u4_top(); //x1 (TP)
