global_settings{
    assumed_gamma 1.0
}

camera{
    location <0,25,-25>
    look_at <0,0,0>
}

light_source{
    <10,10,10>
    color 1
    parallel
    point_at <0,0,0>
    area_light 5*x,5*y,5,5
    jitter
}    

plane{
    y,0
    pigment{
        granite
        pigment_map{
            [0.0 rgb .8]
            [1.0 rgb 1]
        }
    }
}

cylinder{
    <-1.5,2,0>,<1.5,2,0>,.5
    pigment{
        gradient x
        pigment_map{
            [0.0 rgb <1,0,0>]
            [0.5 rgb <0,1,0>]
            [1.0 rgb <0,0,1>]
        }
        sine_wave
        scale 3
        turbulence 0.5    
    }
}