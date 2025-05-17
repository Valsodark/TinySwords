function idle_torch_state(){
	friction = .5
	sprite_index = spr_torch_idle
}

function walk_torch_state(_range){
	friction = 0
	sprite_index = spr_torch_walk

	if (instance_exists(foe)){
		mp_potential_step(foe.x,foe.y,3,false)
		if distance_to_object(foe) < _range{
			state = "attack"
			return;
		}
	}
}

function attack_torch_state(_range){
	if (!instance_exists(foe)) {
		state = "idle";
		return;
	}
	if distance_to_object(foe) > _range{
		state = "walk"
		foe = noone;
		return;
	}
	direction = point_direction(x, y, foe.x, foe.y);
	sprite_index = spr_array[round(direction / 90) % 4];
	sct_attack_part(obj_enemy_slash);
	show_debug_message("yes")
	if (speed > spd) speed = spd;
}