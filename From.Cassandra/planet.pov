#include "colors.inc"

camera{
        location <0,1,-3>
        look_at <0,0,0>
}

light_source{
        <3,4,-5>
        color White
}

#declare Ocean=
        texture{
                pigment{
                        bozo
                        pigment_map{
                                [0.0 color Blue]
                                [0.6 color Aquamarine]
                                [0.9 color DarkGreen]
                                [1.0 color Gray90]
                        }        
                }
                finish{
                        phong 1
                        reflection .3
                }
        }


#declare Land=
        texture{
                pigment{
                        bozo
                        pigment_map{
                                [0.0 color Green]
                                [0.6 color DarkGreen]
                                [0.7 rgb <.4,.4,.1>]
                                [0.9 color IndianRed]
                                [1.0 color Brown]
                        }
                        scale .2
                }
                normal{bumps 2 scale .2}
        }                                                                                       

#declare NonArctic=
        texture{
                bozo
                texture_map{
                        [0.0 Ocean]
                        [0.5 Ocean]
                        [0.5 Land]
                        [1.0 Land]
                }
                scale 1.5
                turbulence 1
        }

#declare Arctic=
        texture{
                pigment{
                        bozo
                        pigment_map{
                                [0.0 color White]
                                [0.8 color White]
                                [1.0 color Gray75]
                        }
                }        
                normal{bumps .5 scale .2}
                finish{
                        phong 1
                        reflection .5
                }
        }                

#declare Surface=
        texture{
                gradient y
                texture_map{
                        [0.0 Arctic]
                        [0.1 Arctic]
                        [0.2 NonArctic]
                        [0.8 NonArctic]
                        [0.9 Arctic]
                        [1.0 Arctic]
                }        
                scale <1,2,1>
                translate <0,-1,0>
                turbulence .05
        }

#declare Clouds=
        texture{
                pigment{
                        bozo
                        pigment_map{
                                [0.0 color White]
                                [0.7 color White]
                                [1.0 color Gray60]
                        }
                }
                finish{
                        phong 1
                        reflection .6
                }
        }                                        

sphere{
        <0,0,0>, 1
          
        texture{Surface}
        rotate y*-90                                                 
}

sphere{
        <0,0,0>,1.05
                                  
        texture{
                bozo
                texture_map{
                        [0.0 pigment{color Clear}]
                        [0.6 pigment{color Clear}]
                        [0.7 Clouds]
                        [1.0 Clouds]
                }
                scale 2
                turbulence 3
        }
}        
    