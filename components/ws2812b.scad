//ws2812b
//Version 2.0
//Licence: CC-0
//Author: Remi Sarrailh <remi@madnerd.org>

use <../base/panelas.scad>
use <../base/espacios.scad>
use <../base/protos.scad>

module ws2812b_bottom(leds=1){
    panelas(leds*4+3,5,1,fillet=false);
}


module ws_led(pos=0){
    color("cyan")
    translate([14+(16*pos),10,1])
    import("ws2812b.stl");
}

module ws_leds(leds=1){
      leds = leds-1;
      for(a=[0:leds])
        ws_led(a);
}

module ws2812b(leds=1){
    ws2812b_bottom(leds);
    ws_leds(leds);
}

ws2812b();