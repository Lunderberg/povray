#include "colors.inc"

#declare rook = 
        difference{
                sor{
                        9
                        <0,0>,<.25,0>,<.15,.075>,<.24,.15>,<.2,.18>,<.16,.25>,<.25,.3>,<.25,.4>,<.25,.5>
                }
        }        
        


camera{
        location <0,.2,-1.5>
        look_at 0
}

object{
        rook
        pigment{rgb 1}
}

light_source{
        <1,.2,-1>*10
        rgb 1
}                        