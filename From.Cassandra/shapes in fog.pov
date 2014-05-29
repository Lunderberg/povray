camera{
        up <0,1,0>
        right <-4/3,0,0>
        sky <0,0,1>
        location <0,-5,0>
        look_at <0,0,0>
}

light_source{
        <1.5,-3,5>
        rgb <.8,.4,.4>*2
        spotlight
        point_at <0,0,0>
        radius 10
        falloff 15
}
/*
light_source{
        <-4,3,-4>
        rgb <.4,.8,.4>
        spotlight
        point_at <0,0,0>
} */        

sphere{
        <0,0,0>, .35
        pigment{rgbt 1}
        normal{bumps 1 scale .1}
        interior{ior 1.3}
        
}  

sphere{
        <0,0,0>, 15
        pigment{rgbt 1}
        hollow
        interior{
                media{
                        scattering{1, .1}
                        density{
                                spherical
                                density_map{
                                        [0 rgb 0]
                                        [1 rgb 1]
                                }
                                scale 10 
                                turbulence .5
                        }                
                }
        }
}                        