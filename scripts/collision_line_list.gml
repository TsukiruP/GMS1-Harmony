/// collision_line_list(x1,y1,x2,y2,obj,prec,notme,list,order)
//
//  Returns a list data structure populated with the ids of instances 
//  colliding with a given line, or noone if no instances found.
//
//      x1,y1       start point of the collision line, real
//      x2,y2       end point of the collision line, real
//      obj         object to check for collision (or all), real
//      prec        true for precise collision checking, bool
//      notme       true to ignore the calling instance, bool
//
/// GMLscripts.com/license
{
    var x1, y1, x2, y2, obj, prec, notme, dsid, order, num, i;
    
    x1 = argument0;
    y1 = argument1;
    x2 = argument2;
    y2 = argument3;
    obj = argument4;
    prec = argument5;
    notme = argument6;
    dsid = argument7;
    order = argument8;
    num = 0;
    
    if(order) {
        var priority = ds_priority_create();
        var cx = mean(x1, x2);
        var cy = mean(y1, y2);
        
        with(obj) {
            if(!notme || id != other.id) {
                i = collision_line(x1, y1, x2, y2, id, prec, false);
                
                if(i != noone) {
                    ds_priority_add(priority, i, point_distance(cx, cy, i.x, i.y));
                    num++;
                }
            }
        }
        
        while(ds_priority_size(priority)) {
            ds_list_add(dsid, ds_priority_delete_min(priority));
        }
        ds_priority_destroy(priority);
    } else {
        with(obj) {
            if(!notme || id != other.id) {
                i = collision_line(x1, y1, x2, y2, id, prec, false);
                
                if(i != noone) {
                    ds_list_add(dsid, i);
                    num++;
                }
            }
        }
    }
    
    return num;
}
