#include "colors.inc"
#include "eric.inc"

camera{
        location <0,0,-6+3*clock>
        look_at <0,0,0>
}

#declare proportion=
        1/(exp(10*(clock-.7))+1);


sphere{
        <0,0,0>,5
        pigment{rgbt 1}
        hollow
        interior{
                media{
                        scattering{2, .2*proportion}
                        //intervals 7
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
                        density{
                                spherical
                                density_map{
                                        [0 rgb 1]
                                        [1 rgb 0]
                                }
                                scale exp(pow(clock,4))-1
                                turbulence <clock,1-clock,1>
                        }        
                }
        }
}

object{
        prophet(4-3*proportion,0)
        scale .25
}