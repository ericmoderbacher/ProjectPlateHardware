include<TSlotExtrusion.scad>


module theCube()
{

cube([extrusionWidth + 4,5,40],true);

}

module firstShape()
{

    difference()
    {        
        theCube();
        hull()
        {
        intersection()
        {

            theCube();
            

            translate([0,-10,-40])tSlotExtrusion(100);
        }
        }
        
        
  
    }
}

module gusset()
{
difference()
{

  rotate([90,0,0])firstShape();
  translate([0,-10, -.50])cylinder(h=6,d = 5,true);
  translate([0, 10, -.50])cylinder(h=6,d = 5,true);
  }

}



gusset();
