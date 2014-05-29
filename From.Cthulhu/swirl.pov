#include "colors.inc"

#declare step = function(time,spot,d){
    1/(exp(-3*(time-spot)/d)+1)
}

#declare center_rad = function(theta){
    theta+12*step(theta,0.75,6*pi)
}

#declare thickness = function(theta){
    1/(1+pow(theta,-0.5))
}