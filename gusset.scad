include<TSlotExtrusion.scad>

gussetContactLength = 40;

module zerothShape()
{
cube([extrusionWidth + 4,5,gussetContactLength],true);
}

module firstShape()
{
    difference()
    {        
        zerothShape();
        
        hull()
        {
            intersection()
            {
                zerothShape();
                translate([0,-10,-gussetContactLength])tSlotExtrusion(100);
            }
        }
    }
}
module secondShape()
{
    difference()
    {
        rotate([90,0,0])firstShape();
        translate([0,-10, -.50])cylinder(h=6,d = 5,true);
        translate([0, 10, -.50])cylinder(h=6,d = 5,true);
    }
}

module gusset()
{
    intersection()
    {
        rotate([-45,0,0])
        {
            union()
            {
                secondShape();
                translate([0,gussetContactLength/2,gussetContactLength/2])rotate([90,0,0])secondShape();
            }
        }
        translate([-50,-50,-sqrt(pow(10,2)+pow(10,2))])cube([100,100,40],false); //
    }

}

gusset();
