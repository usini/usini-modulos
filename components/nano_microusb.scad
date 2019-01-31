//nano_microusb
//Version 2.0
//Licence: CC-0
//Author: Remi Sarrailh <remi@madnerd.org>

use <../base/protos.scad>
use <../base/panelas.scad>
use <../base/block.scad>
use <../base/screw.scad>

g_x=12;
g_y=6;
g_z=6;

module nano_microusb_bottom_1(){
    difference(){
        panelas(g_x,g_y,fillet=false);
        move(1,1) block_panelas(10.9,g_y-2); //nano
    }
    move(1) screw();
    move(1,5) screw();
    move(10) screw();
    move(10,5) screw();
}

module nano_microusb_bottom_2(){
    difference(){
        panelas(g_x,g_y,fillet=false);
        move(0.5,0.5) block_panelas(11.4,5); //nano
        move(11,2) block_panelas(1,2); //microusb
        move(6,0) block_panelas(2,1); //Cables passthought (left)
        move(6,5) block_panelas(2,1); //Cables passthought (right)
    }
}

module nano_microusb_bottom(){
    nano_microusb_bottom_1();
    move(z=2) nano_microusb_bottom_2();
}

module nano_microusb_top(){
    difference(){
        panelas(g_x,g_y,fillet=false);
        move(2,0.5) color("red") block_panelas(8,5); //nano 
        move(10,2) block_panelas(2,2); //microusb   
    }
    move(1,1) block_panelas(1,4);
    move(10,1) block_panelas(2,1);
    move(10,4) block_panelas(2,1);
}

module nano_microusb(){
    nano_microusb_bottom();
    move(z=4) nano_microusb_top();
    
    move(6.5,3) color("white") import("nano_microusb.stl"); 
}

nano_microusb();
//nano_microusb_bottom(); //x1 (TP)
//nano_microusb_top(); //x1 (TP)
