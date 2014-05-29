#include "colors.inc"
#include "functions.inc"

camera{
        location <0,.15,-1>
        look_at <0,-.5,0>
}

light_source{
        <5,5,-10>
        rgb 1
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
isosurface{
        function{
                x*x+z*z-pow(-y,n)*(1+y)
                +.01*(bubble(x,y,z).gray-0.5)/(exp(y+.5)+1)
        }
        max_gradient 2.5
        contained_by{
                box{<-1,-1,-1>,<1,0,1>}
        }        
        
        pigment{rgbt 1}
        finish{
                phong 1
                reflection .1
        }        
        hollow
        interior{
                ior 1.3
                media{
                        emission <0,0,.3>
                }        
        }
        
        no_shadow
}

#declare river=
        pigment{
                agate
                pigment_map{
                        [0 rgb <0,0,.6>]
                        [.1 rgbt <0,0,0,1>]
                }
                scale 10
        }
        
#declare f_river=
        function{pigment{river}}

#declare mountain=
        pigment{
                granite
                pigment_map{
                        [0 rgb 1]
                        [0.05 rgb 1]
                        [0.15 rgb <.6,.5,.4>]
                        [.3 rgbt <0,0,0,1>]
                }
                scale 150
        }

#declare f_mountain=
        function{pigment{mountain}}

#declare valley=
        pigment{
                granite
                pigment_map{
                        [0 rgb <0,.7,0>]
                        [.3 rgb <.2,.5,.2>]
                        [.6 rgb <.3,.6,.1>]
                        [.9 rgb <.1,.8,.4>]
                        [1 rgb <0,1,0>]
                }
                translate 50
                scale 50
        }

#declare f_valley=
        function{pigment{valley}}        

#declare ocean=
        pigment{
                granite
                pigment_map{
                        [0 rgb <0,0,1>]
                        [.15 rgb <.2,.5,.8>]
                        [.4 rgb <.2,.6,.6>]
                        [.6 rgb <.2,.2,.7>]
                        [1 rgb <.1,.1,.6>]
                }
                translate -50
                scale 100
        }
        
#declare f_ocean=
        function{pigment{ocean}}        

#declare f_land=
        function{-5*(f_mountain(x,y,z).gray-0.5)
                +10*(f_river(x,y,z).gray-0.5)
                -3*(f_valley(x,y,z).gray-0.5)
        }                                

isosurface{
        function{
                f_sphere(x,y+500,z,450)
                +f_land(x,y,z)//(exp(5*f_ocean(x,y,z).gray)+1)
        }
        contained_by{
                sphere{<0,-500,0>,475}
        }
        max_gradient 5                
        
        texture{pigment{valley}}        
        texture{pigment{mountain}}        
        texture{pigment{river}}                        
}

sphere{
        <0,-500,0>, 452.25
        pigment{ocean}
        normal{ripples scale 50}
        finish{phong .4}
}

#declare cloud=
        density{
                crackle
                density_map{
                        [0 rgb 0]
                        [.3 rgb 0]
                        [.95 rgb 1]
                        [1 rgb 1]
                }
                warp{turbulence 1}
                scale 15
        } 

difference{
        sphere{<0,-500,0>, 460}
        sphere{<0,-500,0>, 455}
        pigment{rgbt 1}
        hollow
        
        interior{
                media{
                        scattering{2, .1}
                        density{cloud}
                }        
                media{
                        emission .1
                        density{cloud}                
                }
                media{
                        absorption .1
                        density{cloud}
                }        
        }
}

sphere{
        <0,0,0>,1
        pigment{rgbt 1}
        hollow
        interior{
                media{
                        emission <1,0,0>
                        density{
                                spherical
                                density_map{
                                        [.25 rgb 0]
                                        [1 rgb 1]
                                }
                        }
                }
        }
        scale 1000/50
        translate <5000,-5000,10000>/50                                
}

light_source{
        <100,0,200>
        rgb <1,0,0>
}        

background{rgb <.5,.5,1>/4}                                                                                   