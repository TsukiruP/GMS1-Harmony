/// point_check(radius_x, radius_y, [optional] semi_solid)

    // Disable collision:
    if(!collision_allow) exit;
    
    if(collision_point(floor(x) + argument[0] * y_dir + argument[1] * x_dir, floor(y) + argument[1] * y_dir + argument[0] * -x_dir, par_solid, true, true)) {
        // Get the value from the object with what youre coliding:
        var solidCollisions = ds_list_create();
        var SolidCount = collision_point_list(floor(x) + argument[0] * y_dir + argument[1] * x_dir, floor(y) + argument[1] * y_dir + argument[0] * -x_dir, par_solid, true, true, solidCollisions, false);
    
        for(var i = 0; i < SolidCount; i++) {
            var Solid = solidCollisions[| i];
            
            if(Solid.collision_flag) {
             if(Solid.collision_type = "Full Solid" && Solid.collision_layer = "Both Layers" ||
                Solid.collision_type ="Full Solid" && Solid.collision_layer = "Layer A" && plane = 0 ||
                Solid.collision_type ="Full Solid" && Solid.collision_layer = "Layer B" && plane = 1 ||
                Solid.collision_type ="Semi Solid" && Solid.platform_check && semi_solid && platform_check) {
                    ds_list_destroy(solidCollisions);
                    return true;
             }
          }
       }
       ds_list_destroy(solidCollisions);
    }
