#macro sphere_pack(thing, r,rotation)
        
        #local thing= object{thing rotate rotation}
        #local start=min_extent(thing);
        #local stop=max_extent(thing);
        
        union{
                #local xoffset=0;
                #local zoffset=0;
                
                #local current=start;
                #while (current.y <= stop.y+r)
                        #local current = <current.x, current.y, start.z - (r*sqrt(3)/3)*(.5-.5*pow(-1,zoffset))>;
                        #while (current.z <= stop.z+r)
                                #local current = <start.x - r*(.5 - .5*pow(-1,xoffset)), current.y, current.z>;
                                #while (current.x <= stop.x+r)
                                        
                                        #local test_shape =
                                                intersection{
                                                        object{thing}
                                                        sphere{current, r/100}
                                                }        
                                                                                        
                                        #local Norm = <0,0,0>;
                                        #local temp = trace(test_shape, current+<1,1,1>, <-1,-1,-1>, Norm);
                                        
                                        #if (vlength(Norm)!=0)
                                                sphere{current,r}
                                        #end         
                                
                                        #local current = <current.x+2*r, current.y, current.z>;
                                #end
                                #local xoffset=xoffset+1;
                                #local current = <current.x, current.y, current.z + r*sqrt(3)>;
                        #end
                        #local zoffset=zoffset+1;
                        #local current= <current.x, current.y + r*(2/3)*sqrt(6),current.z>;
                #end 
                
                rotate -rotation
        }
#end       