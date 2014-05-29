#include "colors.inc"

camera{
    location <2,3,-5>
    look_at <0,0,0>
}

light_source{
    <50,50,-50>
    rgb 1
}

parametric{
    function{u*sin(v)}
    function{v/5}
    function{u*cos(v)}
    
    <0.1,0>,<1.0,3*pi> 
    contained_by{
        box{-2,7}
    }
    
    pigment{
        granite
        pigment_map{
            [0 rgb 0]
            [1 rgb <0,1,0>]
        }
    }
    finish{ambient 0.2}    
}

plane{
    y,0
    pigment{
        granite
        pigment_map{
            [0 rgb 0]
            [1 rgb 1]    
        }
    }
}            