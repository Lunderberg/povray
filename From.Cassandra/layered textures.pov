#include "colors.inc"

camera{
        location <0,0,-5>
        look_at <0,0,0>
}

light_source{
        <10,10,-2>
        color White
}

sphere{
        0,1
        
        texture{
                pigment{
                        gradient y
                        pigment_map{
                                [0.0 color Black]
                                [1.0 color White]
                        }
                        triangle_wave
                }
        }
        texture{
                pigment{
                        gradient x
                        pigment_map{
                                [0.0 color Red]
                                [1.0 color Clear]
                        }
                        triangle_wave
                }
        }
        texture{
                pigment{
                        bozo
                        pigment_map{
                                [0.0 color Flesh]
                                [0.3 color Flesh]
                                [0.4 color Clear]
                        }
                        scale .2
                        turbulence 1
                }         
        }                                                      
}                                        