#include "colors.inc"
#include "functions.inc"
#include "stones.inc"

camera{
        location <0,3,-3>
        look_at <0,0,0>
}

light_source{
        <10,20,-10>
        rgb 1
}

#declare f_pig =
        function{
                pigment{
                        agate
                        pigment_map{
                                [0 rgb 0]
                                [1 rgb 1]
                        }
                }
        }                        
  
#macro rock(big_number)
        isosurface{
                function{
                        f_sphere(x,y,z,1)+1.5*(f_noise3d(x+big_number,y,z)-0.5)
                        + .25*f_pig(x+big_number,y,z).gray
                }
                max_gradient 6
                contained_by{box{-2,2}}
                
                texture{T_Grnt6}        
        }
#end

object{rock(0)}

object{
        rock(10)
        scale .35
        translate <1.3,0,-.5>
}

object{
        rock(-10)
        scale .55
        translate <-2,-.25,-.25>
}

object{
        rock(20)
        scale 3
        translate <-1,0,5>
}        

isosurface{
        function{
                y+1 + .25*(f_noise3d(x,y,z)-.5)
                + .1*f_pig(x,y,z).gray
        }
        contained_by{sphere{0,10}}
        max_gradient 10
        
        texture{T_Grnt6}
}

cylinder{
        <0,0,0>,<0,-1,0>,15
        texture{
                pigment{rgbt <0,0,1,.6>}
                normal{ripples 2}
                finish{reflection .1}
        }                
}                