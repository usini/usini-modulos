//Wemos Mini (with nrf)
//Version 2.0
//Licence: CC-0
//Author: Remi Sarrailh <remi@madnerd.org>

use <nrf.scad>
use <wemos_mini.scad>
use <../base/protos.scad>
use <../base/block.scad>

module wemos_mini_nrf_bottom(){
    move(7) nrf_bottom();
    wemos_mini_bottom();
}

module wemos_mini_nrf_top(){
    move(7,0,6) nrf_top();
    move(z=2) wemos_mini_top();
}

module wemos_mini_nrf(){
    wemos_mini_nrf_bottom();
    wemos_mini_nrf_top();
}

//wemos_mini_nrf();

wemos_mini_nrf_bottom(); //(TP)
wemos_mini_nrf_top(); // (TP)


    