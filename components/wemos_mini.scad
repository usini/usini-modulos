//Wemos Mini
//Version 2.0
//Licence: CC-0
//Author: Remi Sarrailh <remi@madnerd.org>

use <../base/panelas.scad>
use <../base/espacios.scad>
use <../base/protos.scad>
use <../base/block.scad>
use <../base/screw.scad>

g_x = 8;
g_y = 9;

module wemos_mini_bottom_1(){
    panelas(x=g_x,y=g_y,z=1,fillet=false);
    move(2,1,0) block_panelas(x=g_x-4,y=g_y-1,z=1); //Remove holes
    
    /* SCREWS */
    move(y=6) vertical_screw(z=1,screw_z=6);
    move(x=7,y=6) vertical_screw(z=1,screw_z=6);
    move(x=6) screw(z=1,screw_z=6);
    move(x=1,y=7) screw(z=1,screw_z=6);
}

module wemos_mini_bottom_2(){
    move(2,8,0) block_panelas(x=g_x-4,y=1,z=1); //Remove holes
    
    difference(){
        panelas(x=g_x,y=g_y,z=1,fillet=false);
        
        move(2,1,0) block_panelas(x=g_x-4,y=g_y-2,z=1); //Hole for wemos
    }
    
    
}

module wemos_mini_bottom_3(){

    difference(){
        panelas(x=g_x,y=g_y,z=1,fillet=false);
        move(0.5,0,0) block_panelas(x=g_x-1,y=g_y-0.5,z=1); //Hole for wemos
    }
    protos(x=1);
}

module wemos_mini_top_1(){
    move(2,7,0) block_panelas(x=g_x-4,y=2,z=2); //Remove holes
     difference(){
        panelas(x=g_x,y=g_y,z=2,fillet=false);
         
        /* Holes */
        move(1,1,0) block_panelas(x=g_x-2,y=g_y-3,z=2); //Wemos      
        move(3,0,0) block_panelas(x=2.3,y=1,z=2); //MicroUSB
        move(1) block_panelas(x=1); //Reset
        move(0,3) block_panelas(x=1,y=2); //Cables (left)
        move(g_x-1,3) block_panelas(x=1,y=2); //Cables (right)
    }
}

module wemos_mini_top_2(){
    move(2,7,0) block_panelas(x=g_x-4,y=2,z=1); //Remove holes
     difference(){
        panelas(x=g_x,y=g_y,z=2,fillet=false);      
        move(1,1,0) block_panelas(x=g_x-2,y=g_y-3,z=2); //Hole for wemos      
        move(3,0,0) block_panelas(x=2.3,y=1,z=2); //MicroUSB
        move(1) block_panelas(x=1); //Reset
        move(0,3) block_panelas(x=1,y=2); //Cables (left)
        move(g_x-1,3) block_panelas(x=1,y=2); //Cables (right)
    }
}

module wemos_mini_top_3(){
     move(2,7,0) block_panelas(x=g_x-4,y=2,z=2); //Remove holes
     difference(){
        difference(){
            panelas(x=g_x,y=g_y,z=2,fillet=false);
            move(0,3) block_panelas(x=1,y=2,z=1); //Cables (left)
            move(g_x-1,3) block_panelas(x=1,y=2,z=1); //Cables (right)
            move(1,1,0) block_panelas(x=g_x-2,y=g_y-3,z=2);
            
        }
        move(3,0,0) block_panelas(x=2.3,y=1,z=1);
    }
}

module wemos_mini_top(){ //z=6  
   wemos_mini_top_1();
   move(z=2) wemos_mini_top_2();
   move(z=3) wemos_mini_top_3();  
}

module wemos_mini_bottom(){ //z=2
    wemos_mini_bottom_1();
    move(z=1) wemos_mini_bottom_2();
    move(z=2) wemos_mini_bottom_3();
    
}

module wemos_mini(){ 
    wemos_mini_bottom();
    move(z=2) wemos_mini_top();

    color("blue")
    translate([3,0.5,2.5]) 
    import("wemos_mini.stl");
}

wemos_mini();
//wemos_mini_bottom(); //(TP)
//wemos_mini_top(); //(TP)