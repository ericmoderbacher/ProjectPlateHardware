include<TSlotExtrusion.scad>

gussetContactLength = 40;

module 0th() 
{
 echo( "let there be light"); //well for this program anyways
 
 // also a good place to explain whats going on here.
 // this branch of the code is to test out an idea where i use numbers as function names.
 
 // i guess a function pointer is also a way we already use numbers as names but in that case i dont know how often we get to pick the order of the pointer value when it compiled
}

module 1th()
{
cube([extrusionWidth + 4,5,gussetContactLength],true);
0th(); //aw i dont have to include this for things to work thats cute
}

module 2th()
{
    difference()
    {        
        1th();
        
        hull()
        {
            intersection()
            {
                1th();
                translate([0,-10,-gussetContactLength])tSlotExtrusion(100);
            }
        }
    }
}

module 3th() 
{
    difference()
    {
        rotate([90,0,0])2th();
        translate([0,-10, -.50])cylinder(h=6,d = 5,true);
        translate([0, 10, -.50])cylinder(h=6,d = 5,true);
    }
}

module 4th()
{
    intersection()
    {
        rotate([-45,0,0])
        {
            union()
            {
                3th();
                translate([0,gussetContactLength/2,gussetContactLength/2])rotate([90,0,0])3th();
            }
        }
        translate([-50,-50,-sqrt(pow(10,2)+pow(10,2))])cube([100,100,40],false); //
    }
}

module lastth()
{
    4th();
}
module nth(){
//you update this when you add the a newer function on top of it. (or have the compiler set it using the highest numbered function here.
4th();

}

module gusset()
{ 
    nth();  //LOL this is a way to do fusions timeline!
}

gusset();
