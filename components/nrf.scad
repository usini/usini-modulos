//nrf
//Version 2.0
//Licence: CC-0
//Author: Remi Sarrailh <remi@madnerd.org>

use <../base/panelas.scad>
use <../base/espacios.scad>
use <../base/protos.scad>
use <../base/block.scad>
use <../base/screw.scad>

g_x = 6;
g_y = 9;
g_z = 5;

module nrf_bottom_1(){
        panelas(x=g_x,y=g_y,z=2,fillet=false);
        move(1,1) blocks(x=4,y=7);
        move(0,6) vertical_screw(y=2,screw_z=g_z);
        move(5,6) vertical_screw(y=2,screw_z=g_z);
}

module nrf_bottom_2(){
    difference(){
        panelas(x=g_x,y=g_y,z=2,fillet=false);
        move(1,0.5,0) block_panelas(4,g_y-1); //Hole for components
        move(0,3,0) block_panelas(1,3);       //Cable pass (left)
        move(g_x-1,3,0) block_panelas(1,3);   //Cable pass (right)
    }
}

module nrf_top(){
    difference(){
        panelas(x=g_x,y=g_y,z=1,fillet=false);
        move(1,1,0) block_panelas(4,5);
    }
    move(1,6) blocks(4,2,1);
}

module nrf_bottom(){
    nrf_bottom_1();
    move(z=2) nrf_bottom_2();
    move(z=4) nrf_bottom_2();
}

module nrf(){
    nrf_bottom();
    move(z=6) nrf_top();

    color("grey")
    rotate([0,0,90])
    translate([17,-12,2])
    import("nrf24l01.stl");  
}

nrf();

//nrf_bottom_1(); //x1 (TP)
//nrf_bottom_2(); //x1 (TP)
//nrf_top(); //x1 (TP)
