/// character_direction()

    // Input difference:
    var input_press = keyboard_check(vk_right) - keyboard_check(vk_left);
    
    if(ground) {
        if(input_press != 0 && sign(ground_speed) = input_press && control_lock = 0) facing = sign(input_press);
    } else {
        if(input_press != 0) facing = input_press;
    }
    
    image_xscale = facing;
