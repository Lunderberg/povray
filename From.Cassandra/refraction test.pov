#include "colors.inc"
#include "glass.inc"                     

global_settings{
        photons{
                count 20000
        }
}                

camera{
        location <0,5,-5>
        look_at <0,0,0>
}


light_source{
        <2,2,0>
        color White
        photons{
                refraction on
        }
        looks_like{
                sphere{
                        <0,0,0>, .25
                        pigment{color Red}
                        finish{ambient .5}
                }
        }                                
}

plane{
        <0,1,0>,0
        pigment{checker color Black color White}
}

sphere{
        <0,1,0>,1
        texture{T_Glass1
                //normal{bumps 1 scale .2} 
        }
        finish{F_Glass1}
        interior{
                ior 1.5
                dispersion 1.1
                dispersion_samples 100
        }
        photons{
                target
                refraction on}
}                
                                             