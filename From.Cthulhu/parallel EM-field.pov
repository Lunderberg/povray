#include "colors.inc"

camera{
    location <0,-20,20>
    look_at <0,0,10>
    right 1.33*x
    up z
    sky z
}

light_source{
    0.5*<100,-100,100>
    rgb 1
    //area_light x*5, z*5, 25,25
    //orient
    //circular
}

#macro path(time)
    #local R = 1;
    #local B = 1;
    #local E = 1;
    #local D = 1;
    #local A = 10;
    #local phi = A*asinh(B*time/E);
    <R*sin(phi),-R*cos(phi),sqrt(E*E+B*B*time*time)/D>
#end

#declare step = function(time,spot,d){
        1/(exp(-5*(time-spot)/d)+1)
}

#macro map(dom_color,R1)
  pigment_map{
     [0.0 rgb dom_color+0.5*(<rand(R1),rand(R1),rand(R1)>-<rand(R1),rand(R1),rand(R1)>)]
     [0.2 rgb dom_color+0.5*(<rand(R1),rand(R1),rand(R1)>-<rand(R1),rand(R1),rand(R1)>)]
     [0.4 rgb dom_color+0.5*(<rand(R1),rand(R1),rand(R1)>-<rand(R1),rand(R1),rand(R1)>)]
     [0.6 rgb dom_color+0.5*(<rand(R1),rand(R1),rand(R1)>-<rand(R1),rand(R1),rand(R1)>)]
     [0.8 rgb dom_color+0.5*(<rand(R1),rand(R1),rand(R1)>-<rand(R1),rand(R1),rand(R1)>)]
     [1.0 rgb dom_color+0.5*(<rand(R1),rand(R1),rand(R1)>-<rand(R1),rand(R1),rand(R1)>)]
  }
#end

blob{
    #declare n=10000;
    #declare t_max = 5;
    #declare i=0;
    #while (i<n)
        sphere{path(t_max*i/n), 0.025+0.025*step(i/n,0.25,0.25), 1.0}
    #declare i=i+1;
    #end
    
    pigment{
        radial
        rotate x*90
        map(<0.8,0.2,0.2>,seed(3))
        sine_wave
        frequency 5
     }
    scale 4
}                 

box{
    <-100,-100,-15>,<100,100,100>
    pigment{checker rgb 0 rgb 0.25 scale 3}
    hollow
    rotate z*30
}