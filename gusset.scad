include<TSlotExtrusion.scad>

gussetContactLength = 40;

module 0th() 
{
 //echo( "hello world!"); //well for this program anyways
}

module 1th(littleExtra = 0)
{
cube([extrusionWidth + 4,5+littleExtra,gussetContactLength+littleExtra],true);
0th(); //aw i dont have to include this for things to work thats cute
}

module 2th()
{
        hull()
        {
            intersection()
            {
                1th(littleExtra = 1);
                translate([0,-10,-gussetContactLength])tSlotExtrusion(100);
            }
        }
}

module 3th()
{
    difference()
    {        
        1th();
        2th();
    }
}

module 4th() 
{
    difference()
    {
        rotate([90,0,0])3th();
        translate([0,-10, -.50])cylinder(h=6,d = 5,true);
        translate([0, 10, -.50])cylinder(h=6,d = 5,true);
    }
}

module 5th()
{
    intersection()
    {
        rotate([-45,0,0])
        {
            union()
            {
                4th();
                translate([0,gussetContactLength/2,gussetContactLength/2])rotate([90,0,0])4th();
            }
        }
        translate([-50,-50,-sqrt(pow(10,2)+pow(10,2))])cube([100,100,40],false); //
    }
}

module 6th(shift = 1)
{
    difference()
    {
        5th();
        cube([extrusionWidth,1000,1000],true);
        translate([(extrusionWidth/2)*shift,0,0])cube([extrusionWidth, 1000,1000],true);
    }


}
module 7th(shift = 1)
{
    union()
    {
        5th();
        hull()6th();
        hull()6th(-1);
    }
    

}

module nth(){
//you update this when you add the a newer function on top of it. (or have the compiler set it using the highest numbered function here.
7th();

}

module gusset()
{ 
    nth();  //LOL this is a way to do fusions timeline!
}

gusset();

//Eric Moderbacher
//6/12/24ish
