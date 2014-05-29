#include "colors.inc" 

#declare refract = 0;

#if (refract = 1)
global_settings{
        photons{
                count 20000
        }
}               
#end 

camera{
        location <0,5,-5>
        look_at <0,0,0>
}

light_source{
        <10,10,-10>
        rgb <1,.3,.3>*.3
}

light_source{
        <0,15,0>
        rgb <.3,1,.3>*.3
}

light_source{
        <-10,10,-10>
        rgb <.3,.3,1>*.3
}                

plane{
        y,0
        pigment{rgb 1}                
        normal{bumps .6 turbulence 1}
}

sphere{
        <0,2.5,0>, 1
        pigment{rgbt .8}
        interior{ior 1.3}
        normal {bumps .3}
        photons{
                target on
                refraction on
        }
}                

superellipsoid{
        <.25,.25>
        rotate <0,45,0>
        rotate <-15,0,0>
        translate <-3,1,3>
        
        pigment {rgb <.7,.4,.7>} 
        finish {reflection .2}
        normal {bumps .2 scale .2}      
}              

sphere{
        <2.5,1,0>,1
        pigment{
                gradient y
                turbulence .6
                pigment_map{
                        [0 rgb <1,0,0>]
                        [.5 rgb <1,1,0>]
                        [1 rgb <0,1,0>]
                } 
                sine_wave
        }
        normal{
                gradient y 1
                warp{turbulence .6}
                sine_wave
        }
        finish{
                phong 1
        }                                
}

sphere{
        <0,1,-3>,3
        
        pigment{rgbt 1}
        hollow
        interior{
                media{
                        emission 1  
                        density{
                                granite
                                density_map{
                                        [0 rgb 0]
                                        [1 rgb 1]
                                }
                        }
                        density{
                                spiral2 4
                                density_map{
                                        [0 rgb <1,0,0>]
                                        [1/6 rgb <1,0,1>]
                                        [2/6 rgb <0,0,1>]
                                        [3/6 rgb <0,1,1>]
                                        [4/6 rgb <0,1,0>]
                                        [5/6 rgb <1,1,0>]
                                        [1 rgb <1,0,0>]
                                }
                                rotate x*90       
                                translate <0,1,-3>
                        }
                        density{
                                spherical
                                density_map{
                                        [0 rgb 0]
                                        [1 rgb 1]
                                }
                                scale 2
                                translate <0,1,-3>
                        }                                      
                }
        }                                
}                