#include "colors.inc"
#include "functions.inc"

camera{
        up <0,1,0>
        right <-4/3,0,0>
        sky <0,0,1>
        location <0,-5,2>
        look_at <0,0,0>
}

light_source{
        <5,-3,5>
        rgb 1
        area_light 5*x,5*y,20,20
}

#declare f_pig =
        function{
                pigment{
                        granite
                        pigment_map{
                                [0 rgb 0]
                                [1 rgb 1]
                        }
                        translate 100 
                        scale 2
                }
        }                        

isosurface{
        function{
                min(    -f_superellipsoid(x,y,z,.25,.25),
                        f_sphere(x+1,y+1,z-1,1/2),
                        f_sphere(x-1,y+1,z-1,1/2),
                        f_sphere(x+1,y-1,z-1,1/2),
                        f_sphere(x-1,y-1,z-1,1/2),
                        f_sphere(x+1,y+1,z+1,1/2),
                        f_sphere(x-1,y+1,z+1,1/2),
                        f_sphere(x+1,y-1,z+1,1/2),
                        f_sphere(x-1,y-1,z+1,1/2))
                + .25*(f_noise3d(x,y,z)-0.5)
                + .1*(f_pig(x,y,z).gray-0.5)
        } 
        max_gradient 4 
        contained_by{sphere{0,3}}
        pigment{
                granite
                pigment_map{
                        [0 rgb 0]
                        [.5 rgb .9]
                        [1 rgb 1]
                }
        }
        rotate z*35                
}

cylinder{
        -15*z,10*z,7
        pigment{rgb 1}
        normal{granite scale 3}
        hollow
}                        