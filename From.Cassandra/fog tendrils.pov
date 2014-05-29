#include "colors.inc"
#include "shinies.inc"

camera{
        location <0,0,-3.1>
        look_at 0
}        

sphere{
        0,3
        pigment{color Clear}
        hollow
        interior{
                media{
                        emission 1
                        density{
                                spherical
                                density_map{
                                        [0 rgb 0]
                                        [1 rgb 1]
                                }
                                turbulence <0,1,0>
                        }
                }
        }
}

object{
        prophet(1,0)
        scale .1
}                                                        