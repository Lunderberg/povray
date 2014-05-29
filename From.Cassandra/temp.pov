#include "colors.inc"

camera{
        location <0,3,-5>
        look_at <0,0,0>
        focal_point <0,0,0>
        aperture .3
        blur_samples 20
}

light_source{
        <5,0,-3>
        rgb 1
}

sphere{
        <0,0,0> 1
        pigment{color Red}
}                        

plane{
        y,-1
        pigment{checker color White color Black}
        rotate y*45
        finish{
                reflection .3
        }        
}        