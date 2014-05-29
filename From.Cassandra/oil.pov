#include "colors.inc"
#include "woods.inc"
#include "glass.inc"

global_settings{
        photons{
                count 20000
                media 1
        }
}                

camera{
        location <0,5,-5>
        look_at <0,2,0>
}

light_source{
        <50,100,50>
        rgb 1
        photons{
                reflection on
                refraction on
        }        
}

lathe{
        cubic_spline
        13
        <-1,0>,<0,0>,<1,0>,<.25,.4>,<.15,.6>,
        <.1,1.3>,<.2,2>,<.6,4.1>,<.55,4.2>,<.5,4>,
        <.1,2>,<0,1.9>,<0,1.8>
        
        
        texture{
                pigment{rgbt .8}
                finish{
                        phong 1
                        irid{.075 thickness 2}
                }
        }
        interior{ior 1.3}
        photons{
                target
                refraction on
        }                
}

plane{
        y,0
        pigment{color White}
}        
  