if (selected) {
    if (instance_exists(target)) {
        with(target) instance_destroy();
    }
	guarding = false
	
	target = instance_create_layer(mouse_x, mouse_y,"Instances", obj_target)
	state = "walk";
}