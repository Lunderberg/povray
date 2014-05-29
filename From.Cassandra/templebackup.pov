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

#declare r=
        250 - 185*linear_step(clock,-5,5,1) - 45*linear_step(clock,10,15,1);
        
#declare theta=
        pi/6 + (11*pi/6)*linear_step(clock,5,10,1);
        
#declare height=
        -15 + 35*step(clock,5,1) -10*step(clock,13,3);

camera{
        location <35,25,-60>
        look_at <0,0,side/2>
        
        //location <3,2,side/2-3>
        //look_at <0,0,side/2>
}

light_source{
        <25,20,-15>*10
        rgb .5
}

object{
        prophet(1,0)
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
                        [1 rgb 1]
                }
                turbulence <1,0,1>
                scale side/2
        }                

//Fog inside temple.
sphere{
        <0,0,0>,side
        pigment{rgbt 1}
        hollow
        interior{
                media{
                        emission .1
                        density{temple_fog}
                }
                media{
                        absorption .5
                        density{temple_fog}
                }                        
        }
        translate <0,0,side/2>
        
        clipped_by{sphere{prophet_place,1 inverse}}
}                                                                                                                           

//Stars
sky_sphere{
        pigment{
                granite
                color_map{
                        [0 rgb 1]
                        [.1 rgb 1]
                        [.2 rgb 0]
                }
                turbulence 2
                scale .1
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