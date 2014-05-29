#include "colors.inc"
#include "woods.inc"

camera{
        location <0,3,-3>
        look_at <0,0,0>
}        

light_source{
        <10,10,0>
        color White
        area_light 3*x,3*z,5,5
        adaptive 1
        jitter
}

light_source{
        <-10,10,0>
        color White
        area_light 3*x,3*z,5,5
        adaptive 1
        jitter
}                

#declare striped= 
        pigment{
                radial pigment_map{
                        [0.0 color White]
                        [0.1 color White]
                        [0.1 color Violet]
                        [0.2 color Violet]
                        [0.2 color White]
                        [0.3 color White]
                        [0.3 color NeonPink]
                        [0.4 color NeonPink]
                        [0.4 color White]
                        [0.6 color White]
                        [0.6 color Violet]
                        [0.7 color Violet]
                        [0.7 color White]
                        [0.8 color White]
                        [0.8 color NeonPink]
                        [0.9 color NeonPink]
                        [0.9 color White]
                }        
        }

sphere{
        <0,0,0>, 1
        
        //  This section makes the sphere look like a beach ball.
        pigment{
                gradient y
                pigment_map{
                        [0.0 color White]
                        [0.02 color White]
                        [0.02 striped]
                        [0.98 striped]
                        [0.98 color White]
                        [1.0 color White]                
                }
                translate <0,-1/2,0>
                scale 2
        }
        finish{
                phong 1
                reflection .1
        }        
        
        
        
                        
}

plane{
        <0,1,0>,-1
        texture{T_Wood1}
}                