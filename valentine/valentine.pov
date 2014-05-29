// ini file
// Library_Path="scrolls"
// Initial_Frame = 1
// Final_Frame = 1440
// Initial_Clock = 0.0
// Final_Clock = 60.0
// Cyclic_Animation = on
// Width  = 1200
// Height = 900



// Times:
// t=5.5: First line displayed.
// t=51.0: Last line read.

#declare Scroll_BottomRollLength_func = function{
  spline{
    linear_spline
    5.5, 2.0
    51.0, -0.35
    55.0, -0.45
  }
}

#declare camera_location = function{
  spline{
    cubic_spline
    -3.0, <0,0,-0.25>
    0.0, <0.35,0,-0.5>
    5.5, <0,0,-0.75>
    55.0, <0,0,-0.75>
  }
}

#declare camera_look_at = function{
  spline{
    linear_spline
    5.5, <0,0,0>
    51.0 <0,.35,0>
  }
}

#declare crystal_transparency = function{
  spline{
    linear_spline
    0, 0
    4.5, 1
  }
}

#declare heart_location = function{
  spline{
    cubic_spline
    50.0, <0,1.5,0>
    51.0, <0,1.0,0>
    59.5, <0,0.32,-0.04>
    62.0, <0,0.32,-0.04>
  }
}

camera{
  location camera_location(clock)
  look_at camera_look_at(clock)
}

light_source{
  <-10,4,-4>
  color rgb 1
}
light_source{
  <-10,-7,-40>
  color rgb 1
}

#include "scroll.inc"
#include "scroll_typeset.inc"

// Set the length, in POV-Ray units at which the text (at the default size) will wrap.
#declare Scroll_LineLength    = 10;

#declare Scroll_TextSlant = -1;
#declare Scroll_BottomRollLength = Scroll_BottomRollLength_func(clock).x;
#declare Scroll_Length = 2.0;
#declare Scroll_TopMargin = 0.01;
#declare Scroll_BottomMargin = 0.01;

#declare Scroll_Increment = 0.001;
#declare Scroll_TopFactor    = 0.1;
#declare Scroll_BottomFactor = 0.1;

Scroll_WrapText("People come, and people fade away.")
Scroll_WrapText("They make their mark upon my life,")
Scroll_WrapText("then leave.")
Scroll_WrapText("No enmity, no arguments.")
Scroll_WrapText("Simply drifting.")
Scroll_WrapText("Even their names, lost to me.")
Scroll_NewParagraph(2)

Scroll_WrapText("It feels so strange, to hear your way,")
Scroll_WrapText("where each friendship holds and binds so tight.")
Scroll_WrapText("You hold to friends, known since near birth,")
Scroll_WrapText("while I drift off each time,")
Scroll_WrapText("just a few years.")
Scroll_NewParagraph(2)

Scroll_WrapText("Teach me to have your way, your view.")
Scroll_WrapText("Teach me to hold in decades, not in years or months.")
Scroll_WrapText("For you, with you, near you.")
Scroll_WrapText("I want a lifetime.")


// Generate a text object, specifying how the text is to be justified (Left, Right, Center or Full)
// Scale the text object so that it to fits within a unit square, using the default margins
#declare MyTextObject = Scroll_MakeTextObject("Full")
#declare MyTextObject = Scroll_FitToUnitSquare(MyTextObject)


// Create a scroll object and uv_map the text onto the front surface. Use a different texture for the back surface.
object {
  Scroll()
  texture{
    pigment{uv_mapping
      object{MyTextObject
  	color rgb <1,1,0.8>
  	color rgb <0.1,0.05,0.03>
      }
    }
  }
  interior_texture {
    pigment {color rgb <1,1,0.8>}
  }
  texture{
    pigment{uv_mapping
      crackle offset 0.3
      pigment_map{
  	[0.0 rgbt 1]
  	[0.35 rgbt 1]
  	[0.45 rgbt <0.3,0.2,0.2,0.3>]
  	[0.5 rgbt <0.1,0.1,0.1,0.3>]
  	[0.55 rgbt <0.05,0.05,0.05,0.3>]
      }
      scale <0.5,0.05,1>
      turbulence 0.3
    }
  }
  texture{
    #declare scale_factor = <0.1,0.02,0.1>;
    #declare transparency = crystal_transparency(clock).x;
    pigment{
      uv_mapping crackle
      pigment_map{
    	[0.0 rgbt <.3,.3,1,transparency>]
    	[0.2 rgbt <0,0,1,transparency>]
      }
      scale scale_factor
    }
    normal{uv_mapping crackle 0.3 scale scale_factor}
    finish{phong .2}
  }
  rotate -90*y
}

sky_sphere{
  pigment{
    granite
    color_map{
      [0 rgb <1,0,0>]
      [0.15 rgbt <0,0,0,1>]
    }
    scale .35
    translate 3
  }
  pigment{
    granite
    color_map{
      [0 rgb <0,1,0>]
      [0.15 rgbt <0,0,0,1>]
    }
    scale .35
    rotate 57
  }
}

#if(clock>50)
  isosurface{
    function{f_heart(x,y,z,-0.01)}
    contained_by{ box{-1.3,1.3}}
    all_intersections
    pigment{
      granite
      pigment_map{
	[0 rgbt <1.0, 0.0, 0.0, 0.2>]
	[1 rgbt <0.9, 0.1, 0.1, 0.2>]
      }
    }
    interior{ior 1.3}
    normal{crackle 1 scale 0.5}
    finish{phong 0.5}
    scale 0.03
    rotate 90*z
    rotate 230*x
    translate heart_location(clock)
  }
#end