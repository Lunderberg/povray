#include "functions.inc"
#include "colors.inc"

#declare first_pig=
        function{
                pigment{
                        granite
                        pigment_map{
                                [0 rgb 0]
                                [1 rgb 1]
                        }           
                        scale 5
                        translate 50
                }
        }
        
#declare second_pig=
        function{
                pigment{
                        granite
                        pigment_map{
                                [0 rgb 0]
                                [1 rgb 1]
                        }
                }
        }

camera{
        location <0,0,-3>
        look_at <0,0,0>
        rotate 360*y*clock
}

light_source{
        <5,5,-5>
        rgb <0,0,1>
        rotate z*0 + 720*z*clock
}

light_source{
        <5,5,-5>
        rgb <1,0,0>
        rotate z*120 + 720*z*clock
}

light_source{
        <5,5,-5>
        rgb <0,1,0>
        rotate z*240 + 720*z*clock
}                

isosurface{
        function{
                f_sphere(x,y,z,1)
                + .3*first_pig(x,y,z).gray
                - .2*(f_noise3d(x,y,z)-.5)
                //+ .05*second_pig(x,y,z).gray
        }
        max_gradient 2.5
        contained_by{sphere{0,1.5}}        
        
        pigment{rgb 1}
        finish{
                reflection 1
                phong 1
        }        
}                       

sky_sphere{
        pigment{
                granite
                color_map{
                        [0 rgb <0,0,1>]
                        [0.15 rgb <0,0,.01>]
                        [0.15 rgb 0]
                }
                scale .35
        }
        pigment{
                granite
                color_map{
                        [0 rgb <1,0,0>]
                        [0.15 rgbt <0,0,0,1>]
                }
                scale .35
                translate 3
        }
        pigment{
                granite
                color_map{
                        [0 rgb <0,1,0>]
                        [0.15 rgbt <0,0,0,1>]
                }
                scale .35
                rotate 57
        }                                
}  