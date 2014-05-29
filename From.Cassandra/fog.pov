#include "colors.inc"

camera{
        location <0,2,-10>
        look_at <0,0,0>
}

light_source{
        <-10,0,0>,.5
        spotlight
        point_at <0,0,0>
}        

difference{
        sphere{0,5}
        
        sphere{<0,0,0>,1}
        
        pigment{rgbt <1,1,1,1>}
        hollow
        interior{
                media{
                        scattering{
                                1,.1 extinction 1
                        }
                        density{
                                bozo
                                density_map{
                                        [0.0 rgb 0]
                                        [1.0 rgb 1]
                                }
                                turbulence 1
                        }
                }
                media{
                        emission .05
                        density{
                                bozo
                                density_map{
                                        [0 rgb 0]
                                        [1 rgb 1]
                                }
                        }                               
                }                
        }                                
}

sphere{
        <0,0,0>,1
        hollow
        pigment{rgbt <1,1,1,1>}
        interior{
                ior 1.3
        }
        normal{bumps 1 scale .2}       
}

                                                                  