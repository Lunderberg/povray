#include "colors.inc"

camera{
        location <0,1,-0.45>
        look_at <0,0,0>
}

light_source{
        <50,50,-50>
        rgb <1,1,1>
}

union{
        plane{y,0}
        height_field{
                png
                "C:\50000.png"
                translate <-0.5,0,-0.5>
                scale <1.3,0.25,1>
        }
        texture{
                pigment{
                        granite
                        pigment_map{
                                [0.0 rgb 0.5]
                                [1.0 rgb <.8,.6,.6>]
                        }
                        scale 0.25
                }
                //normal{bumps .25 scale 0.02}
                finish{phong 0.1}
        }
        translate z*0.1
        rotate x*-10             
}        