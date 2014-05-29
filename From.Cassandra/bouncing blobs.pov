#include "colors.inc"
#include "functions.inc"                

global_settings{
        max_trace_level 50
}        

#declare n=400;
#declare r_s=1;


camera{
        location <0,12,-15>
        look_at <0,-5,0>
}

light_source{
        <-3,15,-10>
        rgb 1
        //area_light x,z,5,5
        //adaptive 1
        
        photons{refraction on}
}

#declare R1 = seed(10);

#declare i=1;
blob{
        #while(i<=n)
                #declare r_x = 10*sqrt(rand(R1));
                #declare r_z = 10*sqrt(rand(R1));
                #declare theta = 2*pi*rand(R1);
                #declare omegA = 10*(2*rand(R1)-1);
                
                sphere{
                        <r_x*cos(theta+clock*omegA),r_s/2,r_z*sin(theta+clock*omegA)>, r_s
                        strength 1 + .2*rand(R1)
                        
                        pigment{rgb 2*<rand(R1),rand(R1),rand(R1)>}
                        normal{bumps .5 scale .2}
                        finish{phong 1}        
                }
                #declare i=i+1;
        #end
}

#declare spokes = 7;

blob{
        #declare i=1;
        #while (i<=spokes)
                sphere{
                        <0,3,0>,1
                        strength 2
                        rotate z*360*i/spokes
                }
                cylinder{
                        <0,0,0>,<0,2.5,0>,.25
                        strength 2
                        rotate z*360*i/spokes
                }
                #declare i=i+1;
        #end        
        
        rotate 360*z*clock
        
        rotate x*30
        translate <0,4,-6>
        
        pigment{rgbt .8+.2*sin(2*pi*clock/2)}
        interior{ior 1.3}
        finish{phong 1}
}        
                                

#declare gamma_g = .25;

plane{
        y, -10
        pigment{
                granite
                pigment_map{
                        [0 rgb <.5+.5*sin(2*pi*clock), .5+.5*cos(2*pi*clock),0>*gamma_g]
                        [.25 + .15*sin(2*clock) rgb <0, .5+.5*sin(2*pi*clock), .5+.5*cos(2*pi*clock)>*gamma_g]
                        [.5 + .1*sin(10*clock) rgb <.5+.5*cos(2*pi*clock), 0, .5+.5*sin(2*pi*clock)>*gamma_g]
                        [.75 - .15*cos(clock) rgb <0, .5+.5*cos(5*pi*clock), .5+.5*sin(2*pi*clock)>*gamma_g]
                        [1 rgb <.5+.5*sin(10*pi*clock), .5+.5*cos(2*pi*clock), 0>*gamma_g]
                }
                scale 10
                translate 10*y*clock
        }                
        finish{
                reflection 1
                ambient 0
        }      
}                                