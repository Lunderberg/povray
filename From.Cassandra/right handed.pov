 #include "colors.inc"
#include "woods.inc"

  background { color Black }
   
  camera {
    location <.75, 1, 4.5>
    look_at  <1, 6, 0>
    up <0,0,1>
    right <1.33,0,0>
  }   
   
  plane{
        <0,0,1>, 0
        pigment{
                checker color Black color Green
        }
//        normal { bumps 1 scale 1}
}                
  

  sphere {
    <.25, 4,2>, .5
    texture {
      pigment { 
                wood
                color_map{
                        [0.0 color White]
                        [0.5 color Green]
                        [1.0 color Yellow]
                }
                rotate y*-90        
       }
    }
    finish { phong 1}
  }    
  sphere {
    <1.5, 3, 3>, .75
    texture {
      pigment { color Red }
    }
    normal {bumps 1 scale .5 }
    finish { phong 1 }        
  }
  box {
        <-3,3,0>,
        <-2,4,1>
        texture {
                T_Wood23 
                rotate z*-20
        }
        normal { bumps 1 scale .1}
        rotate z*-45
}                
  
light_source{ 
        <.5,1.5,5> color White
//        area_light y/5, z/5, 25, 25
        fade_distance 10
        fade_power 1
}
light_source{
        <0,3,1> color White
        fade_distance 3
        fade_power 3
}        
        
 