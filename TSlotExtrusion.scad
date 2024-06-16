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
cornerRadius = 0;



 module tSlotExtrusion(length) 
{
    linear_extrude(length)
    {
        difference()
        {
            square([extrusionWidth, extrusionWidth], true);
            circle(d = holeDia);

            for(i = [0,90,180,270])
            {
                rotate([0,0,i])
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
            }
        }
    }
}

module gusset()
{



}

tSlotExtrusion(100);

//T Slot Extrusion
//Eric Moderbacher
//6/10/24