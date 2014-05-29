#include "colors.inc"

global_settings{
        max_trace_level 200
        adc_bailout 0
        ambient_light 0       
        photons{
                count 10000
        }
}                

camera{
        location <0,4,-4>
        look_at <0,0,0>
}

light_source{
        <-20,3,0>
        rgb <10,10,10>
        spotlight
        tightness 3
        radius .1
        falloff 1
        point_at <0,-1,0>
        
        photons{
                refraction on
        }        
}
        

plane{
        y,-1
        pigment{color White}
}

prism{
        linear_spline
        -1 1
        4
        <-1,-.5>,<1,-.5>,<0,sqrt(3)-.5>,<-1,-.5>
        
        pigment{rgbt <.3,.3,.3,.7>}
        scale <.5,1,.5>
        translate <0,0,-.1>
        
        interior{
                ior 1.3
                dispersion 1.1
        }
        photons{
                target
                refraction on
        }        
}                                