#include "colors.inc"

camera{
        up <0,1,0>
        right <-4/3,0,0>
        sky <0,0,1>
        location <3,-20,5>
        look_at <0,0,5>
}

union{
        box{<-1,-1,0>,<1,1,11>}
        box{<-4,-1,8>,<4,1,6>}
        pigment{
                gradient x
                scale 3
                sine_wave
                pigment_map{
                        [0 rgb <0,0,1>]
                        [1 rgb <.7,.3,.3>]
                }
                turbulence 1 
        }               
}                

light_source{
        <5,-5,10>
        rgb 1
}                        

sky_sphere{
        pigment{
                granite
                pigment_map{
                        [0 rgb <1,0,0>]
                        [1 rgb <0,1,0>]
                }
        }        
}                