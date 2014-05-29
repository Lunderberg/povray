#include "colors.inc"

camera{
    location <0,1,0>
    look_at <0,0,5>
}

light_source{
    <5,5,-5>
    rgb 1
}

plane{
    y,-2
    pigment{
        checker rgb <1,0,0>, rgb <0,1,0>
    }
}

sphere{
    <-2,0,4>, 1
    pigment{
        rgb 0
    }
    finish{
        reflection .9
    }  
    normal{
        bumps 0.1 scale 0.1
    }    
}

sphere{
    <0,0,4>, 1
    pigment{
        rgb 0
    }
    finish{
        reflection .9
    }      
}

sphere{
    <2,0,4>, 1
    pigment{
        rgb 0
    }
    finish{
        reflection .9
    }
    normal{
        granite 0.1 scale 0.1
    }        
}