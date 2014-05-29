#include "colors.inc"
#include "functions.inc"

camera{
        location <0,2,-10>
        look_at <0,-3,0>
}

light_source{
        //<15,20,5>
        <2, 1, -5>
        rgb 1
        area_light 5*x,5*y,10,10
        circular
        orient
        jitter
}

#declare pig_black=
        pigment{
                granite
                pigment_map{
                        [0.0 rgb 0]
                        [0.4 rgb .1]
                        [0.4 rgb <.1,.1,.2>]
                        [0.8 rgb <.2,.1,.2>]
                        [1.0 rgb .3]
                }
        }

#declare pig_white=
        pigment{
                granite
                pigment_map{
                        [0.0 rgb 1]
                        [.1 rgb .9]
                        [1.0 rgb .7]
                }
                scale 2
        }                                        
/*
//The main surface is CSG form.  Use for positioning.
union{
        sphere{<0,-5,0>,5.5}
        superellipsoid{
                <1,.1>
                rotate x*90
                scale <3,1,3>
                translate <0,-1,0>
        }        
        
        texture{
                pigment{
                        granite
                        pigment_map{
                                [0.0 pig_black]
                                [0.1 pig_black]
                                [0.4 pig_white]
                        }
                        scale 3
                }
                finish{
                        phong 1
                        diffuse 1
                }        
        }                        
}*/

#declare my_granite=
        function{
                pigment{
                        granite
                        pigment_map{
                                [0 rgb 0]
                                [1 rgb 1]
                        }
                        scale 4
                }
        }
        

/*
superellipsoid{
        <.8,.3>
        clipped_by{plane{z,0 inverse}}
        scale <6,5,15>
        translate <0,0,-7>
        
        texture{
                pigment{
                        granite
                        pigment_map{
                                [0 rgb 1]
                                [1 rgb .8]
                        }
                }
        }                        
}*/

#declare my_agate=
        function{
                pigment{
                        agate
                        pigment_map{
                                [0 rgb 0]
                                [1 rgb 1]
                        }
                }
        }                        

isosurface{
        function{
                -3*f_superellipsoid(x/6,y/5,(z+7)/15,.8,.3)
                + (f_noise3d(x,0,z)-0.5)
                + .1*(my_agate(x,y,z).gray)*exp(-z/5)
        }
        contained_by{box{<-8,-7,-7>,<8,7,25>}}
        open
        max_gradient 2.1
        texture{
                pigment{
                        granite
                        pigment_map{
                                [0 rgb 1]
                                [1 rgb .8]
                        }
                }
        }
}                       


//The main rock, in isosurface form.  Complete with texture.
isosurface{
        function{
                min(f_sphere(x,y+5,z,5.5),-f_superellipsoid((x/3),(z/3),-(y+1),1,.1))
                + .25*(f_noise3d(x,y,z)-0.5)
                + .1*(my_granite(x,y,z).gray-0.5)
        }        
        contained_by{sphere{<0,-5,0>,7}}
        max_gradient 2
        
        texture{
                pigment{
                        granite
                        pigment_map{
                                [0.0 pig_black]
                                [0.1 pig_black]
                                [0.4 pig_white]
                        }
                        scale 3
                }
                finish{
                        phong 1
                        diffuse 1
                }        
        }
}                


/*
plane{
        z,15
        texture{
                pigment{
                        spiral1 3
                        pigment_map{
                                [0.0 color Black]
                                [0.1 color White]
                        }
                        sine_wave
                        scale 3
                        
                        translate <0,-15,0>
                        
                        warp{turbulence .5}
                }
                finish{
                        ambient .8
                }        
        }
        texture{
                pigment{
                        radial
                        pigment_map{
                                [0.0 color Black]
                                [0.025 color Clear]
                        }
                        sine_wave
                        frequency 10
                        
                        rotate x*90
                        translate <0,-15,0>
                        warp{turbulence .5}                
                }
        }                
}
*/