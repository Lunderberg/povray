#include "colors.inc"

#declare n = 10;
#declare L = 20;
#declare first = <-5,0,0>;
#declare last = <5,0,0>;
#declare g = <0,-1,0>;


//Initializes array and sets initial locations of points.
//Points start equally spaced between first and last point.
#declare Location = array[n+1]
#declare i=0;
#while (i<=n)
        #declare Location[i] = first+(last-first)*(i-1)/n;
        #declare i =i+1;
#end

#declare i = 1;
#while(i <= 10000)
        #declare c = 1;
        #while (c <=n-1)
                #declare delta =
                        (vlength(Location[c+1]-Location[c])-L/n)*(Location[c+1]-Location[c])/vlength(Location[c+1]-Location[c]) +
                        (vlength(Location[c-1]-Location[c])-L/n)*(Location[c-1]-Location[c])/vlength(Location[c-1]-Location[c]) +
                        .01*g/vlength(g);
                
                #declare Location[c] = Location[c] + delta;
                
                #declare c = c+1;
        #end
        #declare i = i+1;
#end

#declare i=0;
#while (i<=n)
        sphere{
                Location[i], .2
                pigment{color White}
        }
        #declare i = i+1;
#end                

camera{
        location <0,0,-30>
        look_at <0,0,0>
}

light_source{
        <5,10,0>
        rgb 1
}