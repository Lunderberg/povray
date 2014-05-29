#version 3.7;

global_settings{
  assumed_gamma 1
}

#include "colors.inc"

#declare R1 = seed(1);

camera{
  location <0,-20,10>
  look_at <0,0,0>
  right 1.33*x
  up z
  sky z
}

light_source{
  0.5*<100,-100,100>
  rgb 1
  area_light x*5, z*5, 25,25
  orient
  circular
}

torus{
  0.5,0.1
  pigment{rgb <1,0,0>}
  rotate 90*x
}

box{
  <-100,-100,-15>,<100,100,100>
  pigment{checker rgb 0 rgb 0.25 scale 3}
  hollow
  rotate z*30
}

#macro field_line(R,r,rot)
  blob{
    #local n=1000;
    #local i=0;
    #while (i<n)
      #declare drot = i/n;
      #declare theta = (rot+drot)*pi;
      #declare loc = R*sin(theta)*abs(sin(theta))*<sin(theta),0,cos(theta)>;
      sphere{loc, r, 1.0}
      #local i=i+1;
    #end
  }
#end

#declare layers = 3;
#declare j=0;
#while (j<layers)

  #switch (j)
    #case (0)
      #declare field_lines = 14;
      #declare r = 0.075;
      #declare R = 2.5;
      #declare dom_color = <0,1,0>;
    #break
    #case (1)
      #declare field_lines = 10;
      #declare r = 0.1;
      #declare R = 5;
      #declare dom_color = <0.3,0.3,1>;
    #break
    #case (2)
      #declare field_lines = 10;
      #declare r = 0.125;
      #declare R = 9;
      #declare dom_color = <0,1,1>;
    #break
  #end

  #declare i = 0;
  #while (i<field_lines)
    object{
      #declare rot = rand(R1);
      #declare phi = 360*i/field_lines;
      field_line(R,r,rot)
      pigment{
	radial
	pigment_map{
	  [0.0 rgb dom_color+0.5*(<rand(R1),rand(R1),rand(R1)>-<rand(R1),rand(R1),rand(R1)>)]
	  [0.2 rgb dom_color+0.5*(<rand(R1),rand(R1),rand(R1)>-<rand(R1),rand(R1),rand(R1)>)]
	  [0.4 rgb dom_color+0.5*(<rand(R1),rand(R1),rand(R1)>-<rand(R1),rand(R1),rand(R1)>)]
	  [0.6 rgb dom_color+0.5*(<rand(R1),rand(R1),rand(R1)>-<rand(R1),rand(R1),rand(R1)>)]
	  [0.8 rgb dom_color+0.5*(<rand(R1),rand(R1),rand(R1)>-<rand(R1),rand(R1),rand(R1)>)]
	  [1.0 rgb dom_color+0.5*(<rand(R1),rand(R1),rand(R1)>-<rand(R1),rand(R1),rand(R1)>)]
	}
	turbulence 1
	sine_wave
	frequency 5
	//rotate y*rot*360
	translate x*R/2
      }
      rotate z*phi
    }
    #declare i = i+1;
  #end
  #declare j = j+1;
#end