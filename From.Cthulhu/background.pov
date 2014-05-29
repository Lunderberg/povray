global_settings{
    photons{
        count 20000
    }
    ambient_light <0,0,0>
    assumed_gamma 1.0    
}

camera{
    location <0,3,-5>
    look_at <0,0,0>
    up <0,1,0>
    right <1.77,0,0>
}

#declare dist = 10;
#declare cent = <0,0,-1>;

light_source{
    (<-2,1,1>-cent)*dist + <0,0,2>
    color 1
    spotlight
    point_at cent
    radius 2
    falloff 3
    area_light x,y,25,25
}

light_source{
    (<2,1,1>-cent)*dist + <0,0,2>
    color 1
    spotlight
    point_at cent
    radius 2
    falloff 3
    area_light x,y,25,25
}    
                    
plane{
    y,0
    pigment{rgb 1}    
}


union{
    sphere{<-2,1,1>, 1}
    sphere{<2,1,1>,  1}
    pigment{
        granite
        pigment_map{
            [0.0 rgbt <0,0,1,0.5>]
            [1.0 rgbt <0,.6,.6,0.5>]
        }
    }    
    normal{bumps 0.5 scale 0.1}
    interior{
        ior 1.5
        dispersion 1.3
    }
    finish{reflection 0.2}    
    photons{
        target
        reflection on
        refraction on
    }    
}