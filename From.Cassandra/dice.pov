#include "colors.inc"
#include "woods.inc"        
        
#declare die = 
        difference{
                superellipsoid{
                        .1
                        pigment{rgbt<0,0,1,.2>}
                        interior{
                                fade_distance .5
                                fade_power 2
                                fade_color <0,0,1>
                        }        
                        finish{
                                phong 1
                                reflection .1
                        }        
                }
                union{
                        //Side with 1
                        sphere{<0,0,-1.2>,.3}
                        //Side with 6
                        sphere{<.4,.5,1.2>,.3}
                        sphere{<.4,0,1.2>,.3}
                        sphere{<.4,-.5,1.2>,.3}
                        sphere{<-.4,.5,1.2>,.3}
                        sphere{<-.4,0,1.2>,.3}
                        sphere{<-.4,-.5,1.2>,.3}
                        //Side with 3
                        sphere{<0,1.2,0>,.3}
                        sphere{<-.4,1.2,.4>,.3}
                        sphere{<.4,1.2,-.4>,.3}
                        //Side with 4
                        sphere{<-.4,-1.2,-.4>,.3}
                        sphere{<.4,-1.2,-.4>,.3}
                        sphere{<-.4,-1.2,.4>,.3}
                        sphere{<.4,-1.2,.4>,.3}
                        //Side with 2
                        sphere{<1.2,-.4,.4>,.3}
                        sphere{<1.2,.4,-.4>,.3}
                        //Side with 5
                        sphere{<-1.2,0,0>,.3}
                        sphere{<-1.2,.4,.4>,.3}
                        sphere{<-1.2,.4,-.4>,.3}
                        sphere{<-1.2,-.4,.4>,.3}
                        sphere{<-1.2,-.4,-.4>,.3}
                        
                        pigment{color White}
                        normal{ bumps 1 scale .05}
                }        
        }      

camera{
        location <10,5,-2>*((-9/2)*clock+(11/2))
        #if (clock>0)
                look_at <(-30*clock+30)/2,30*clock*(1-clock)/2,0>
        #else
                look_at <(-30*clock+30)/2,45*pow(clock,2)/2,0>
        #end        
}

light_source{
        <50,100,0>
        color White
        area_light 5*x,5*z,5,5
}
 
object{
        die
        rotate <1,2,3>*clock*180
        translate <30,0,0>
        #if (clock>0)
                translate <-30*clock,30*clock*(1-clock),0>
        #else
                translate <-30*clock,45*pow(clock,2),0>
        #end                
}

plane{<1,0,-1>,-4 texture{T_Wood1 scale 20}}

plane{<1,0,1>,-4 texture{T_Wood1 scale 20 rotate y*90}}                

union{
        plane{y,-1}
        plane{y,-1.3}
        cylinder{
                <0,-1,0>
                <0,-1.3,0>
                3
                open
        }        
        clipped_by{
                cylinder{
                        <0,-.9,0>
                        <0,-1.4,0>
                        3
                        inverse
                }
        }                
        texture{T_Wood1 scale 20}
}                                                                       