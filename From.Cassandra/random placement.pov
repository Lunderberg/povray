#include "colors.inc"
#include "functions.inc"
#include "shinies.inc"

global_settings{
        photons{
                count 1000000
        }
}                

#declare stream = seed(1);
#declare minimum = .1;

#declare boundary =
        isosurface{
                function{
                        f_heart(x,y,z,-.01)
                }
                contained_by{
                        box{-1.3,1.3}
                }
                rotate <0,90,90>
        }                                       

#declare loop =1;
#declare Norm = <0,0,0>;
#while(loop<=200)
        #declare height = rand(stream)*2-1;
        #declare theta = rand(stream)*2*pi;
        #declare ray = <sqrt(1-pow(height,2))*cos(theta),sqrt(1-pow(height,2))*sin(theta),height>;
        #declare center = trace(boundary, 0,ray,Norm);
        
        #if (vlength(Norm)!=0)
                object{
                        shiny(2*<rand(stream),rand(stream),rand(stream)>)
                        scale .04
                        translate center
                }
                #declare loop=1;
        #end        
        
        #declare boundary=
                object{
                        boundary
                        clipped_by{
                                sphere{center,minimum inverse}
                        }
                }                                        
        
        #declare loop=loop+1;
#end                

camera{
        location <0,1.5,-3>
        look_at <0,0,0>
        up <0,1,0>
        right <1.6,0,0>
}

light_source{
        <0,10,0>
        rgb 1
        area_light x,z,10,10
        photons{refraction on}
        rotate x*-45
}

plane{
        y,-1.3
        pigment{color White}
}                