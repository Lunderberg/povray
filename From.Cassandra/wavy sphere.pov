#include "colors.inc"

global_settings{
        photons{
                count 100000
        }
}                

camera{
        location <0,3,-3>
        look_at <0,0,0>  
        up <0,1,0>
        right <0,16/9,0>
}

light_source{
        <5,5,-5>
        rgb 1  
        spotlight
        point_at <0,0,0>   
        radius 1
        falloff 10
}  

light_source{
        <-5,5,-5>
        rgb 1  
        spotlight
        point_at <0,0,0>   
        radius 1
        falloff 10
}

light_source{
        <0,5,-15>
        rgb 1  
        spotlight
        point_at <0,0,0>   
        radius 1
        falloff 10
}

plane{
        y,-3
        pigment{
                granite
                pigment_map{
                        [0 rgb 1]
                        [1 rgb <.8,.8,.9>]
                }
        }                
}

sphere{
        <0,0,0>,1
        pigment{rgbt <1,1,1,.9>}
        normal{
                gradient y
                sine_wave
                scale .25
        }
        finish{
                reflection .2
                phong 1
        }
        photons{
                target
                refraction on
                reflection on
        }   
        interior{
                ior 1.3
                dispersion 1.1   
                dispersion_samples 50
        }    
        rotate x*60+y*60    
        rotate 360*y*clock
}                        