#include "colors.inc"
#include "eric.inc"

camera{
        location <0,0,-6>
        look_at <0,0,0>
}

sphere{
        <0,0,0>,5
        pigment{rgbt 1}
        hollow
        interior{
                media{
                        scattering{2, .2}
                        intervals 7
                        density{
                                spiral1 1
                                density_map{
                                        [0 rgb <0,0,0>]
                                        [1/6 rgb <1,0,0>]
                                        [1/3 rgb <1,1,0>]
                                        [1/2 rgb <0,1,0>]
                                        [2/3 rgb <0,1,1>]
                                        [5/6 rgb <0,0,1>]
                                        [1 rgb <0,0,0>]
                                }
                                turbulence (exp(2*clock)-1)/1.5
                                scale 3
                        }        
                }
        }
}

object{
        prophet(4*clock,0)
        scale .25
}

/*
light_source{
        <0,10,-5>
        rgb 1
}

cylinder{
        <0,0,0>,<0,0,1>,2
        pigment{
                spiral1 1
                pigment_map{
                        [0 rgb <0,0,0>]
                        [1/6 rgb <1,0,0>]
                        [1/3 rgb <1,1,0>]
                        [1/2 rgb <0,1,0>]
                        [2/3 rgb <0,1,1>]
                        [5/6 rgb <0,0,1>]
                        [1 rgb <0,0,0>]
                }
        }
}
*/