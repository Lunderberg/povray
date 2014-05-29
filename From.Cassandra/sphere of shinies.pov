#include "colors.inc"
#include "shinies.inc"
#include "functions.inc"

#declare limit =
        sphere{
                0,1        
        }        

#declare Norm=<0,0,0>;
#declare theta=0;
#declare shiny_sphere =
        union{
                #while (theta < 2*pi)
                        #declare phi=0;
                        #while (phi<pi)
                                #declare ray=
                                        <cos(theta)*sin(phi),cos(phi),sin(theta)*sin(phi)>;
                                #declare center =
                                        trace(limit,<0,.5,0>,ray,Norm);
                                #if (vlength(Norm)!=0)
                                        object{
                                                shiny(ray)
                                                scale .05
                                                translate center
                                        }
                                #end
                                #declare phi=phi+pi/10;
                        #end                          
                        #declare theta=theta+pi/10;
                #end
        }
        
object{
        shiny_sphere
        rotate z*-25
}        

camera{
        location <0,0,-5>
        look_at <0,0,0>
}

light_source{
        <0,20,0>
        color White
        area_light x*3,z*3,10,10
        adaptive 1
        jitter
}

plane{
        y,-1.5
        pigment{color White}
}                         