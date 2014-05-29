#include "functions.inc"

camera{
        location <0,0,-4>
        look_at <0,0,0>
} 


#declare female = 
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
        no_shadow
    }
 
#declare male = 
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
        no_shadow
    }
    
object{
    male
    translate <-0.4,0.4,0>
    rotate <-20,-20,0>
    translate <0,0.2,0.1>
}    

object{
    female
    translate <0.4,-0.4,0>
    rotate <0,30,0>
    translate <0,0,-0.2>
}        
 

plane{
        z,1
        texture{
                pigment{
                        spiral1 1
                        pigment_map{ 
                                [0 rgb <1,0,0>]
                                [1/6 rgb <1,1,0>]
                                [2/6 rgb <0,1,0>]
                                [3/6 rgb <0,1,1>]
                                [4/6 rgb <0,0,1>]
                                [5/6 rgb <1,0,1>]
                                [1 rgb <1,0,0>]                       
                        } 
                        turbulence .5
                        scale 4
                }
        }
        texture{
                pigment{
                        granite
                        pigment_map{
                                [0 rgbt 0]
                                [1 rgbt <0,0,0,.25>]
                        }
                }
        }             
}        

light_source{
        <5,5,-5>
        rgb .5
}