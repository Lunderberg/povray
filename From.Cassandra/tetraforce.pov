#include "colors.inc"

camera{
        location <0,3,-7>
        look_at <0,0,0>
        rotate y*210
}

light_source{
        <10,20,30>
        rgb 1
        area_light 3*x,3*y,10,10
        circular
        orient
        
}            

#macro Sier(iter)
        #if (iter)
                union{
                        #local prev = Sier(iter-1)
                        object{prev scale 0.5 translate <0,1.5,0>}
                        object{prev scale 0.5 translate <0,-0.5,sqrt(2)>}
                        object{prev scale 0.5 translate <0,-0.5,sqrt(2)> rotate y*120}
                        object{prev scale 0.5 translate <0,-0.5,sqrt(2)> rotate y*240}
                }
        #else
                intersection{
                        plane{-y,1}
                        plane{-y,1 rotate x*109.5}
                        plane{-y,1 rotate x*109.5 rotate y*120}
                        plane{-y,1 rotate x*109.5 rotate y*240}
                        bounded_by{sphere{0,4}}
                }
                //sphere{<0,1,0>, 2}
        #end
#end              

plane{
        y,-1
        texture{
                pigment{rgb <0,.7,0>}
                normal{bumps 0.5}
        }        
}

object{
        Sier(5)
        pigment{rgb <1,1,0>*.8}
        finish{phong 1}
        normal{bumps .5 scale .1}
}      

sphere{
        <0,0,0>, 5
        pigment{rgbt 1}
        hollow
        interior{
                media{
                        emission <1,1,0>*0.25
                        density{
                                spherical
                                density_map{
                                        [0 rgb 0]
                                        [1 rgb 1]
                                }
                                     
                                scale 5             
                                //warp{turbulence 0.5}
                        }
                        density{
                                spiral1 1
                                density_map{
                                        [0 rgb 0]
                                        [1 rgb 1]
                                }
                                scale 1
                                warp{turbulence .75}
                        }                
                }
        }
        translate <0,1,0>
}