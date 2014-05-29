#include "colors.inc"

global_settings{ambient_light 10}       

camera{
        location <0,0,-1>
        look_at <0,0,0>
}                

plane{
        z, 0
        texture{
                pigment{
                        agate
                        pigment_map{
                                [0 rgb 1]
                                [1 rgb 0]
                        } 
                        scale .25
                        translate z*clock*2
                }
        }
        /*
        texture{
                pigment{
                        granite
                        pigment_map{
                                [0 rgb <1,0,0>]
                                [1/5 rgb <1,1,0>]
                                [2/5 rgb <0,1,0>]
                                [3/5 rgb <0,1,1>]
                                [4/5 rgb <0,0,1>]
                                [1 rgb <1,0,1>]
                        }
                        translate z*100
                        translate z*clock/4
                }
        }        
        texture{
                pigment{
                        granite
                        pigment_map{
                                [0 rgbt 0]
                                [1 rgbt <0,0,0,1>]
                        }
                        translate z*clock/4
                }
        }
        texture{
                pigment{
                        granite
                        pigment_map{
                                [0 rgbt <1,1,1,0>]
                                [.25 rgbt 1]
                        }
                        translate z*-100
                        translate z*clock/4
                }
        }*/                                
}                                