#include "woods.inc"

#macro board (length, height, border, roundedsize, black, white, bordercolor)
        union{
                box{
                        <0,0,0>,<length,1,height>
                        texture{checker texture{black}, texture{white}}
                        translate <-length/2,0,-height/2>
                }
                union{
                        intersection{
                                union{
                                        difference{
                                                box{<length/2,0,-height/2-border>,<length/2+border,1,height/2+border>}
                                                box{<length/2+border-roundedsize,1-roundedsize,-height/2-border-1>,<length/2+border+1,2,height/2+border+1>}
                                        }        
                                        cylinder{<length/2+border-roundedsize,1-roundedsize,-height/2-border>
                                                 <length/2+border-roundedsize,1-roundedsize,height/2+border>,
                                                 roundedsize} 
                                }                 
                                plane{<-1,0,-1>,((height-length)/2)/sqrt(2)}
                                plane{<-1,0,1>,((height-length)/2)/sqrt(2)}
                        }
                        intersection{
                                union{
                                        difference{
                                                box{<length/2,0,-height/2-border>,<length/2+border,1,height/2+border>}
                                                box{<length/2+border-roundedsize,1-roundedsize,-height/2-border-1>,<length/2+border+1,2,height/2+border+1>}
                                        }        
                                        cylinder{<length/2+border-roundedsize,1-roundedsize,-height/2-border>
                                                 <length/2+border-roundedsize,1-roundedsize,height/2+border>,
                                                 roundedsize}
                                }                 
                                plane{<-1,0,-1>,((height-length)/2)/sqrt(2)}
                                plane{<-1,0,1>,((height-length)/2)/sqrt(2)}
                                rotate y*180
                        } 
                        intersection{
                                union{
                                        difference{
                                                box{<-length/2-border,0,height/2>,<length/2+border,1,height/2+border>}
                                                box{<-length/2-border-1,1-roundedsize,height/2+border-roundedsize>,<length/2+border+1,2,height/2+border+1>}
                                        }
                                        cylinder{<-length/2-border,1-roundedsize,height/2+border-roundedsize>
                                                 <length/2+border,1-roundedsize,height/2+border-roundedsize>,
                                                 roundedsize}
                                }
                                plane{<-1,0,-1>,((length-height)/2)/sqrt(2)}
                                plane{<1,0,-1>,((length-height)/2)/sqrt(2)}
                        }
                        intersection{
                                union{
                                        difference{
                                                box{<-length/2-border,0,height/2>,<length/2+border,1,height/2+border>}
                                                box{<-length/2-border-1,1-roundedsize,height/2+border-roundedsize>,<length/2+border+1,2,height/2+border+1>}
                                        }
                                        cylinder{<-length/2-border,1-roundedsize,height/2+border-roundedsize>
                                                 <length/2+border,1-roundedsize,height/2+border-roundedsize>,
                                                 roundedsize}
                                }
                                plane{<-1,0,-1>,((length-height)/2)/sqrt(2)}
                                plane{<1,0,-1>,((length-height)/2)/sqrt(2)}
                                rotate y*180
                        }        
                        texture{bordercolor}
                }
        }        
#end

camera{
        location <3.5,4,-6>
        look_at <0,0,0>
}

light_source{
        <-1,1,-1>*1000
        rgb 1
}

#declare black = 
        texture{
                pigment{
                        granite
                        pigment_map{
                                [0 rgb 0]
                                [1 rgb .2]
                        }        
                }                
        }
        
#declare white =
        texture{
                pigment{
                        granite
                        pigment_map{
                                [0 rgb 1]
                                [1 rgb .8]
                        }
                }
        }
        
#declare rouge =
        texture{
                pigment{
                        agate
                        pigment_map{
                                [0 rgb <1,0,0>]
                                [.25 rgb <.7,0,0>]
                                [.5 rgb <.8,.2,0>]
                                [.75 rgb <1,0,0>]
                                [.9 rgb <.8,0,.2>]
                                [1 rgb <1,0,0>]
                        }
                }
        }                        

object{
        board(5,5,0.5,0.3,black,white,rouge)
}

plane{
        y,0
        texture{T_Wood25}
}        