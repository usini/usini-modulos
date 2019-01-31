//OpenLight Wifi
//Version 2.0
//Licence: CC-0
//Author: Remi Sarrailh <remi@madnerd.org>

// Base
use <base/block.scad>
use <base/espacios.scad>
use <base/panelas.scad>
use <base/protos.scad>
use <base/screw.scad>
// Elements
use <components/wemos_mini_nrf.scad>
use <components/ws2812b.scad>
use <components/switch_smd.scad>

g_x=21;
g_y=10;
g_z=11;

module openlight_bottom_1(){
    panelas(g_x,g_y);
    move(1,7,0) blocks(x=19,y=2); //No hole up
    move(1,1,0) blocks(x=19,y=5); // No hole down
    move(1,6,0) blocks(x=16,y=1); // No hole (leds screws)
    move(6,0,0) blocks(x=5,y=1); //No hole (wemos)
}

module openlight_bottom_2(){
    difference(){
        espacios(g_x,g_y);            
        move(x=5) block_espacios(x=13,y=1,z=10);    
    }
}

module openlight_top_1(){
        espacios(g_x,g_y,z=2);
}

module openlight_top_2(){    
    blocks(g_x,g_y,fillet=true); 
    move(z=-g_z) screws();
}

module screws(){
    /* Screws */
    upper=true;
    horizontal_screw(x=6,screw_z=g_z,upper=upper);
    vertical_screw(y=9,screw_z=g_z,upper=upper);

    move(y=9) horizontal_screw(x=g_x,screw_z=g_z,upper=upper);
    move(x=11) horizontal_screw(x=g_y,screw_z=g_z,upper=upper);
    move(x=g_x-1) vertical_screw(y=g_y,screw_z=g_z,upper=upper);

    move(x=17,y=6) horizontal_screw(screw_z=g_z,upper=upper); //screw for leds   
}

module openlight(){   
    openlight_bottom_1();     
    move(z=2) openlight_bottom_2(); 
    move(z=4) openlight_bottom_2(); 
    move(z=6) openlight_bottom_2(); 
    move(z=8) openlight_bottom_2();
    move(z=9) openlight_top_1();
    move(z=11) openlight_top_2();
    components();
}

module components(){
        color("red") move(5,0,2) wemos_mini_nrf(); 
        //Leds
        //move(1,2,9) ws2812b(leds=4);
    
        color("blue")
        translate([3,0.5,2.5]) 
        translate([20,0,2])
        import("components/wemos_mini.stl");
    
        color("grey")
        translate([48,0,2]) 
        rotate([0,0,90])
        translate([17,-12,2])
        import("components/nrf24l01.stl");  
}

components();
//openlight();

openlight_bottom_1(); //x1 //TP
//openlight_bottom_2(); //x4 //TP
//openlight_top_1(); //x1 //TP
//openlight_top_2(); //x1 //TP
