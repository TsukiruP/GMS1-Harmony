/// character_hitbox()
    
    old_hitbox_height = hitbox_height;
    
    if(ceiling_lock = 0 && ground) {
        x += (old_hitbox_height - hitbox_height) * x_dir;
        y += (old_hitbox_height - hitbox_height) * y_dir;
    }
