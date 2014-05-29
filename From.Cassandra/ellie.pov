#include "colors.inc"
#include "eric.inc"
#include "functions.inc"

#declare word_pigment=
        pigment{
                agate
                pigment_map{
                        [0 rgbt <1,0,0,.3>]
                        [1 rgbt <0,0,1,.3>]
                }
        }                

#macro sphere_pack(thing, r,rotation)
        
        #local thing= object{thing rotate rotation}
        #local start=min_extent(thing);
        #local stop=max_extent(thing);
        
        union{
                #local xoffset=0;
                #local zoffset=0;
                
                #local current=start;
                #while (current.y <= stop.y+r)
                        #local current = <current.x, current.y, start.z - (r*sqrt(3)/3)*(.5-.5*pow(-1,zoffset))>;
                        #while (current.z <= stop.z+r)
                                #local current = <start.x - r*(.5 - .5*pow(-1,xoffset)), current.y, current.z>;
                                #while (current.x <= stop.x+r)
                                        
                                        #local test_shape =
                                                intersection{
                                                        object{thing}
                                                        sphere{current, r/100}
                                                }        
                                                                                        
                                        #local Norm = <0,0,0>;
                                        #local temp = trace(test_shape, current+<1,1,1>, <-1,-1,-1>, Norm);
                                        
                                        #if (vlength(Norm)!=0)
                                                sphere{
                                                        current,r
                                                        pigment{rgb eval_pigment(word_pigment, current)}
                                                        finish{reflection 1 phong .1}                              
                                                }
                                        #end         
                                
                                        #local current = <current.x+2*r, current.y, current.z>;
                                #end
                                #local xoffset=xoffset+1;
                                #local current = <current.x, current.y, current.z + r*sqrt(3)>;
                        #end
                        #local zoffset=zoffset+1;
                        #local current= <current.x, current.y + r*(2/3)*sqrt(6),current.z>;
                #end 
                
                rotate -rotation
        }
#end 

camera{
        location <0,2,-5>
        look_at <0,0,0>
}

light_source{
        <5,5,-15>
        rgb 1
}

#declare words=
        union{
                text{ ttf "arial.ttf" "You are" .35 0 translate <.75,0,0>} 
                text{ttf "arial.ttf" "magnificent," .35 0 translate <0,-1.25,0>}
                text{ttf "arial.ttf" "Ellie." .35 0 translate <1.5,-2.5,0>}        
        
                pigment{word_pigment scale 2}
                translate <-2.5, 1.25, 0>
        }
        
object{
        sphere_pack(words, .04, 20)
}

cylinder{
        -10*y, -11*y, 50
        pigment{rgb 1}
        normal{bumps 1 scale .5}
}

        