#include "colors.inc"

global_settings{
        photons{
                count 20000
        }
}                

camera{
        location <0,0,0>
        look_at <0,1,0>
        up <0,1,0>
        right <-1.33,0,0>
}

light_source{
        <2,1,.5>
        color White
//        area_light y, z, 10, 10
        fade_distance 3
        fade_power 3
        photons{
                reflection on
        }                        
}

plane{
        <0,0,1>,-1
        pigment{
                checker color Blue color White
        }
}

plane{
        <0,0,1>,1
        pigment{
                checker color Blue color Yellow
        }
        rotate z*45
}                       

sphere{
        <0,3,0>, 1
        texture{
                pigment{
                        color White
                }
                finish{
                        ambient 0
                        //diffuse 1
                        phong .1
                        reflection{
                                rgb <1,1,1>
                        }                                     
                }
                normal{
                        bumps 3 scale .1
                }                    
        }
        photons{
                target
                reflection on
        }            
}                                                                                                                                                              