include<projectPlate.scad>;
include<TSlotExtrusion.scad>;
use<gusset.scad>;


module placeOnPlateCorners()
{
    for(i = 
    [
    [0 , +40, 0],
    [0 , plateWidth - extrusionWidth -40, 0],
    [0,plateWidth - extrusionWidth -40, plateDepth - extrusionWidth],
    [0,+40, plateDepth - extrusionWidth]
    ]
    )
    {
        translate([i[1], i[2] ,0])rotate([0,0,i[0]])children();
    }
}


module leg()
{
    translate([extrusionWidth/2,extrusionWidth/2,plateHeight])color("silver")tSlotExtrusion(209);
    translate([extrusionWidth,extrusionWidth/2,209-extrusionWidth+plateHeight])rotate([135,0,90])color("brown")gusset();
    translate([0,extrusionWidth/2,209-extrusionWidth+plateHeight])rotate([135,0,270])color("brown")gusset();
}

module folderRails()
{
    folderRail();
    translate([0, plateDepth-extrusionWidth,0])folderRail();
}
module folderRail()
{
    translate([0,(extrusionWidth/2),209+(extrusionWidth/2)+plateHeight])rotate([0,90,0])color("silver")tSlotExtrusion(plateWidth);
    
}







color("dimGrey")projectPlate();

placeOnPlateCorners()
{
    leg();
};
folderRails();
    



//Eric Moderbacher
//6/10/24