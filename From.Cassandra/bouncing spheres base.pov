#include "glass.inc"

light_source{
        <5,5,-5>
        rgb 1
}

#declare thick = .1;
difference{
        box{-1-thick/2, 1+thick/2}
        box{-1+thick/2, <1-thick/2,3,1-thick/2>}
        
        texture{T_Glass1}       
        
}

#declare r_s = .15;
#declare r_c = .1;
union{
        sphere{<-1,-1,-1>,r_s}
        sphere{<-1,-1,1>,r_s}
        sphere{<-1,1,-1>,r_s}
        sphere{<-1,1,1>,r_s}
        sphere{<1,-1,-1>,r_s}
        sphere{<1,-1,1>,r_s}
        sphere{<1,1,-1>,r_s}
        sphere{<1,1,1>,r_s}
        
        cylinder{<-1,-1,-1>,<-1,-1,1>,r_c rotate z*0}
        cylinder{<-1,-1,-1>,<-1,-1,1>,r_c rotate z*90}
        cylinder{<-1,-1,-1>,<-1,-1,1>,r_c rotate z*180}
        cylinder{<-1,-1,-1>,<-1,-1,1>,r_c rotate z*270}
        
        cylinder{<-1,-1,-1>,<1,-1,-1>,r_c rotate x*0}
        cylinder{<-1,-1,-1>,<1,-1,-1>,r_c rotate x*90}
        cylinder{<-1,-1,-1>,<1,-1,-1>,r_c rotate x*180}
        cylinder{<-1,-1,-1>,<1,-1,-1>,r_c rotate x*270}
        
        cylinder{<-1,-1,-1>,<-1,1,-1>,r_c rotate y*0}
        cylinder{<-1,-1,-1>,<-1,1,-1>,r_c rotate y*90}
        cylinder{<-1,-1,-1>,<-1,1,-1>,r_c rotate y*180}
        cylinder{<-1,-1,-1>,<-1,1,-1>,r_c rotate y*270}
        
        pigment{rgb <0,0,1>}
        normal{ripples 1 scale .05}
        finish{
                phong 1
                reflection .2
                metallic
        }        
}


plane{
        y, -5
        pigment{rgb 1}
}                      
  
camera{
        location <0,3,-3>
        look_at <0,0,0>
}