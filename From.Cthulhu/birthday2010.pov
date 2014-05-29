#version 3.7;

#include "colors.inc"
#include "functions.inc"

#declare goheart = 1;

camera{
        location <0,0,-1.>
        look_at <0,0,0>
}

light_source{
        <50,-50,-75>
        rgb <1,1,1>
        #if (goheart=1)
            area_light 20*x, 20*y, 20, 20
        #end
}

#declare words = 
union{
    plane{-z,0}
    height_field{
        png
        "test_bak.png"
        translate <-0.5,0,-0.5>
        scale <1.3,0.25,1>
        rotate x*-90
    }             
}

#if (goheart=1)
    #declare heart =
    isosurface{
        function{
            f_heart(x,y,z,-.01)
        }
        contained_by{
            box{-1.3,1.3}
        }
        all_intersections
        rotate <0,90,90>
    }
#else
    #declare heart =
    sphere{
        0,1
    }
#end            

#declare wordtexture =
texture{
    pigment{
        granite
        pigment_map{
            [0.0 rgb 0.5]
            //[1.0 rgb <.8,.6,.6>]
            [1.0 rgb <.8,.5,.5>]
        }
        scale 0.25
    }
    normal{agate .25 scale 0.1}
    finish{phong 0.1}
}

#declare crystaltexture =
texture{
    pigment{
        rgbt <1,0,0,.7>
    }
    normal{
        crackle 10 scale .025
    }
    finish{
        reflection .4
        phong 1
    }        
}        

#declare heartscale = 0.15;
#declare heartloc = <0,-.25,0>;

difference{
    object{words}   
    object{
        heart
        scale heartscale
        translate heartloc
    }
    texture{wordtexture}
}

union{
    object{heart
        scale heartscale*0.9
    }
    light_source{
        <0,0,0>
        rgb <.25,0,0>
    }    
    translate heartloc
    texture{crystaltexture}
}

#declare fogdensity = 10;
#declare fogseedloc = <0,16,0>;

sphere{
    0, 10
    pigment{rgbt 1}
    hollow
    interior{
        media{
            emission fogdensity*<1,0,0>
            density{
                spherical
                density_map{
                    [0 rgb 0]
                    [1 rgb 1]
                }
                translate fogseedloc                 
                warp{turbulence 1}
                translate -fogseedloc
                scale .4
            }
        }
    }
    translate heartloc
}