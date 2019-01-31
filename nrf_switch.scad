//NRF Switch
//Version 2.0
//Licence: CC-0
//Author: Remi Sarrailh <remi@madnerd.org>

use <base/panelas.scad>
use <base/espacios.scad>
use <base/protos.scad>

move(x=0.8,y=1.2,z=2) color("brown") import("components/stripboard5_7cm.stl");

espacios(14,20);