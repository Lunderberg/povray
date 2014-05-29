#include "colors.inc"

global_settings{
        photons{
                count 10000
        }
}                

camera{
        location <0,5,-3>
        look_at <0,0,0>
}

plane{
        <0,1,0>,0
        pigment{color White}
}

light_source{
        <3*sin(0-2*pi*clock+sin(12*pi*clock)/6),2/3,3*cos(0-2*pi*clock+sin(12*pi*clock)/6)>
        color White
        photons{
                refraction on
        }
        area_light x/5,y/5,10,10
        adaptive 1
        fade_distance 3
        fade_power 1
}

light_source{
        <3*sin(2*pi/3-2*pi*clock+sin(12*pi*clock)/6),2/3,3*cos(2*pi/3-2*pi*clock+sin(12*pi*clock)/6)>
        color White
        photons{
                refraction on
        }
        area_light z/5,y/5,10,10
        adaptive 1
        fade_distance 3
        fade_power 1
}

light_source{
        <3*sin(4*pi/3-2*pi*clock+sin(12*pi*clock)/6),2/3,3*cos(4*pi/3-2*pi*clock+sin(12*pi*clock)/6)>
        color White      
        photons{
                refraction on
        }
        area_light z/5,y/5,10,10
        adaptive 1
        fade_distance 3
        fade_power 1        
}

sphere{
        <0,0,0>,.5
        pigment{rgbt <1,0,pow(sin(3*pi*clock),2),.7>}
        interior{
                ior 1.3
                fade_distance .25
                fade_power 2
                fade_color <1,0,pow(sin(3*pi*clock),2)>
        }        
        photons{
                target
                refraction on
        }
        normal{bumps 1 scale .1}
        finish{
                phong 1
                reflection .2
        }
        rotate <0,-360*clock,0>
        translate <2*sin(0+2*pi*clock-sin(12*pi*clock)/6),.5,2*cos(0+2*pi*clock-sin(12*pi*clock)/6)>                
        
}

sphere{
        <0,0,0>,.5
        pigment{rgbt <pow(sin(3*pi*clock),2),1,0,.7>}
        interior{
                ior 1.3
                fade_distance .25
                fade_power 2
                fade_color <pow(sin(3*pi*clock),2),1,0>
        }
        photons{
                target
                refraction on
        }
        normal{bumps 1 scale .1}
        finish{
                phong 1
                reflection .2
        }
        rotate <0,-360*clock,0>
        translate <2*sin(2*pi/3+2*pi*clock-sin(12*pi*clock)/6),.5,2*cos(2*pi/3+2*pi*clock-sin(12*pi*clock)/6)>
}

sphere{
        <0,0,0>,.5
        pigment{rgbt <0,pow(sin(3*pi*clock),2),1,.7>}
        interior{
                ior 1.3
                fade_distance .25
                fade_power 2
                fade_color <0,pow(sin(3*pi*clock),2),1>
        }
        photons{
                target
                refraction on
        }
        normal{bumps 1 scale .1}
        finish{
                phong 1
                reflection .2
        }
        rotate <0,-360*clock,0>
        translate <2*sin(4*pi/3+2*pi*clock-sin(12*pi*clock)/6),.5,2*cos(4*pi/3+2*pi*clock-sin(12*pi*clock)/6)>
}               