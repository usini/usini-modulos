use <nrf.scad>
use <nano_microusb.scad>
use <../base/panelas.scad>
use <../base/block.scad>
use <../base/protos.scad>

module mini_nrf(){
    
    //translate([0,0,4]) 
    //rotate([0,0,90])
    // translate([17,-12,-1])
    // import("nrf24l01.stl");
}

module nano_microusb_nrf_bottom(){
    difference(){
        translate([20,12,0]) nrf_bottom();
        move(5,3) block_panelas(1,9,8); //Resized border
        move(5,3,6) block_panelas(6,9,3); //Resized screw
    }
    translate([24,0,0]) rotate([0,0,90]) nano_microusb_bottom();
    
}

module nano_microusb_nrf_top(){
   translate([24,0,0]) rotate([0,0,90]) nano_microusb_top();
   difference(){
    translate([20,12,2]) nrf_top();
    move(5,3) block_panelas(1,9,3);
   }
}

module nano_microusb_nrf(){
    nano_microusb_nrf_bottom();
    translate([0,0,4]) nano_microusb_nrf_top();

        color("grey")        
        rotate([0,0,90]) translate([17,-12,-1])
        translate([14,-20,4])
        import("nrf24l01.stl");

        translate([24,0,0]) rotate([0,0,90])
        translate([26,12,0]) color("white") import("nano_microusb.stl"); 

}

nano_microusb_nrf();

//nano_microusb_nrf_bottom(); //X1
//nano_microusb_nrf_top(); //X1