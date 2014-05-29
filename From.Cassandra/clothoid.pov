#include "colors.inc"

light_source{
        <5,5,-10>
        rgb 1
}

#declare i=0;
#declare x0=0;
#declare y0=0;
#declare num=0;

#declare xmax=0;
#declare xmin=0;
#declare ymax=0;
#declare ymin=0;

#declare r=seed(0);

#while (num<=10000)
        sphere{
                <x0,y0,0>, .5
                pigment{rgb <sin(2*i),cos(2*i),sin(10*i)>}
        }        
        
        #declare i=i+sqrt(pi/1000);
        #declare x0=x0+cos(i*i);
        #declare y0=y0+sin(i*i);
        
        #declare num=num+1;
        
        #if (x0>xmax) #declare xmax=x0; #end        
        #if (x0<xmin) #declare xmin=x0; #end
        #if (y0>ymax) #declare ymax=y0; #end
        #if (y0<ymin) #declare ymin=y0; #end        
#end        

camera{
        location <(xmax+xmin)/2,(ymax+ymin)/2,-50>
        look_at <(xmax+xmin)/2,(ymax+ymin)/2,0>
}        