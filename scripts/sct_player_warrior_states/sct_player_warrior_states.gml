function idle_warrior_state(){
	friction = .5
	sprite_index = spr_warrior_idle
	if guarding{
		state = "guard"
	}
}

function walk_warrior_state(_range){
	friction = 0
	sprite_index = spr_warrior_walk
	
	if (instance_exists(foe)){
		mp_potential_step(foe.x,foe.y,3,false)
		if distance_to_object(foe) < _range{
			state = "attack"
			return;
		}
	} else if (instance_exists(target)){
		mp_potential_step(target.x,target.y,3,false)
		if distance_to_object(target) < 4{
			state = "idle"
			with(target) instance_destroy();
		}
		if (speed > spd) speed = spd;
	}
	else {
		state = "idle"
	}
}

function attack_warrior_state(_range){
	friction = 0.5
	if (!instance_exists(foe)) {
		state = "idle";
		return;
	}
	if distance_to_object(foe) > _range{
		state = "walk"
		return;
	}

		direction = point_direction(x, y, foe.x, foe.y);
		sprite_index = spr_array[round(direction / 90) % 4];
		sct_attack_part(obj_player_slash);
	if (speed > spd) speed = spd;
}

function walk_to_guard_state(){
	friction = 0;
    sprite_index = spr_warrior_walk;
	
	mp_potential_step(target.x, target.y, 3, false);
	
	if (distance_to_object(target) < 4) {
		with(target) instance_destroy();
        state = "guard";
    }

    if (speed > spd) speed = spd;
}

function gard_warrior_state(){
	friction = 0;
    sprite_index = spr_warrior_idle;

	if (!instance_exists(foe)) {
        with (obj_enemy_troup) {
            var d = point_distance(x, y, other.guard_center.x, other.guard_center.y);
            if (d <= other.guard_radius) {
                other.foe = id;
                other.state = "walk";
                exit; 
            }
        }
		if (point_distance(x, y, guard_center.x, guard_center.y) > 250 * 0.6) {
			mp_potential_step(guard_center.x, guard_center.y, 3, false);
			if (instance_exists(foe)){
				image_xscale =  sign(foe.x - x)
			}
			sprite_index = spr_warrior_walk;
		} else {
			sprite_index = spr_warrior_idle;
		}
    }
}