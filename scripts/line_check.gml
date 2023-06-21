/// line_check(radius_x, radius_y, [optional] semi_solid)
    
    // Disable collision:
    if(!collision_allow) exit;
    
    // Semi solid:
    if(argument_count > 2) semi_solid = argument[2];
    else semi_solid = false;
    
    var X1, X2, Y1, Y2;
    switch(mode) {
        case 0:
            X1 = argument[0];
            Y1 = 0;
            X2 = argument[0];
            Y2 = argument[1];
        break;
        
        case 1:
            X1 = 0;
            Y1 = -argument[0];
            X2 = argument[1];
            Y2 = -argument[0];
        break;
        
        case 2:
            X1 = argument[0];
            Y1 = 0;
            X2 = argument[0];
            Y2 = -argument[1] - 1;
        break;
        
        case 3:
            X1 = 0;
            Y1 = argument[0];
            X2 = -argument[1] - 1;
            Y2 = argument[0];
        break;
    }
    
    // Trigger collision:
    if(collision_line(floor(x) + X1, floor(y) + Y1, floor(x) + X2, floor(y) + Y2, par_solid, true, true)){
        var solidCollisions = ds_list_create();
        var SolidCount = collision_line_list(floor(x) + X1, floor(y) + Y1, floor(x) + X2, floor(y) + Y2, par_solid, true, true, solidCollisions, false);
        
        for(var i = 0; i < SolidCount; i++) {
            var Solid = solidCollisions[| i];

            if(Solid.collision_flag) {
                if(Solid.collision_type = "Full Solid" && Solid.collision_layer = "Both Layers" ||
                Solid.collision_type = "Full Solid" && Solid.collision_layer = "Layer A" && plane = 0 ||
                Solid.collision_type = "Full Solid" && Solid.collision_layer = "Layer B" && plane = 1 ||
                Solid.collision_type = "Semi Solid" && semi_solid && Solid.platform_check && platform_check) {
                    ds_list_destroy(solidCollisions);
                    return true;
                }
            }
        }
        ds_list_destroy(solidCollisions);
    }
