/// character_semisolids()
    
    semisolid_check = true;
    
    // Disable collision:
    if(mode != 0) {
        if(mode != 0 || y_speed <= 0 && !ground) platform_check = false;
    } else {
        with(par_solid) {
            if(collision_type = "Semi Solid"){
                platform_check = true;
             
                //Check if player is colliding from the top
                if(character_collide_object(side_index.top)){
                    platform_check = false;
                }
            }
        }
    }
