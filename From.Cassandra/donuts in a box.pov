#include "colors.inc"
#include "woods.inc"

camera{
        location <0,-5,3>
        look_at <0,0,1>
        up <0,0,1>
        right <1.33,0,0>
}

light_source{
        <0,0,10>
        color White
        jitter
        area_light x,y,10,10
}

plane{
        <0,0,1>, 0
        pigment{
                checker
        }        
}

sky_sphere {
    pigment {
      gradient z
      color_map {
        [ 0.5  color CornflowerBlue ]
        [ 1.0  color MidnightBlue ]
      }
      scale 2
      translate -1
    }
  }                               

sor{
        5,
        <3,-.01>
        <.01,0>,
        <3, .1>,
        <3, 1>,
        <2.9, 1.1>
        open
        texture{ T_Wood1 scale 3}
        rotate 90*x
}

#declare Donut = torus{
        1,.5
        finish{
                diffuse 0
                phong 1
                reflection 1
        }        
}

object{
        Donut
        rotate x*90
        translate <1.5,1,.3>
}

object{
        Donut
        rotate <90,-30,-20>
        translate <-.5,1.3,1>
}

object{
        Donut
        scale .8
        rotate x*90
        translate <-.3,-1.2,.3>
}                                                                                      