#include "colors.inc"

global_settings{
        photons{
                count 10000
        }
}                        

camera{
        location <0,5,-7>
        look_at <0,3,0>
}

light_source{
        <5,20,0>
        color White
        photons{
                refraction on
        }        
}

#declare champagne_flute =
        difference{
                sor{
                        11
                        <0,-.05>
                        <1.4,0>
                        <.3,.2>
                        <.2,.3>
                        <.2,.4>
                        <.2,1>
                        <.3,4>
                        <.6,6>
                        <1,8>
                        <.9,10>
                        <.6,12>
                }

                sphere{
                        <0,0,0>,1
                        scale <.9,3,.9>
                        translate <0,9,0>
                }
        }
        
#declare champagne_saucer=
        difference{
                sor{
                        10
                        <0,-.05>
                        <1,0>
                        <.4,.1>
                        <.2,.2>
                        <.2,1.4>
                        <.4,1.6>
                        <.6,2.5>
                        <1.4,3.3>
                        <1.3,4>
                        <1,4.5>
                }
                sphere{
                        <0,0,0>,1
                        scale <1.4,(5/6),1.4>
                        translate <0,3.6,0>
                }
                pigment{rgbt <.4,.4,.4,.7>}
                finish{
                        phong 1
                        reflection .3
                }
                interior{ior 1.3}
                photons{
                        target
                        refraction on
                }                
        }
        
object{
        champagne_saucer
        pigment{rgbt <.4,.4,.4,.7>}
        finish{
                phong 1
                reflection .3
        }
        interior{ior 1.3}
        photons{
               target
               refraction on
        }
}                