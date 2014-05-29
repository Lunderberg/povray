#include "colors.inc"
#include "transforms.inc"
#include "eric.inc"
#include "math.inc"

#declare bottom = -1000;
#declare ground = -15;

#declare followers = 10;
#declare hertz = 6;
#declare mini = 1.5;
#declare r0 = 1;

#declare xmax = 40;
#declare zmax = 40;
#declare xcof = pi/2;
#declare zcof = .5;

#declare confined = 45;
#declare start= -20;

#declare stream = seed(1);

camera{
        location <0,100,-50>
        look_at <0,0,0>
}

light_source{
        <0,50,0>
        rgb 1
}                





//Followers of the Prophet.  The prophet is i=0.
#declare n=followers;
#declare i=0;
#while (i<=n)
        #declare spot = <xmax*cos(xcof*(clock-i/hertz)), 0, zmax*sin(zcof*(clock-i/hertz))>;
        #declare forward = <-xcof*xmax*sin(xcof*(clock-i/hertz)), 0, zcof*zmax*cos(zcof*(clock-i/hertz))>;
        #declare r = r0*pow(1/mini,i/n);
        
        #if (i=0)
                object{
                        prophet(1,0)
                        Reorient_Trans(<0,0,-1>,forward)
                        translate spot
                }
        #else                 
                sphere{
                        <0,0,0>, r
                        Reorient_Trans(<0,0,-1>,forward)
                        translate spot
                                
                        pigment{rgbt <rand(stream),rand(stream),rand(stream),i/(n+1)>}
                        finish{
                                phong 1
                                reflection .2
                        }
                        normal{
                                bumps 1 scale .1
                        }                
                }
        #end
        
        #declare i = i+1;
#end

//Those confined to the Pit.
#declare n=confined;
#declare delta = (bottom-start)/(n+1);

#declare height = start;
#while (height > bottom)
        #declare r = rand(stream)*.4+.8;
        #declare first_spot = <(xmax-r)*(2*rand(stream)-1),height,(zmax-r)*(2*rand(stream)-1)>;
        #declare velocity = <xmax*(rand(stream)-.5),0,zmax*(rand(stream)-.5)>;
        
        #declare spot = first_spot+clock*velocity;
        #while (abs(spot.x)>xmax-r)
                #if (spot.x>0)
                        #declare spot = <2*(xmax-r)-spot.x,spot.y,spot.z>;
                #else
                        #declare spot = <-2*(xmax-r)-spot.x,spot.y,spot.z>;
                #end                
        #end
        
        #while (abs(spot.z)>zmax-r)
                #if (spot.z>0)
                        #declare spot = <spot.x,spot.y,2*(zmax-r)-spot.z>;
                #else
                        #declare spot = <spot.x,spot.y,-2*(zmax-r)-spot.z>;
                #end
        #end                
        
        
        #declare shade = <rand(stream),rand(stream),rand(stream)>+<clock,0,0>; 
        sphere{
                spot,r
                pigment{rgbt <shade.x,shade.y,shade.z,.9>}
        }
        light_source{
                spot
                rgb shade
                fade_distance 10
                fade_power 1
        }                        
        #declare height = height+delta;
#end      


//Ground and pit, sans bottom.
union{
        plane{y,ground+.0000001
                clipped_by{
                        box{<-xmax,ground+1,-zmax>,<xmax,ground-1,zmax> inverse}
                }
        }
        
        union{
                plane{-z,-zmax}
                plane{z,-zmax}
                plane{x,-xmax}
                plane{-x,-xmax}
                clipped_by{plane{y,ground}}
        }
        hollow
        
        pigment{color White}                       
}


//Bottom of pit.  Black in case fog doesn't take everything.
plane{
        y, bottom
        pigment{color Black}
}

//Fog holder
box{
        <-xmax-1,ground-5,-zmax-1>,<xmax+1,bottom-1,zmax+1>
        pigment{rgbt 1}
        
        hollow
        interior{
                media{
                        absorption .005
                }
        }
}