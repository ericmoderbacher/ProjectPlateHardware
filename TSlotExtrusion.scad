//measurments in mm
//from zyltech.com's image (2020TslotProfileFromZyltech.jpg)
extrusionWidth = 20;

slotMouthWidth = 6.2;
slotMouthChamferWidth = 7.2; //sorry about the name, best i could come up with per the image

slotWidthWidest = 11;

slotDepth = 6.12; //measument I had to take myself... wtf zyltech
dumbSlotDepth = 4.3; //not to outer surface

holeDia = 5;
//measuments in mm end

//missing from drawing
cornerRadius = 1.5;

 $fn=50;

module aCorner(i)
{
    translate([(extrusionWidth/2)-(slotDepth/2),0,0])
        {
            hull()
                {
                    square([slotDepth-dumbSlotDepth,slotWidthWidest],true);
                    translate([-slotDepth/4,0,0])square([slotDepth/2, slotMouthWidth],true);
                }
            square([slotDepth, slotMouthWidth],true);
        }
}

module theCorners()
{
    for(i = [0,90,180,270])
    {
        rotate([0,0,i])
            {
                aCorner(i);
            }
    }
}


module tSlotProfile(length)
{
    difference()
    {
        minkowski()
        {
          square([extrusionWidth-(cornerRadius), extrusionWidth-(cornerRadius)],true);
          circle(d=cornerRadius);
        }
        
        circle(d = holeDia);
        theCorners();
    }
}


module tSlotExtrusion(length)
{
    linear_extrude(height = length, convexity = 20)
    {
    tSlotProfile();
    }
}

//tSlotExtrusion(100);

//T Slot Extrusion
//Eric Moderbacher
//6/10/24