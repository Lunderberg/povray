#include "colors.inc"
#include "woods.inc"

camera{
        location <0,3,-5>
        look_at <0,0,0>
}

cylinder{
        <0,1,0>,<0,0,0>,2
        pigment{color Red}
}

light_source{
        <10,15,3>
        rgb 1
}

sky_sphere{
        pigment{
                bumps
                color_map{
                        [0.0 color White]
                        [0.1 rgb <.6,.6,.9>]
                }
                frequency 20
                turbulence 1
                sine_wave
        }
}                