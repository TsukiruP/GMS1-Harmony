/// character_collision()
    
    // Left wall collision:
    while(point_check(-wall_width, wall_height)){
        x += y_dir;
        y -= x_dir;
    }
    
    // Right wall collision:
    while(point_check(wall_width, wall_height)){
        x -= y_dir;
        y += x_dir;
    }
    
    if(!on_object && ground_collision_allow) {
        if(y_speed >= 0 && !ground) {
            if(line_check(hitbox_width, hitbox_height, true) || line_check(-hitbox_width, hitbox_height, true)){
                ground       = true;
                landed       = true;
                ground_speed = x_speed;
                character_angle_detection();
                
                // Landing speed (from angles 24 to 90):
                if(ground_angle >= 24 && ground_angle <= 90) {
                    if(ground_angle >= 45) {
                        if(abs(x_speed) <= abs(y_speed)) ground_speed = y_speed * -1;
                        else ground_speed = x_speed;
                    } else {
                        if(abs(x_speed) <= abs(y_speed)) ground_speed = (y_speed / 2.0) * -1;
                        else ground_speed = x_speed;
                    }
                }
                
                // Landing speed (from angles 270 to 336):
                if(ground_angle >= 270 && ground_angle <= 336) {
                    if(ground_angle >= 315) {
                        if(abs(x_speed) <= abs(y_speed)) ground_speed = y_speed;
                        else ground_speed = x_speed;
                    } else {
                        if(abs(x_speed) <= abs(y_speed)) ground_speed = (y_speed / 2.0);
                        else ground_speed = x_speed;
                    }
                }
            }
        }
        
        // Slope collision:
        if(ground) {
            // Detatch:
            if(!line_check(hitbox_width, hitbox_height + 14, true) && !line_check(-hitbox_width, hitbox_height + 14, true) && !force_roll && detach_allow) ground = false;
            
            // Move down slope:
            if(line_check(hitbox_width, hitbox_height + 14, true) && !ramp_fix || line_check(-hitbox_width, hitbox_height + 14, true) && !ramp_fix) {
                while(!line_check(hitbox_width, hitbox_height, true) && !line_check(-hitbox_width, hitbox_height, true)){
                    x += x_dir;
                    y += y_dir;
                }
            }
            
            // Move up slope:
            while(line_check(hitbox_width, hitbox_height, true) || line_check(-hitbox_width, hitbox_height, true)) {
                x -= x_dir;
                y -= y_dir;
            }
        }
        
        // Ceiling collision:
        if(!ground) {
            // Ceiling landing:
            if(point_check(-hitbox_width, -hitbox_height) && !point_check(hitbox_width, -hitbox_height) && y_speed < -2.5 && ceiling_allow && !ground
            || point_check(hitbox_width, -hitbox_height) && !point_check(-hitbox_width, -hitbox_height) && y_speed < -2.5 && ceiling_allow && !ground) {
                ceiling_landing = 1;
            }
            
            if(ceiling_landing == 1) {
                var TempAngle = get_angle();
                
                if(TempAngle <= 180 - 25 || TempAngle >= 180 + 25){
                    ground_angle    = get_angle();
                    ceiling_landing = 2;
                } else ceiling_landing = 0;
            }
            
            if(ceiling_landing == 2) {
                if(ground_angle < 180) ground_speed = -y_speed;
                else ground_speed = y_speed;
                
                ceiling_landing = 0;
                control_lock    = 2;
                ceiling_lock    = 16;
                state           = state_index.normal;
                ground          = true;
            }
            
            if(mode == 0) {
                while(line_check(hitbox_width, -hitbox_height) || line_check(-hitbox_width, -hitbox_height)) {
                    y += 1;
                    
                    // Stop vertical speed;
                    if(y_speed < 0) y_speed = 0;
                }
            }
        }
    }
