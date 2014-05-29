#include "colors.inc"
#include "woods.inc"

#declare ball=
        sphere{
                <0,0,0>, 1                        
        }

#declare ring=
        torus{
                1,1/4
                translate <0,-(3/4),0>
        }        
         
#declare Pyramid =
        union{
                object{
                        ball
                        translate <0,0,0>
                }

                object{
                        ball
                        translate <2,0,0>
                }

                object{
                        ball
                        translate <4,0,0>
                }                
                
                object{
                        ball
                        translate <1,0,sqrt(3)>
                }

                object{
                        ball
                        translate <3,0,sqrt(3)>
                }

                object{
                        ball
                        translate <2,0,2*sqrt(3)>
                }
                
                object{
                        ball
                        translate <1,(2/3)*sqrt(6),sqrt(3)/3>
                }
                
                object{
                        ball
                        translate <3,(2/3)*sqrt(6),sqrt(3)/3>
                }
                
                object{
                        ball
                        translate <2,(2/3)*sqrt(6),(4/3)*sqrt(3)>
                }
                
                object{
                        ball        
                        translate <2, (4/3)*sqrt(6),(2/3)*sqrt(3)>
                }
        
        }        

#declare Monkey=
        merge{
               object{
                        ring
                        translate <0,0,0>
                }

                object{
                        ring
                        translate <2,0,0>
                }

                object{
                        ring
                        translate <4,0,0>
                }

                object{
                        ring
                        translate <1,0,sqrt(3)>
                }
        
                object{
                        ring
                        translate <3,0,sqrt(3)>
                }
                
                object{
                        ring
                        translate <2,0,2*sqrt(3)>
                }
        }


camera{
        location <0,8,-4>
        look_at <2,0,sqrt(3)>
        right <1.33,0,0>
}

light_source{
        <0,20,0>
        color White
//        area_light x,z,10,10
}

object{
        Monkey
        texture{
                pigment{
                        rgb <.4,.4,.1>
                }
                normal{
                        bumps 1/4 scale .2
                }        
        }
        finish{
                reflection .4
                phong 1
                metallic
                brilliance 3
        }                                              
}

object{
        Pyramid
        texture{
                pigment{
                        rgb <.2,.2,.2>
                }
                normal{
                        bumps 1/4 scale .2
                }        
        }        
        finish{
                reflection .1
                phong 1
                metallic
                brilliance 5
        }                                 
}

plane{
        <0,1,0>,-1
        texture{T_Wood2}
}