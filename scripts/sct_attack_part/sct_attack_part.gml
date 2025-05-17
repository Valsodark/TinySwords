function sct_attack_part(_obj){
	if image_index > 3 and image_index < 3.20{
		var slash = instance_create_layer(x,y,"Instances",_obj)
		slash.direction = (round(direction / 90) % 4) * 90;
		slash.image_angle = (round(direction / 90) % 4) * 90;
	}
}