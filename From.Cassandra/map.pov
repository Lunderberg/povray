#include "colors.inc"
#include "functions.inc" 
#include "woods.inc" 
#include "metals.inc"


camera{
        location <0,5,-5>
        look_at <0,0,0>
}        

#declare bubble=
        function{
                pigment{
                        agate
                        pigment_map{
                                [0 rgb 0]
                                [1 rgb 1]
                        }
                }
        } 
        

#declare n=3;
#declare blood =
isosurface{
        function{
                x*x+z*z-pow(-y,n)*(1+y)
                +.01*(bubble(x,y,z).gray-0.5)/(exp(y+.5)+1)
        }
        max_gradient 2.5
        contained_by{
                box{<-1,-1,-1>,<1,0,1>}
        }        
        
        pigment{rgbt <1,0,0,.6>}
        finish{
                phong 1
                reflection .1
        }        
        hollow
        interior{
                ior 1.3
                media{
                        emission <.6,0,0>
                }
                media{
                        absorption 2
                        }        
        }
}       

//Four drops of blood
union{
        object{blood translate y*2}
        object{blood translate <0.5,2,0.5>}
        object{blood translate <-0.5,2,0.5>}
        object{blood translate <0,2.5,0.25>}
        
        translate z*-0.3
}

//Spear
union{
        cylinder{
                <-1,0.5,2.5>,<-3,0.5,-1>
                0.2
                texture{T_Wood1 rotate 97}
        }        
        cone{
                <-3,0.5,-1>,0.4
                (<-1,0.5,2.5>-<-3,0.5,-1>)*-0.3+<-3,0.5,-1>, 0
                texture{T_Copper_2A} 
                normal{bumps .25 scale .1}
        } 
        translate 2*z
}

//Male+female symbols for eros
union{
        union{
                //sphere{<-1,.5,0>,.7}
                torus{.55,.15 rotate x*90 translate <-1,.5,0>}
                cylinder{<-1,0,0>,<-1,-1.5,0>,.15}
                cylinder{<-1.5,-1,0>,<-0.5,-1,0>,.15}
                superellipsoid{<1,.25> rotate y*90 scale .15 translate <-0.6,-1,0>}
                superellipsoid{<1,.25> rotate y*90 scale .15 translate <-1.4,-1,0>}
                superellipsoid{<1,.25> rotate x*90 scale .15 translate <-1,-1.4,0>}
        
          
                texture{
                        pigment{
                                granite
                                pigment_map{
                                        [0 rgb 0]
                                        [.6 rgb <.7,.7,1>]
                                        [1 rgb <.7,.7,1>]
                                }
                        }  
                        normal{granite 2}
                        finish{phong 1}    
                }
                texture{
                        pigment{
                                crackle
                                pigment_map{
                                        [.25 rgbt <0,0,0,1>]
                                        [1 rgbt <10,0,0,0>]
                                } 
                                turbulence .5
                                scale .25
                        }
                }
        } 

        union{
                //sphere{<0.3,-.3,0>,.7}
                torus{.55,.15 rotate x*90 translate <0.3,-.3,0>}
                cylinder{<0.7,.1,0>,<1.6,1.0,0>,.15}
                cylinder{<1.75,1,0>,<.8,1,0>,.15
                        clipped_by{plane{ <-1,1,0>,-sqrt(.18) inverse} }
                }         
                cylinder{<1.6,1.15,0>,<1.6,.2,0>,.15
                        clipped_by{plane{ <-1,1,0>,-sqrt(.18)} }
                }
                superellipsoid{<1,.25> rotate y*90 scale .15 translate <.9,1,0>}
                superellipsoid{<1,.25> rotate x*90 scale .15 translate <1.6,.3,0>}
        
                pigment{
                        agate
                        pigment_map{  
                                [0 rgb <1,0,0>]
                                [.5 rgb <1,.1,0>]
                                [.75 rgb <1,.2,0>]
                                [.9 rgb <1,.3,0>]
                                [1 rgb <1,1,0>]
                        } 
                        scale .5
                }
                normal{agate 1 scale .5}
                finish{phong 1}
        }
        rotate x*90
        rotate y*30 
        translate <3,0.35,1.7>                
}

//Ladder above eros symbols.
union{
        cylinder{<0.5,0,0> <0.5,15,0> .1}
        cylinder{<-0.5,0,0> <-0.5,15,0> .1}
        #declare i=1;
        #declare rungdist = 0.5;
        #while (i<100)
                cylinder{<-0.5,i*rungdist,0> <0.5,i*rungdist,0> .1}
                #declare i=i+1;
        #end
        
        rotate y*30
        scale .5
        translate <3,1,1.7>
                
        texture{T_Wood5}
        
}

//Sparklinesses near the top of the ladder.
sphere{
         <3,3,1.7>,1
         pigment{rgbt 1}
         hollow
         interior{
                media{
                        emission 20
                        density{               
                                crackle
                                density_map{
                                        [0 rgb 0]
                                        [.6 rgb 0]
                                        [1 rgb 1]
                                }
                                scale .05
                                turbulence 0.5
                        }
                }
        }     
}

//Pile of coins reflecting ladder.
#declare n=15;
#declare r=0.1;
#declare d=0.03;
union{
        #declare i=0;
        #while (i<n)
                #declare j=0;
                #while (i+j<n)
                        #declare k=0;
                        #while (i+j+k<n)
                                cylinder{<2*i*r+j*r+k*r,k*d,r*j*sqrt(3)+r*k*sqrt(3)/2>
                                        <2*i*r+j*r+k*r,(k+1)*d,r*j*sqrt(3)+r*k*sqrt(3)/2>
                                        r}
                                #declare k=k+1;        
                        #end
                        #declare j=j+1;
                #end
                #declare i=i+1;
        #end
        
        rotate y*-25
        translate <1,0,-2.3>
        texture{T_Copper_5D}
}                        

sphere{
        <0,0,0>,5
        pigment{rgbt 1}
        hollow
        interior{
                media{
                        absorption 2.5
                        density{
                                spherical
                                density_map{
                                        [0 rgb 0]
                                        [.75 rgb 1]
                                        [1 rgb 1]
                                }
                                turbulence 1       
                        }
                }
        }
        translate <-2,.5,-2>
}                                                                              

plane{
        y,0
        pigment{rgb .7}
        normal{granite .5 scale 1}
}  

light_source{
        <7,10,-5>
        rgb 1
}