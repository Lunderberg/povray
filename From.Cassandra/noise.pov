#include "colors.inc"
#include "functions.inc"

camera{
        location <0,3,-3>
        look_at <0,0,1>
}

light_source{
        <1,10,-5>
        color White*.5
        area_light 2*x,2*z,10,10
        adaptive 1
        jitter
}

#declare pig=
        pigment{
                agate
                pigment_map{
                        [0 rgb 0]
                        [.2 rgb <1,0,0>]
                        [.4 rgb 0]
                        [.6 rgb <0,1,0>]
                        [.8 rgb 0]
                        [1 rgb <0,0,1>]
                }
        }                

#declare f_pig = function{
        pigment{
                pig
        }
}                        

isosurface{
        function{
                f_sphere(x,y,z,1) + 1*f_pig(x/2,y/2,z/2).gray
        }
        contained_by{
                box{-2,2}
        }
        max_gradient 37
        
        pigment{pig}
        finish{reflection .1 phong 1}
}

plane{
        y,-1.5
        pigment{checker color White color Black}
}        

plane{
        <1,0,-1>,-2
        pigment{rgb 0}
        finish{reflection 1}
}

plane{
        <1,0,1>,2
        pigment{rgb 0}
        finish{reflection 1}
}                                        