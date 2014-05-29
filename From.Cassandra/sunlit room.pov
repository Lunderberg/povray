#include "colors.inc"
#include "woods.inc"

global_settings{
        radiosity{}
        ambient_light 0
}                

difference{
        box{<-5.2,-.2,-5.2>,<5.2,5.2,5.2>}
        union{
                box{<-5,5,5>,<5,-2,-5>}
                
                box{-1,1 scale <3,.35,.35> translate <5,4,.5>}
                box{-1,1 scale <3,.35,.35> translate <5,4,-.5>}
                box{-1,1 scale <3,.35,.35> translate <5,3,.5>}
                box{-1,1 scale <3,.35,.35> translate <5,3,-.5>}
        }
        pigment{color White}
}
    
box{
        <-6,-1,-6>,<6,.1,6>
        texture{T_Wood23 scale 4}
        finish{
                reflection .3
                phong 1
                diffuse .2
                ambient .3
        }                
}                                

camera{
        location <4,2,-2>
        look_at <0,0,0>
}

light_source{
        <100,50,0>
        rgb 1
}

