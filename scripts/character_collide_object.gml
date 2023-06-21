/// character_collide_object(side)
    
    var character, left, right, top, bottom;
    
    for(var i = 0; i < instance_number(par_character); i++) {
        character[i] = instance_find(par_character, i);
        
        // Define hitbox size:
        switch(argument0) {
            // Main hitbox:
            case side_index.main:
                left   = -character[i].wall_width;
                top    = -character[i].hitbox_height;
                right  = character[i].wall_width;
                bottom = character[i].hitbox_height;
            break;
            
            // Left side of the hitbox:
            case side_index.left:
                left   = -character[i].wall_width - 1;
                top    = 1;
                right  = 0;
                bottom = 5;
            break;
            
            // Right side of the hitbox:
            case side_index.right:
                left   = 0;
                top    = 1;
                right  = character[i].wall_width + 1;
                bottom = 5;
            break;
            
            // Top of the hitbox:
            case side_index.top:
                left   = -character[i].wall_width;
                top    = -character[i].hitbox_height - 1;
                right  = character[i].wall_width;
                bottom = 0;
            break;
            
            // Extended top of the hitbox:
            case side_index.top_ext:
                left   = -character[i].wall_width;
                top    = -character[i].hitbox_height - 16;
                right  = character[i].wall_width;
                bottom = 0;
            break;
            
            // Bottom of the hitbox:
            case side_index.bottom:
                left   = -character[i].wall_width;
                top    = 0;
                right  = character[i].wall_width;
                bottom = character[i].hitbox_height + 1;
            break;
            
            // Extended bottom of the hitbox:
            case side_index.bottom_ext:
                left   = -character[i].wall_width;
                top    = 0;
                right  = character[i].wall_width;
                bottom = character[i].hitbox_height + 16;
            break;
        }
        
        // Character events:
        with(character[i]) {
            if(collision_rectangle(floor(x) + left, floor(y) + top, floor(x) + right, floor(y) + bottom, other, true, true) && collision_allow) return id;
        }
    }
