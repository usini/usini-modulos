use <components/nano_microusb_nrf.scad>
use <components/tsop.scad>
use <components/button_12mm.scad>
use <base/panelas.scad>
use <base/espacios.scad>
use <base/protos.scad>

module openlight_usb_bottom_1(){
    panelas(25,13);
}

module openlight_usb_bottom_2(){
   difference(){
    espacios(25,13);
    translate([28,42,-2]) rect(44,11,6);
   }
}

module openlight_usb_top_1(){
   espacios(25,13);
}


module openlight_usb_top_2_a(){
   translate([0,0,0]) color("blue") panelas(6,11,fillet=false); 
}

module openlight_usb_top_2_b(){
   translate([0,0,0]) color("magenta") panelas(11,11,fillet=false); 
}

module openlight_usb_top_2_c(){
   translate([0,0,0]) color("blue") panelas(6,11,fillet=false); 
}

module openlight_usb(){    
    openlight_usb_bottom_1();
    translate([0,0,2]) openlight_usb_bottom_2();
    translate([0,0,4]) openlight_usb_bottom_2();
    translate([0,0,6]) openlight_usb_bottom_2();
    translate([0,0,8]) openlight_usb_top_1();
    translate([0,0,10]) openlight_usb_top_1();
    translate([4,4,10]) openlight_usb_top_2_a();
    translate([28,4,10]) openlight_usb_top_2_b();
    translate([72,4,10]) openlight_usb_top_2_a();
      
    if(components){
        translate([28,4,2]) nano_microusb_nrf();
        rotate([0,0,90]) translate([4,-28,2]) tsop();
        translate([72,24,2]) button_12mm();
        translate([4,24,2]) button_12mm();
    }
}



components=true;
openlight_usb();

translate([0,0,-2]) corner_screw(screw_height=14); //x8 PRINTED
//vertical_screw(length=3,screw_height=18); //x2 PRINTED(4)
//nano_microusb_nrf_bottom(); //X1 //PRINTED
//nano_microusb_nrf_top(); //X1 //PRINTED (correction needed)

//button_12mm_bottom(); //x2 PRINTED
//button_12mm_bottom_2(); //x4 PRINTED 
//button_12mm_top(); //X2 PRINTED

//tsop_bottom(); //x2 PRINTED (correction needed)
//tsop_top(); //x1 PRINTED (correction needed)

//openlight_usb_bottom_1(); //x1 PRINTED 
//openlight_usb_bottom_2(); //x3 PRINTED 
//openlight_usb_top_1(); //x2 PRINTED 
//openlight_usb_top_2_a(); //x2 ...
//openlight_usb_top_2_b(); //x1 ...