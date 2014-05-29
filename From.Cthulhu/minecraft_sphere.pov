camera{
    location <0,20,-50>
    look_at <0,0,0>
}

light_source{
    <50,50,-50>
    rgb 1
}

#declare R1 = seed(0);

#declare r=15;

#declare star = 
union{
#declare i=-r;
#while (i<=r)
    #declare j = -r;
    #while (j<=r)        
        #declare k = -r;
        #while (k<=r)
            #if (i*i+j*j+k*k<r*r)
                box{
                    <0,0,0>, 1
                    translate <i,j,k>
                    //pigment{rgb <rand(R1),rand(R1),rand(R1)>}
                }    
            #end    
            #declare k = k+1;
        #end
        #declare j = j+1;
    #end    
    #declare i = i+1;
#end
}

object{
    star
    pigment{rgb 0.7}
    rotate clock*y*360
}    