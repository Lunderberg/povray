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
                
                intersection{
                        object{thing}
                        cylinder{
                                <0,0,0>,<0,0,.05>,5 rotate 20
                        }        
                        pigment{rgb 0}
                } 
                
                rotate -rotation
        }
#end 

camera{
        location <0,1.5,-5>
        look_at <0,.5,0>
        up y
        right 1.6*x
}

light_source{
        <5,5,-15>
        rgb 1
}

#declare words=
        union{
                text{ ttf "THR_____.ttf" "You are" .35 0 translate <.75,0,0>} 
                text{ttf "THR_____.ttf" "magnificent," .35 0 translate <0,-1.25,0>}
                text{ttf "THR_____.ttf" "Ellie." .35 0 translate <1.5,-2.5,0>}        
        
                translate <-2.5, 1.25, 0>
        }
        

/*
intersection{
        object{words}
        cylinder{
                <0,0,0>,<0,0,.05>,5
        }        
        pigment{rgb 1}
        rotate -20
}
*/
object{sphere_pack(words, .04, 20)}        

cylinder{
        -10*y, -11*y, 50
        pigment{rgb 1}
        normal{bumps .3}
        finish{ambient .3}
}

cylinder{
        -9*y, -8*y, 43
        pigment{rgbt 1}
        hollow
        interior{
                media{
                        absorption 1
                        density{
                                agate
                                density_map{
                                        [0 rgb <1,0,0>]
                                        [1 rgb <0,0,1>]
                                }
                                scale 30
                                sine_wave
                        }
                }
        }
}

sky_sphere{
        pigment{
                crackle
                pigment_map{
                        [0 rgb 0]
                        [.5 rgb 0]
                        [1 rgb <0,1,1>]
                }
                scale .01
        }
        pigment{
                granite
                pigment_map{
                        [0 rgb <1,1,0>]
                        [.25 rgbt <0,0,0,1>]
                }
        }                
}