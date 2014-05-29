#include "colors.inc"

#declare n = 6;
#declare L = 10;
#declare first = <-5,0,0>;
#declare last = <5,0,0>;
#declare g = <0,-1,0>;


#declare r = n/L;

//Initializes array and sets initial locations of points.
//Points start equally spaced between first and last point.
#declare Location = array[n+1]
#declare i=0;
#while (i<=n)
        #declare Location[i] = first+(last-first)*(i-1)/n;
        #declare i =i+1;
#end

#declare norm = vcross(last-first,g);

#while (i <= 1000)
        #declare c=1;
        
        #while (c<=n-1)
                //Finds two allowed points in plane of points and gravity.
                #declare previous = Location[c-1];
                #declare next = Location[c+1];
                #declare change = next-previous;
                
                #declare midpoint = (previous+next)/2;
                #declare shift = sqrt(r*r-pow(vlength(change)/2,2));
                #declare unit = vcross(norm,change)/vlength(vcross(norm,change));
                
                #declare point1 = midpoint + shift*unit;
                #declare point2 = midpoint + shift*unit;
                
                //Checks which point is better given current force on link.
                #declare total_force = g;
                
                #if (vdot(point1,total_force) > vdot(point2,total_force))
                        #declare Location[c] = point1;
                #else
                        #declare Location[c] = point2;
                #end
                
                #declare c=c+1;
        #end
        
        #declare i=i+1;
#end

#declare c=0;
#while (c<=n)
        sphere{
                Location[c],.1
                pigment{color White}
        }
        #declare c=c+1;
#end

light_source{
        <0,50,0>
        rgb 1
}

camera{
        location <0,-10,0>
        look_at <0,0,0>
}        