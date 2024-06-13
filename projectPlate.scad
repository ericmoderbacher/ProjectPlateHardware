module projectPlate(x, y, z)
{
    $fn = 90; //make the circle smoother

    // Measurements in millimeters. 
    topMargin = 7.0; 
    rightMargin = 4.0;
    bottomMargin = 6.0;
    leftMargin = 3.0; 

    holeDia = 8.0;
    holeSpacing = 10.0;

    plateHeight =  7.0;
    // Measurments in millimeters end

    //counts
    numberOfColumns = 61;
    numberOfRows = 33;
    //counts end

    //calculated values
    spanBetweenHoles = holeSpacing - holeDia;

    plateWidth = leftMargin + rightMargin + (numberOfColumns * holeDia) + ((numberOfColumns - 1) * spanBetweenHoles);
    plateDepth = topMargin + bottomMargin + (numberOfRows * holeDia) + ((numberOfRows - 1) * spanBetweenHoles);
    //calculated values end

    module holeGrid(radius)
    {
        for (i = [0:numberOfColumns-1], j = [0:numberOfRows-1])
        {
            translate([(i * holeSpacing) + leftMargin + radius, (j * holeSpacing) + bottomMargin + radius])
            circle(r = radius);
        }
    }

    linear_extrude(height = plateHeight)
    difference()
    {
        square([plateWidth, plateDepth]);
        holeGrid(holeDia / 2);
    };
}

//Project Plate
//Eric Moderbacher
//6/10/24



