// Width=1024
// Height=768
// Antialias=True
// Antialias_Threshold=0.3

#version 3.7;

global_settings{
  assumed_gamma 1
}

camera{
  location <0,-20,10>
  look_at <0,0,0>
  right 1.33*x
  up z
  sky z
}

light_source{
  <50,-50,50>
  rgb 1
  area_light 5*x,5*y,10,10
  adaptive 1
  jitter
}

box{
  <-100,-100,-15>,<100,100,100>
  pigment{checker rgb 0 rgb 0.25 scale 3}
  hollow
  rotate z*30
}

#declare variation = function{pigment{granite}}
isosurface{
  function{ pow(z*z,1.0/3.0) + pow(x*x+y*y,1.0/3.0) - 1 + 0.03*(2*variation(x,y,z).grey-1) }
  //function{ pow(z*z,1.0/3.0) + pow(x*x,1.0/3.0) + pow(y*y,1.0/3.0) - 1 }
  contained_by{sphere{0,1.3}}
  max_gradient 20
  pigment{
    granite
    pigment_map{
      [0 rgb <1,0,0>]
      [1 rgb <0.89,0.1,0.1>]
    }
  }
  finish{phong 1}
  scale 5
}
