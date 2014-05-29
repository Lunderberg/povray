#include "colors.inc"

camera{
        look_at <0,0,0>
        location <0,3,-5>
}

light_source{
        <10,10,-8>
        rgb 1
        area_light 5*x,5*y,50,50
        circular     
        orient
}

sphere{
        <1.25,1.3,0>,1
        pigment{rgb <1,0,0>}
}

plane{
        y,-3
        pigment{rgb 1}
}                