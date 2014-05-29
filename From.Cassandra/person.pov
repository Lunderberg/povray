#include "colors.inc"
#include "functions.inc"      

camera{
        location <0,20,-30>
        look_at <0,0,0>
}

light_source{
        <5,30,-10>
        color White
}

blob{
        //Torso
        cylinder{
                <0,-1,0>,<0,1,0>,1
                1
                scale <3,6,1>
        }
        //Shoulders
        cylinder{
                <-3,7,0>,<3,7,0>,1
                1
        }     
        //Head
        cylinder{
                <0,8,0>,<0,12,0>,2
                1
        }
        //Arms
        cylinder{
                <-3,7,0>,<-6,0,0>,1
                1
        }
        cylinder{
                <-6,0,0>,<-6,-6,0>,1
                1
        }
        cylinder{
                <3,7,0>,<6,0,0>,1
                1
        }
        cylinder{
                <6,0,0>,<6,-6,0>,1
                1
        }
        //Legs
        cylinder{
                <-2,-6,0>,<-2,-20,0>,1
                1
        }
        cylinder{
                <2,-6,0>,<2,-20,0>,1
                1
        }
        
        threshold 0.01                
        pigment{color Flesh}
}

blob{
        sphere{
                <0,0,0>,1.1
                1
                scale <3.3,6,1>
                translate <0,-6,0>        
        }
        cylinder{
                <-2,-5,0>,<-2,-13,0>,1.1
                .7
        }
        cylinder{
                <2,-5,0>,<2,-13,0>,1.1
                1
        }
        threshold .01
                        
        pigment{color Blue}
        clipped_by{
                plane{y,-4}
        }
}                