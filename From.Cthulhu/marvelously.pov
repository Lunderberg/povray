#include "colors.inc"
#include "functions.inc"

#declare texton = 1;
#declare lenson = 2;
#declare colorish = 1;
#declare goheart=1;

#if (colorish)
global_settings{
    photons{
        count 100000
    }
}
#end

camera {
    location <0,-4,7>
    //location <0,-20, 50>
    look_at  <0, 0, 0>
    up <0,0,1>
    sky <0,0,1>
    right <1.33,0,0>
}

light_source{
    <0,0,100>
    rgb 1
    photons{
        refraction on    
        reflection on
    }
    spotlight
    point_at <0,0,0>
    radius 2
    falloff 3
}

#if (goheart)
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

object{
    #if (lenson=1)
    #declare spheredist = 0.9;
    intersection{
        sphere{0,1 translate z*spheredist}
        sphere{0,1 translate -z*spheredist}
    }
    #elseif (lenson=2)
    object{
        heart
    }
    #end
            
    pigment{rgbt <1,.5,.5,.7>}
    normal{bumps 1 scale .1}
    interior{
        ior 1.3
        dispersion 1.1
    }    
    photons{
        target
        refraction on
        reflection on
    }
    scale .5
    translate <0,-0.9,0>
    translate z*3.5    
}    

plane{
    z,-1
    pigment{
        granite
        pigment_map{
            [0 rgb .7]
            [1 rgb 1]
        }
    }
}

#if (texton)
union{
    text{
        ttf "times.ttf" "You'll do marvelously,"
        1, 0
        translate <-6,0,0>
    }
    text{
        ttf "times.ttf" "my Elisira."
        1, 0
        translate <-3.5,-3,0>
    }    
    pigment{rgb <0,1,0>}
    translate <1.5,0,0>    
    scale <.5,.5,.25>  
    //At this point, centered-ish at <0,0,0>
    scale 1.2
    translate <0,0,10>
}  
#end   
