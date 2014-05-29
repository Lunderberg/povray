#include "colors.inc"

#declare plane_angle = <0,0,-30>; 
#declare plane_angle2 = <0,45,0>;
#declare translucency = 0.75;

camera{
    location <0,0,-5>
    look_at <0,0,5>
}

light_source{
    <5,5,-5>
    rgb 1
}

plane{
    y,-2
    pigment{
        granite
        pigment_map{
            [0 rgb 0]
            [1 rgb 1]
        }    
    }
}

#declare single_cone =
    cone{
        <0,-1.999,0>, 1, <0,0,0>,0
    }

#declare double_cone =
    union{
        object{single_cone}
        object{single_cone rotate x*180} 
    }

#declare cone_interior =
    cone{
        <0,-2.0001,0>,.95,<0,-0.25,0>,0
    }
   
#declare double_cone_interior =
    union{
        object{cone_interior}
        object{cone_interior rotate x*180}
    }    

#declare double_cone_hollow =
    difference{
        object{double_cone}        
        object{double_cone_interior}
    }    


object{
    double_cone
    pigment{        
        granite
        pigment_map{
            [0 rgbt <1,0,0,translucency>]
            [1 rgbt <1,1,0,translucency>]
        }
    }
}

#declare cutting_plane =
    box{
        <-1,-1,-1>,<1,1,1>
        scale <3,.025,3>
        translate -.75*y
        rotate plane_angle
        rotate plane_angle2
    }

object{
    cutting_plane
    pigment{
        granite
        pigment_map{
            [0 rgbt <0,0,1,translucency>]
            [1 rgbt <0,1,1,translucency>]
        }
    }
}

#declare conic_section = 
    intersection{
        object{cutting_plane}
        difference{
            object{double_cone}
            object{double_cone_interior}
        }    
    }            

object{
    conic_section
    translate 0.0001
    pigment{
        granite
        pigment_map{
            [0 rgb <0,2,0>]
            [1 rgb <1,2,0>]
        }
    }
    scale 1.001
}                        