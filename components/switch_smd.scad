use <../base/panelas.scad>
use <../base/espacios.scad>
use <../base/protos.scad>

module switch_smd(){
    if(case && !components_only){
        panelas(4,6,1,fillet=false);
        difference(){
            translate([0,0,1]) espacios(4,6,fillet=false);
            translate([-2,8,0]) rect(8,8,12); //Cables
        }
        difference(){
            translate([0,0,3]) espacios(4,6,1,fillet=false);
            translate([-2,8,0]) rect(8,8,12); //Cables
        }
    }
    
    if(components){
        color("cyan")
        translate([13,4.5,1.4])
        rotate([0,0,90])
        import("switch_smd.stl");
    }
}

case = true;
components = false;
components_only = false;
switch_smd();
