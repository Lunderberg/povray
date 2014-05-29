#include "metals.inc"
#include "woods.inc"

global_settings{
    //photons{ count 20000 }
    assumed_gamma 1.0
}

camera{
    location <-3,2,-3>
    look_at <0,0,0>
}

#declare n = 10;

#declare ball =
    sphere{
        <0,0,0>,1
        texture{
            pigment{rgb 0.1}
            normal{bumps 0.2 scale 0.2}
            finish{
                reflection 1
                phong 0.1
            }
        }
        photons{
            target
            reflection on
        }            
    }
    
#declare floortexture =
    texture{
        pigment{
            crackle
            pigment_map{
                [0.0 rgb <.52,.25,.08>]
                [1.0 rgb <.60,.32,.18>]
            }
        }
        scale 0.3
    }                    
    
#declare walltexture =
    texture{
        T_Wood19
        scale 5
    }    
    

light_source{
    <0,5,-5>
    rgb 1
    spotlight
    point_at <0,0,0>
    radius 5
    falloff 15
    area_light x,<0,.7,.7>,10,10
    adaptive 2
}

difference{
    box{<-5,-5,-5>,<5,1,5>}
    box{<-3,-9,-3>,<3,9,3>}
    texture{walltexture}
}

box{
    <-4,-10,-4>,<4,-4,4>
    texture{floortexture}
}

//Horizontal ring
#declare i=0;
#while (i<n)
    object{
        ball      
        scale 0.25
        translate <1,0,0>
        rotate y*((360/n)*clock+i*360/n)
    }
    #declare i=i+1;    
#end

//Skewed ring
#declare i=0;
#while (i<n)
    object{
        ball
        scale 0.25
        translate <0,1,0>
        rotate x*((360/n)*clock+i*360/n)
        translate <0,0,1>
        rotate z*-30
    }
    #declare i=i+1;
#end