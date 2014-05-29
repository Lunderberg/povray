#declare center = <1.5,-1.5,-15>;

camera {
    location center
    look_at  center+z
}

light_source{
    <10,10,-50>
    rgb 1
}

#declare white = pigment{rgb 1.1}
#declare grey  = pigment{rgb 0.7}

#declare sphereStrength = 3;
#declare sphereRadius = 1;

blob{
    //Eyes
    sphere{<0,0,0>, sphereRadius strength sphereStrength pigment{white}}
    sphere{<3,0,0>, sphereRadius strength sphereStrength pigment{white}}
    
    //Head
    sphere{<-2,0,0>, sphereRadius strength sphereStrength pigment{white}}
    sphere{<-2,1,0>, sphereRadius strength sphereStrength pigment{white}}
    sphere{<-2,2,0>, sphereRadius strength sphereStrength pigment{white}}
    sphere{<-1,3,0>, sphereRadius strength sphereStrength pigment{white}}
    sphere{<0,3,0>, sphereRadius strength sphereStrength pigment{white}}
    sphere{<1,3,0>, sphereRadius strength sphereStrength pigment{white}}
    sphere{<2,3,0>, sphereRadius strength sphereStrength pigment{white}}
    sphere{<3,3,0>, sphereRadius strength sphereStrength pigment{white}}
    sphere{<4,3,0>, sphereRadius strength sphereStrength pigment{white}}
    sphere{<5,2,0>, sphereRadius strength sphereStrength pigment{white}}
    sphere{<5,1,0>, sphereRadius strength sphereStrength pigment{white}}
    sphere{<5,0,0>, sphereRadius strength sphereStrength pigment{white}} 
    
    //Beard
    sphere{<-2,-1,0>, sphereRadius strength sphereStrength pigment{grey}}
    sphere{<5,-1,0>, sphereRadius strength sphereStrength pigment{grey}}
    sphere{<-2,-2,0>, sphereRadius strength sphereStrength pigment{grey}}
    sphere{<-1,-2,0>, sphereRadius strength sphereStrength pigment{grey}}
    sphere{<0,-2,0>, sphereRadius strength sphereStrength pigment{grey}}
    sphere{<1,-2,0>, sphereRadius strength sphereStrength pigment{grey}}
    sphere{<2,-2,0>, sphereRadius strength sphereStrength pigment{grey}}
    sphere{<3,-2,0>, sphereRadius strength sphereStrength pigment{grey}}
    sphere{<4,-2,0>, sphereRadius strength sphereStrength pigment{grey}}
    sphere{<5,-2,0>, sphereRadius strength sphereStrength pigment{grey}}
    
    sphere{<-2,-3,0>, sphereRadius strength sphereStrength pigment{grey}}
    sphere{<-1,-3,0>, sphereRadius strength sphereStrength pigment{grey}}
    sphere{<1,-3,0>, sphereRadius strength sphereStrength pigment{white}} //Left tooth
    sphere{<2,-3,0>, sphereRadius strength sphereStrength pigment{white}} //Right tooth
    sphere{<4,-3,0>, sphereRadius strength sphereStrength pigment{grey}}
    sphere{<5,-3,0>, sphereRadius strength sphereStrength pigment{grey}}
    
    sphere{<-2,-4,0>, sphereRadius strength sphereStrength pigment{grey}}
    sphere{<-1,-4,0>, sphereRadius strength sphereStrength pigment{grey}}
    sphere{<0,-4,0>, sphereRadius strength sphereStrength pigment{grey}}
    sphere{<1,-4,0>, sphereRadius strength sphereStrength pigment{grey}}
    sphere{<2,-4,0>, sphereRadius strength sphereStrength pigment{grey}}
    sphere{<3,-4,0>, sphereRadius strength sphereStrength pigment{grey}}
    sphere{<4,-4,0>, sphereRadius strength sphereStrength pigment{grey}}
    sphere{<5,-4,0>, sphereRadius strength sphereStrength pigment{grey}}
    
    sphere{<-1,-5,0>, sphereRadius strength sphereStrength pigment{grey}}
    sphere{<0,-5,0>, sphereRadius strength sphereStrength pigment{grey}}
    sphere{<1,-5,0>, sphereRadius strength sphereStrength pigment{grey}}
    sphere{<2,-5,0>, sphereRadius strength sphereStrength pigment{grey}}
    sphere{<3,-5,0>, sphereRadius strength sphereStrength pigment{grey}}
    sphere{<4,-5,0>, sphereRadius strength sphereStrength pigment{grey}}
    
    sphere{<1,-6,0>, sphereRadius strength sphereStrength pigment{grey}}
    sphere{<2,-6,0>, sphereRadius strength sphereStrength pigment{grey}}
    sphere{<3,-6,0>, sphereRadius strength sphereStrength pigment{grey}}
    
    sphere{<2,-7,0>, sphereRadius strength sphereStrength pigment{grey}}
    sphere{<3,-7,0>, sphereRadius strength sphereStrength pigment{grey}}
}