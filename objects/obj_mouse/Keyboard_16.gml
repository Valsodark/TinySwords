sprite_index = spr_attack
image_blend = c_red
if mouse_check_button_pressed(mb_left){
	with(obj_player_troup){
		if selected {
		    guarding = true;
		    guard_center.x = mouse_x;
		    guard_center.y = mouse_y;
			
			if (instance_exists(target)) {
				with(target) instance_destroy();
		    }
			
			target = instance_create_layer(mouse_x, mouse_y,"Instances", obj_target)
			state = "walk_to_guard";
		}
	}
}
