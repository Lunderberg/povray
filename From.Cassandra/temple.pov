#include "colors.inc"
#include "eric.inc"
#include "stones.inc"
#include "transforms.inc"

#declare x_frills=3;
#declare y_frills=1;
#declare frills=5;

#declare front=30;
#declare side = 50;
#declare height=5;

#declare pillar_height=15;
#declare pillar_radius=1.5;
#declare torus_radius=1;

#declare side_pillars=7;
#declare front_pillars=5;
#declare entrance=4;

#declare pool_depth = 1;
#declare pool_steps = 6;
#declare pool_steps_total_length = 5;

#declare stairs=5;
#declare x_stairs=7;
#declare stairs_length=10;

#declare prophet_place = <0,0,side/2>;
#declare prophet_light = .5*step(clock, 16.4,.1)-.5*step(clock,16.7,.3);
#declare prophet_transparency = 1 - .5*step(clock,16.4,.1)+.5*step(clock,16.7,.3);

#declare r=
        350 - 285*linear_step(clock,-5,5,1) - 50*linear_step(clock,10,15,1);        
#declare theta=
        7*pi/6 + (5*pi/6)*linear_step(clock,5,10,1) - (pi/2)*linear_step(clock,13,20,1);        
#declare cam_height=
        -50 + 70*step(clock,5,1) -13*step(clock,13,3);



camera{
        location <r*sin(theta),cam_height,-r*cos(theta)>+<0,0,side/2>
        look_at prophet_place - 50*<0,1-step(clock,4,1),0>
        
        //location <9,6,side/2-9>
        //look_at <0,0,side/2>
}

light_source{
        <25,20,-15>*10
        rgb .5
}

object{
        prophet(prophet_light,prophet_transparency)
        translate prophet_place
}        


//Blocks out lower stars.
cylinder{
        <0,-501,0>,<0,-500,0>,3000
        pigment{color Black}
}        

//Density of bottom fog
#declare bottom_fog=
        density{
                gradient y
                density_map{
                        [0 rgb 0]
                        [1 rgb 1]
                }
                sine_wave
                turbulence 1
                scale <50,50,50>
        }                

//Foggy bottom.
cylinder{
        <0,-500,0>,<0,-450,0>,3000
        pigment{rgbt 1}
        hollow
        interior{
                media{
                        emission .005
                        density{bottom_fog}               
                }
                media{
                        absorption .02
                        density{bottom_fog}
                }        
        }                                
}

//Density of fog inside temple.
#declare temple_fog =
        density{
                spherical
                density_map{
                        [0 rgb 0]
                        [.8 rgb .7]
                        [1 rgb .7]
                }
                turbulence <1,0,1>
                scale 3*side/4
        }                

//Fog inside temple.
sphere{
        <0,0,0>,side
        pigment{rgbt 1}
        hollow
        interior{
                media{
                        emission .2
                        density{temple_fog}
                }
                media{
                        absorption 1
                        density{temple_fog}
                }                        
        }
        translate <0,0,side/2>
        
        //Restricts fog to above platform.
        clipped_by{plane{-y height}}                
}                                                                                                                           

sky_sphere{
        pigment{
                granite
                color_map{
                        [0 rgb .7]
                        [.05 rgb .7]
                        [.1 rgb 0]
                }
                turbulence 2
        }
        pigment{
                granite
                color_map{
                        [0 rgbt <.7,.7,.7,.3>]
                        [.05 rgbt <.7,.7,.7,.3>]
                        [.1 rgbt 1]
                }
                turbulence 2
                scale .3
        }                                
}        


#declare unit_frill=
        intersection{
                union{                
                        #declare i=1;
                        #while (i<=frills)
                                #if (i!=frills)
                                        box{<(i-1)*x_frills/frills-0.1,-0.1,-0.1>,<i*x_frills/frills,(frills-i)*y_frills/frills,1.1>}
                                #end
                                cylinder{
                                        <0,0,-0.1>,<0,0,1.1>,1
                                        scale <x_frills/frills,y_frills/frills,1>
                                        translate <(i-1)*x_frills/frills,(1-i/frills)*y_frills,0>
                                }
                                #declare i =i+1;
                        #end
                }
                box{<0,0,0>,<x_frills,y_frills,1>}        
                
                translate <-x_frills/2,0,-.5>
        }
        


#declare corner=
        intersection{
                object{unit_frill scale <1,1,x_frills> rotate y*90}
                object{unit_frill scale <1,1,x_frills> translate <1,1,1>/10000}      
        }     

//Frill
union{
        object{corner translate <front/2,pillar_height,0>}
        object{corner rotate y*90 translate <-front/2,pillar_height,0>}
        object{corner rotate y*180 translate <-front/2,pillar_height,side>}
        object{corner rotate y*270 translate <front/2,pillar_height,side>}
        
        object{unit_frill translate <0,0,.5> scale <1,1,side-x_frills> translate <front/2,pillar_height,x_frills/2>}
        object{unit_frill rotate y*180 translate <0,0,.5> scale <1,1,side-x_frills> translate <-front/2,pillar_height,x_frills/2>}
        object{unit_frill scale <1,1,front-x_frills> rotate y*90 translate <0,pillar_height,0>}
        object{unit_frill scale <1,1,front-x_frills> rotate y*270 translate <0,pillar_height,side>}
        
        texture{T_Stone9}
}        


//Pillars
union{
        #declare i=1;
        #while (i<=front_pillars)
                #if (abs(-front/2+(i-1)*front/(front_pillars-1)) > entrance)
                        object{
                                pillar(pillar_height,pillar_radius,torus_radius,20,45)
                                translate <-front/2+(i-1)*front/(front_pillars-1),0,0>
                        }
                #end        
                object{
                        pillar(pillar_height,pillar_radius,torus_radius,20,45)
                        translate <-front/2+(i-1)*front/(front_pillars-1),0,side>
                }
                #declare i=i+1;
        #end
        
        #declare i=1;
        #while(i<=side_pillars)
                object{
                        pillar(pillar_height,pillar_radius,torus_radius,20,45)
                        translate <-front/2,0,(i-1)*side/(side_pillars-1)>
                }
                object{
                        pillar(pillar_height,pillar_radius,torus_radius,20,45)
                        translate <front/2,0,(i-1)*side/(side_pillars-1)>
                }
                #declare i=i+1;
        #end
        
        texture{T_Stone16}
}

//Base
difference{
        union{
                //Main part
                box{    <-front/2-2*(pillar_radius+torus_radius),-height,0>
                        <front/2+2*(pillar_radius+torus_radius),0,side+4*(pillar_radius+torus_radius)>
                }
                
                //Stairs
                #declare i=1;
                #while (i<=stairs)
                        box{<-x_stairs,-height,-(i-1)*stairs_length/stairs>,<x_stairs,-(i-1)*height/stairs,-i*stairs_length/stairs>}
                        #declare i=i+1;
                #end
                
                translate <0,0,-2*(pillar_radius+torus_radius)>
        }
        
        //Pool steps
        #declare i=1;
        #while (i<=pool_steps)
                box{    <-front/2+2*(pillar_radius+torus_radius), 1, 2*(pillar_radius+torus_radius)> + (i/pool_steps)*<pool_steps_total_length,0,pool_steps_total_length>
                        <front/2-2*(pillar_radius+torus_radius), 0, side-2*(pillar_radius+torus_radius)> + (i/pool_steps)*<-pool_steps_total_length,-pool_depth,-pool_steps_total_length>
                }
                #declare i = i+1;
        #end                
        
        texture{T_Stone15}
}

//Ground
cylinder{
        <0,-height,side/2>,<0,-height-5,side/2>,side
        
        pigment{        
                granite
                color_map{
                        [0.0 color Gray50]
                        [0.1 color Gray50]
                        [0.2 color MidnightBlue]
                        [0.8 color Black]
                        [1.0 color Black]
                }
                scale 5
                turbulence 1
        }
}