#include "colors.inc"

camera{
    location <7,-10,5>
    look_at <0,0,0>
    right 1.33*x
    up z
    sky z
}

light_source{
    <20,-20,20>
    rgb 1
}   

box{
    -35,35
    pigment{
        checker pigment{rgb <1,0,0>} pigment{rgb <0,1,0>}
    }
}

#declare ball =
    sphere{
        0,0.5
        pigment{
            gradient z
            pigment_map{
                [0.0 rgb 0]
                [0.5 rgb 0]
                [0.5 rgb 1]
                [1.0 rgb 1]
            }
            translate z*clock
            scale 0.125
        }    
    }
    
#declare n = 5;
#declare R1 = seed(0);    
    
#declare i = 0;
#while (i<n)
    #declare j = 0;
    #while (j<n)
        #declare k = 0;
        #while (k<n)
            object{
                ball
                #declare base_pos = <i-n/2,j-n/2,k-n/2>;
                #declare disp = 2*<rand(R1)-0.5,rand(R1)-0.5,rand(R1)-0.5>;
                #declare rot = 360*<rand(R1)-0.5,rand(R1)-0.5,rand(R1)-0.5>;
                #declare frac = (1-cos(2*pi*clock))/2;
                rotate frac*rot
                translate base_pos + frac*disp 
            }
        #declare k = k+1;
        #end
    #declare j = j+1;    
    #end
#declare i = i+1;        
#end           