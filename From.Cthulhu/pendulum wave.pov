#include "metals.inc"

camera{
    location <0,-30,0>
    look_at <0,0,-5>
    right 1.33*x
    up z
    sky z
}

light_source{
    <50,-75,150>
    rgb 1
}

plane{
    z,-20
    pigment{
        checker
        rgb 1
        rgb 0.5
    }    
}

#macro pendulum(length)
    union{
        sphere{
            <0,0,-length>
            0.25
            texture{T_Chrome_1A}
        }       
        cylinder{
            <0,0,0>, <0,0,-length>, 0.01
            texture{T_Gold_1A}
        }   
    }         
#end

#declare g = 150;
#declare x_naught = 1;

#declare n=15;

#declare i=1;
#while (i<=n)   
    #declare length = i*i/25;
    #declare max_theta = atan(x_naught/length);
    #declare theta_dot = sqrt(g/length);     
    object{
        pendulum(length)
        rotate (180/pi)*max_theta*cos(theta_dot*clock)*y
        translate -i*y
    }
    #declare i=i+1;
#end