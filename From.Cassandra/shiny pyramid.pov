#include "colors.inc"
#include "shinies.inc"
       
         
#declare Pyramid =
        union{
                object{
                        shiny(<0,0,0>)
                        translate <0,0,0>
                }

                object{
                        shiny(<0,0,1>)
                        translate <2,0,0>
                }

                object{
                        shiny(<0,1,0>)
                        translate <4,0,0>
                }                
                
                object{
                        shiny(<0,1,1>)
                        translate <1,0,sqrt(3)>
                }

                object{
                        shiny(<1,0,0>)
                        translate <3,0,sqrt(3)>
                }

                object{
                        shiny(<1,0,1>)
                        translate <2,0,2*sqrt(3)>
                }
                
                object{
                        shiny(<1,1,0>)
                        translate <1,(2/3)*sqrt(6),sqrt(3)/3>
                }
                
                object{
                        shiny(<1,1,1>)
                        translate <3,(2/3)*sqrt(6),sqrt(3)/3>
                }
                
                object{
                        shiny(<1,0,0>)
                        translate <2,(2/3)*sqrt(6),(4/3)*sqrt(3)>
                }
                
                object{
                        prophet(1,0)        
                        translate <2, (4/3)*sqrt(6),(2/3)*sqrt(3)>
                }
        
        }        


camera{
        location <-2,8,-4>
        look_at <2,0,sqrt(3)>
        right <1.33,0,0>
}

light_source{
        <0,20,0>
        color White
        area_light x,z,5,5
        adaptive 1
        jitter
}


object{
        Pyramid                                
}

plane{
        <0,1,0>,-1
        pigment{checker color Black color White}
}