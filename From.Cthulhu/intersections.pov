#declare step = function(time,spot,d){
        1/(exp(-5*(time-spot)/d)+1)
}        
        
#declare linear_step = function(time,start,stop,d){
        (ln(exp(5*(time-start)/d)+1) -
         ln(exp(5*(time-stop)/d)+1) ) /
         (5*(stop-start)/d)
}

camera{
    location <0,2,-5> + <0,2,-3>*step(clock,1.3,0.3)
    look_at <0,0,0>
    
    rotate y*360*linear_step(clock,1,2,0.2)
}

light_source{
    <0,50,-20>
    1    
}

#declare ellipsoid = 
sphere{
    0,1
    scale <1,3,2>
    }
    
#declare period = 1;
#declare oscillator = cos(2*pi*clock/period);
#declare compression = 2;
#declare sign = function(C){C/abs(C)}
#declare compressed = pow(abs(oscillator),compression)*sign(oscillator);
    
#declare sphere_size = 2-1.2*compressed;

#declare sph = 
sphere{
    0,1
    scale sphere_size
}

#declare translucency = 0.7;

object{
    sph
    pigment{
        granite
        pigment_map{
            [0 rgbt <0,0,1,translucency>]
            [1 rgbt <0,1,1,translucency>]
        }
    }
}

object{
    ellipsoid
    pigment{        
        granite
        pigment_map{
            [0 rgbt <1,0,0,translucency>]
            [1 rgbt <1,1,0,translucency>]
        }
    }
}

#declare scale_factor = 0.99;

intersection{
    difference{
        object{sph}
        object{sph scale scale_factor}
    }
    difference{
        object{ellipsoid}
        object{ellipsoid scale scale_factor}
    }
    scale 1.0001
    pigment{
        granite
        pigment_map{
            [0 rgb <0,2,0>]
            [1 rgb <1,2,0>]
        }
    }
}    

plane{
    y,-5
    pigment{checker 
        pigment{rgb 1}
        pigment{rgb 0}
        }
}