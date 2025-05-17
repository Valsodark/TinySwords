with (obj_player_archer){
	if (wepon.id == other.id){
		 other.archer = id
	}
}

if instance_exists(archer){
	x = archer.x
	y = archer.y

	depth = archer.depth -1


	if instance_exists(archer.foe){

		image_angle = point_direction(x,y,archer.foe.x,archer.foe.y)
		image_yscale = sign(archer.foe.x - x)
		
		if image_index >= 6 && image_index <= 6.20 {
			arrow = instance_create_layer(x,y,"Instances",obj_arrow)
			arrow.direction = image_angle
			arrow.image_angle = image_angle
		}
	}else {
		image_angle = direction
		image_index = 0
		image_yscale = 1
	}
} else {
	instance_destroy()
}
