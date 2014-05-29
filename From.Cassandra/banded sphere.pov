#include "colors.inc"
#include "functions.inc"

camera{
        location <0,1,-3>
        look_at <0,0,0>
}

light_source{
        <30,50,0>
        rgb 1
        area_light 4*x,4*y,7,7
        circular
        orient
        jitter
}        

#declare updown=
        pigment{
                gradient y
                color_map{
                        [0.0 rgb <.6,.7,.3>]
                        [.3 rgb <.4,.3,.3>]
                        [.7 rgb <.6,.1,.2>]
                        [.9 rgb <.5,.5,.9>]
                        [1.0 rgb <.9,.4,.4>]
                }
                triangle_wave
                turbulence .3        
        }
        
#declare inout=
        pigment{
                spherical
                scale <1,15,1>
                color_map{
                        [0 rgb <.1,.3,.1>]
                        [.2 rgb <.1,.1,.1>]
                        [.4 rgb <.1,.1,.2>]
                        [.5 rgb <.4,.1,.1>]
                        [.6 rgb <.7,.2,.3>]
                        [.7 rgb <.4,.3,.2>]
                        [.8 rgb <.5,.1,.1>]
                        [.9 rgb <.8,.4,.4>]
                        [1.0 rgb <1,0,0>]
                }
                turbulence 1
        }

#declare blueband=
        pigment{
                agate
                color_map{
                        [0 rgbt <0,1,1,.7>]
                        [.1 rgbt 1]
                }
        }
        
#declare redband=
        pigment{
                agate
                color_map{
                        [0 rgbt <1,0,0,.7>]
                        [.1 rgbt 1]
                }
                translate 50
        }
        
#declare greenband=
        pigment{
                agate
                color_map{
                        [0 rgbt <0,1,0,.7>]
                        [.1 rgbt 1]
                }
                translate -50
        }

#declare noise=
        function{
                pigment{
                        agate
                        color_map{
                                [0 rgb 0]
                                [1 rgb 1]
                        }
                        translate 100
                }
        }                        
 
isosurface{
        function{
                f_sphere(x,y,z,1)+
                .25*(f_noise3d(x,y,z)-0.5)+
                .1*(noise(x,y,z).gray-0.5)
        }
        contained_by{
                sphere{<0,0,0>,1.5}
        }
        max_gradient 3
        
        texture{
                pigment{
                        average
                        pigment_map{
                                [1 updown]
                                [1 inout]
                        }
                }
                //finish{phong .4}        
        }        
        texture{
                pigment{
                        granite
                        color_map{
                                [0 rgbt <.4,.2,0,.6>]
                                [1 rgbt 1]
                        }
                }
        }
        texture{pigment{redband}}
        texture{pigment{greenband}}
        texture{pigment{blueband}}
}

cylinder{
        <0,-2,0>,<0,-3,0>,10
        texture{
                pigment{
                        granite
                        color_map{
                                [0 rgb .7]
                                [1 rgb 1]
                        }
                        scale 2
                }
                finish{
                        reflection .3
                        phong 1
                }        
        }
        texture{
                pigment{
                        bozo
                        color_map{
                                [0 rgbt 1]
                                [.6 rgbt 1]
                                [.65 rgbt <.4,.4,.4,.5>]
                                [.8 rgbt <.9,.9,.9,.5>]
                                [1 rgbt 1]
                        }
                        scale 1.5
                }
        }                                                
}

sky_sphere{
        pigment{
                granite
                color_map{
                        [0 rgb <0,0,1>]
                        [0.2 rgb <0,0,.01>]
                        [0.2 rgb 0]
                }
                scale .35
        }
        pigment{
                granite
                color_map{
                        [0 rgb <1,0,0>]
                        [0.2 rgbt <0,0,0,1>]
                }
                scale .35
                translate 3
        }
        pigment{
                granite
                color_map{
                        [0 rgb <0,1,0>]
                        [0.2 rgbt <0,0,0,1>]
                }
                scale .35
                rotate 57
        }                                
}                        