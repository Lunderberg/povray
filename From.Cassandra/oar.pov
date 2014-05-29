#include "colors.inc"
#include "woods.inc"

camera{
        location <3,2,-4>
        look_at <0,0,0>
}

light_source{
        <0,10,0>
        color White
        area_light x, z,5,5
        adaptive 1
        jitter
}
#declare oar =
union{
        cylinder{
                <0,0,0>,<0,0,10>,.25
        }

        superellipsoid{
                <1,.5>               
                scale .25
                translate <0,0,10>
        }

        cone{
                <0,0,0>, .25
                <0,0,-1>, 0
        }

        superellipsoid{
                <.25,.25>
                scale <1,.1,2>
                translate <0,0,-1>
        }
}

object{
        oar
        texture{T_Wood1}
        finish{
                phong 1
                reflection .1
        }        
}

union{
        plane{<0,1,0>,-1}
        plane{<1,0,0>,-2}
        plane{<0,0,1>,15}
        pigment{checker color White color Black}
}                                                                                                