camera{
    location <0,-5,1> 
    look_at <0,0,0>
    up <0,0,1>
    sky <0,0,1>
    right <1.33,0,0>
}

light_source{
    <10,-10,10>
    rgb 1
}

plane{
    z,-1
    pigment{
        checker
        pigment{rgb 0}
        pigment{rgb 1}
    }
}        

sphere{
    0,0.9
    pigment{rgb 0.1}
}

intersection{
    sphere{0, 1}
    plane{-z, -0.2}
    pigment{rgb <1,0,0>}
}

intersection{
    sphere{0,1}
    plane{z,-0.2}
    pigment{rgb 1}
}            