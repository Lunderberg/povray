#include "colors.inc"
#include "woods.inc"

light_source{
        <-2,10,4>
        color White
}

background{
        color Green}

camera{
        location <-5,1,0>
        look_at <0,-1,-1>
}

#declare boat=
        union{
                isosurface{
                        function{
                                pow(abs(x)-2,2)+pow(y,2)+pow(z-1,2)-4
                        }
                        contained_by{
                                box{<0,0,0>,<-3,-3,-3>}
                        }
                        max_gradient 8
                        open
                        scale <1,.25,1>      
                }
                isosurface{
                        function{
                                 pow(abs(x)-2,2)+pow(y,2)+pow(-z-1,2)-4
                                } 
                        contained_by{
                                box{0,<-3,-3,3>}
                        }
                        max_gradient 8
                        open
                        scale <1,.25,1>
                }        
        }                


object{
        boat
        texture{T_Wood1}
}
        
                                                                      
  
 
plane{
        <0,1,0>,-2
        pigment{
                checker color Black color White
        }
}                                                