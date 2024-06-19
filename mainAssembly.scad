include<projectPlate.scad>;
include<TSlotExtrusion.scad>;
use<gusset.scad>;

projectPlate();
translate([extrusionWidth/2,extrusionWidth/2,plateHeight]) tSlotExtrusion(100);
translate([extrusionWidth,extrusionWidth/2,100-extrusionWidth+plateHeight])rotate([135,0,90])gusset();

//Eric Moderbacher
//6/10/24