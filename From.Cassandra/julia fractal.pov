#include "colors.inc"

julia_fractal {
        <-0.083,0.0,-0.83,-0.025>
        quaternion
        sqr
        max_iteration 8
        precision 15
        slice <0,0,0,1>, clock

        pigment{
                color White
        }
        finish{
                diffuse .6
                reflection 1
        }                        
}

light_source{
        <1,1,1>
        color White
}       
        
camera{
        location <1.75,1.75,1.75>
        look_at <0,0,0>
}        
