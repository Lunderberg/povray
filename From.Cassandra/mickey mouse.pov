#include "colors.inc"

plane{
        <0,0,1>, 0
        pigment{
                checker color White color Red
        }
}

camera{
        location <0,0,0>
        look_at <0,5,0>
        up <0,1,0>
        right <-1.33,0,0>
}

light_source{
        <0,0,1>
        color White
}

sphere{
        <0,5,0>, 1
        pigment{
                wood
                color_map{                      
                        [0.0 color Black]
                        [0.5 color Black]                        
                        [0.5 color Orchid]
                        [0.6 color Blue]
                        [0.7 color Green]
                        [0.8 color Yellow]
                        [0.9 color Orange]
                        [1.0 color Red]
                }                        
        }
}                                                