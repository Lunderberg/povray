#include "colors.inc"
#include "functions.inc"
#include "woods.inc"

global_settings{
        photons{
                count 100000
        }
}                

#declare pig =
        pigment{
                agate
                color_map{
                        [0 rgb <1,0,0>]
                        [1 rgb <0,0,1>]
                }
        }                        

#declare i=-5;
#while (i<=5)
        #declare j=-5;
        #while (j<=5)
                sphere{
                        #declare spot = <i,j,0>;
                        <i,j,0>,.5
                        //pigment{eval_pigment(pig, <i,j,0>)}
                        pigment{pig}
                        finish{
                                //reflection .9
                                reflection{eval_pigment(pig,<i,j,0>)}
                                metallic
                                phong .2
                        }        
                        photons{
                                target
                                reflection on
                        }        
                }
                #declare j=j+1;
        #end
        #declare i=i+1;
#end

camera{
        location <0,-4,-15>
        look_at <0,0,0>
}

light_source{
        <5,5,-5>
        rgb 1
        photons{reflection on}
        area_light x,y, 15, 15
        adaptive 1
        jitter
}

plane{
        z,.5
        texture{T_Wood1 scale 5 rotate 10000}
}        