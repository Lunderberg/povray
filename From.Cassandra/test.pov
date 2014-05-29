#include "colors.inc"
#include "woods.inc"
  
#declare step = function(time,spot,d){
        1/(exp(-5*(time-spot)/d)+1)}
        
#declare linear_step = function(time,start,stop,d){
        (ln(exp(5*(time-start)/d)+1) -
         ln(exp(5*(time-stop)/d)+1) ) /
         (5*(stop-start)/d)
}         
  


camera {
    location <0, 1 + 3*linear_step(clock,1,2,.25) -2*step(clock,4,1),-1.5>
    look_at  <1, 0, 6>
}

light_source{ 
        <.5,5,1.5> color White
}
  
sphere {
        <.25, 2, 4>, .5
        pigment { rgb <0,1,0> }
}

sphere {
        <1.5, 3, 3>, .75
        pigment { color Red }
}        

box {
        <-1.1,0,3.7>,
        <-.1,1,4.7>
        texture {
                T_Wood23 
                rotate y*20
        }
        rotate y*40
}                

cone{
        <0,0,0>,1
        <0,1,0>,0
        pigment{color White}
        translate <1,0,2>
}

plane{
        <0,1,0>, 0
        pigment{checker color Black color Green}
}                
 