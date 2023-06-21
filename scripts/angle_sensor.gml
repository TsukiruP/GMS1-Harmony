/// angle_sensor(x, y)
    
    // Disable collision:
    if(!collision_allow) exit;
    
    if(collision_point(floor(argument[0]), floor(argument[1]), par_solid, true, true)) {
        // Get the value from the object with what youre coliding:
        var solidCollisions = ds_list_create();
        var SolidCount = collision_point_list(floor(argument[0]), floor(argument[1]), par_solid, true, true, solidCollisions, false);
    
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
