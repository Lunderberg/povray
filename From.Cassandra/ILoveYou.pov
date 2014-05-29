#include "functions.inc"

camera{
    location <0,-20,10>
    look_at <0,0,0>
    right 1.33*x
    up z
    sky z
}

light_source{
    0.5*<100,-100,100>
    rgb 1
}

isosurface{
    function{f_heart(x,y,z,-0.01)}
    contained_by{ box{-1.3,1.3}}
    all_intersections
    rotate z*90
    scale 5              
    pigment{        
        granite
        pigment_map{
          [0 rgb <1,0,0>]
          [1 rgb <0.9,0.1,0.1>]
        }
        scale 5
    }    
}

box{
    <-100,-100,-15>,<100,100,100>
    pigment{checker rgb 0 rgb 0.25 scale 3}
    hollow
    rotate z*30
}