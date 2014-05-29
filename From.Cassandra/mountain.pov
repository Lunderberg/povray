#include "colors.inc"
#include "functions.inc"
#include "stones.inc"
#include "shinies.inc"

camera{
        location <0,800,-1400>
        look_at <0,600,0>
}

light_source{
        <1000,800,-600>
        color White
        area_light 50*x,50*z,5,5
        adaptive 1
        jitter
}                

#declare f_pig = function{
        pigment{
                agate
                pigment_map{
                        [0 rgb 0]
                        [1 rgb 1]
                }
        }
}                        

union{
        isosurface{
                function{
                        f_witch_of_agnesi(x,y/5,z, -1, 1)+3*f_ridge(2*x,0,2*z,1,1,3,0,5,0)/f_r(x/2,1,z/2) + .1*f_pig(x,y,z).gray*max(tanh((5-y)*3),0) 
                }
                contained_by{
                        sphere{<0,2,0>,5}
                }
                threshold 3
                max_gradient 20
                accuracy .0000001
                
                rotate y*30
                
                texture{
                        pigment{        
                                granite
                                color_map{
                                        [0.0 color Gray50]
                                        [0.1 color Gray50]
                                        [0.2 color MidnightBlue]
                                        [0.8 color Black]
                                        [1.0 color Black]
                                }
                                scale 5
                                turbulence <1,.3,1>
                        }
                        
                        normal{bumps 1 scale .1}
                }
                texture{
                        pigment{
                                gradient y
                                color_map{
                                        [0.0 color Clear]
                                        [0.85 color Clear]
                                        [0.975 color White*1.5]
                                        [1.0 color White*1.5]
                                }
                                warp{turbulence .1}
                                scale 12
                                triangle_wave
                        }
                }                                                
        }
        /*
        superellipsoid{
               .25
                scale .1
                translate <-.1,5.35,-.2>
                texture{T_Stone8 scale .1}
        }        
        */
        plane{
                y,0
                texture{
                        pigment{        
                                granite
                                color_map{
                                        [0.0 color Gray50]
                                        [0.1 color Gray50]
                                        [0.2 color MidnightBlue]
                                        [0.8 color Black]
                                        [1.0 color Black]
                                }
                                scale 5
                                turbulence <1,.3,1>
                        }
                        normal{bumps 1 scale .1}
                }
                texture{
                        pigment{
                                spherical
                                color_map{
                                        [0.0 color Gray50]
                                        [0.8 color Clear]
                                        [1.0 color Clear]
                                }
                                scale 30
                        }
                }                        
        }
        
        scale 200
}                               

sphere{
        <0,0,0>,2000
        pigment{color Clear}
        hollow
        interior{
                media{
                        emission .003
                        density{
                                spherical
                                density_map{
                                        [0 rgb 0]
                                        [1 rgb 1]
                                }
                                warp{turbulence <2,0,2>}
                                scale 300
                                translate <0,1150,0>
                        }
                }                            
        }
}
               