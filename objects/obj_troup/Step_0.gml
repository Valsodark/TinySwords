if hp <= 0 {
	instance_create_layer(x,y,"Instances",obj_dead);
	with(shop) instance_destroy();
	instance_destroy();
}

depth = -y;