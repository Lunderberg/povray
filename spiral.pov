// Width=1024
// Height=768

#version 3.7;

global_settings{
  assumed_gamma 1
}

camera{
  location <0,-1,99>
  look_at <0,0,0>
  right 1.33*x
  up z
  sky z
}

light_source{
  <50,-50,50>
  rgb 1
}

box{
  <-100,-100,-15>,<100,100,100>
  pigment{checker rgb 0 rgb 0.25 scale 3}
  hollow
  rotate z*30
}

#macro spiral_pos(theta)
  #local d = 5;
  #local delta = 1;
  #local theta0 = 4*pi;
  #local step = 1/(1+exp(-3*(theta-theta0)/delta));
  ((theta + d*step)*<cos(theta),sin(theta),0>)
#end

blob{
  #declare i = 0;
  #declare n = 10000;
  #declare theta_f = 4*pi;
  #while(i<n)
    #declare theta=theta_f*i/n;
    sphere{ spiral_pos(theta)-spiral_pos(theta_f), 0.25, 1.0}
    sphere{-spiral_pos(theta)+spiral_pos(theta_f), 0.25, 1.0}
    #declare i = i+1;
  #end
  rotate z*(90-theta_f*(pi/180))
  pigment{color rgb <1,0,0>}
  scale 1.0
}