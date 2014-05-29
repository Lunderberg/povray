#include "colors.inc"
#include "eric.inc"

camera{
        location <0,0,-10>
        look_at <0,-2,0>
}

light_source{
        <0,50,50>
        rgb 1
}

#declare boundary=
        text{
                ttf "arial.ttf" "Elisira" .1,0
                translate <-1.25,0,0>
                scale 3*<1,-1,1>
                rotate <-45,0,0>
        }

#declare stream = seed(1);
#declare minimum = .2;
                                      

#declare loop =1;
#declare Norm = <0,0,0>;
#while(loop<=500)
        #declare height = rand(stream)*10-5;
        #declare theta = rand(stream)*2*pi;
        #declare ray = <0,cos(theta),sin(theta)>;
        #declare center = trace(boundary, <height,0,0>+2*ray,-ray,Norm);
        
        #if (vlength(Norm)!=0)
                object{
                        shiny(3*<rand(stream),rand(stream),rand(stream)>)
                        scale .04
                        translate center
                }
                #declare loop=1;
                
                
                #declare boundary=
                        object{
                                boundary
                                clipped_by{
                                        sphere{center,minimum inverse}
                                }
                        }                                        
                
                /*        
                #declare boundary=
                        difference{
                                object{
                                        boundary
                                }
                                sphere{
                                        center,minimum
                                }
                        }
                */
        #end
                                        
        #declare loop=loop+1;
#end  

plane{
        y,-3
        pigment{color White}
}                