#include "colors.inc"
#include "functions.inc"

camera{
        location <0,3,-5>
        look_at <0,0,0>
}

light_source{
        <5,10,-3>
        rgb 1
}

/*
sphere{
        <0,0,0>, 1
        pigment{
                crackle
                form <1,1,-1>
                metric 1
                pigment_map{
                        [0 rgb 0]
                        [1 rgb 1]
                }
                scale .2
        }
}*/

isosurface{
        function{
                y +
                .1*cos(10*sqrt(x*x+y*y+z*z))//*exp(-sqrt(x*x+y*y+z*z))
        }
        contained_by{
                box{-2,2}
        }
        max_gradient 2
        
        pigment{color White}
}                        