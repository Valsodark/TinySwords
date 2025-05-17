function idle_archer_state(){
	friction = .5
	sprite_index = spr_archer_idle
	if guarding{
		state = "guard"
	}
}

function walk_archer_state(_range){
	friction = 0
	sprite_index = spr_archer_walk
	
	if (instance_exists(foe)){
		mp_potential_step(foe.x,foe.y,3,false)
		if distance_to_object(foe) < _range{
			state = "attack"
			return;
		}
	} else if (instance_exists(target)){
		mp_potential_step(target.x,target.y,3,false)
		if distance_to_object(target) < 20{
			state = "idle"
			with(target) instance_destroy();
		}
		if (speed > spd) speed = spd;
	}
	else {
		state = "idle"
	}
}

function attack_archer_state(){
	friction = 0.5
	if (!instance_exists(foe)) {
		state = "idle";
		return;
	}
	direction = point_direction(x, y, foe.x, foe.y);
	sprite_index = spr_array[round(direction / 60) % 6];
		if image_index >= 6 && image_index <= 6.20 {
			var arrow = instance_create_layer(x,y,"Instances",obj_arrow)
			arrow.direction = direction
			arrow.image_angle = arrow.direction
		}
	if (speed > spd) speed = spd;
}

function archer_walk_to_guard_state(){
	friction = 0;
    sprite_index = spr_archer_walk;
	
	mp_potential_step(target.x, target.y, 3, false);
	
	if (distance_to_object(target) < 4) {
		with(target) instance_destroy();
        state = "guard";
    }

    if (speed > spd) speed = spd;
}

function archer_gard_warrior_state(){
	friction = 0;
    sprite_index = spr_archer_idle;

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
			image_xscale =  sign(foe.x - x)
			sprite_index = spr_archer_walk;
		} else {
			sprite_index = spr_archer_idle;
		}
    }
}

function to_tower_state(){
	friction = 0
	sprite_index = spr_archer_walk;
	if(!instance_exists(tower)){
		state = "idle"
		return;
	}
	
	with(target){ instance_destroy() }
	
	mp_potential_step(tower.x,tower.y,3,false)
	if (distance_to_object(tower) < 20) {
		state = "inTower" 
	}
}
function in_tower_state(){
	friction = 0.5
    sprite_index = spr_archer_idle;
	if(!instance_exists(tower)){
		state = "idle"
		return;
	}
	
	with(target){ instance_destroy() }
	
	x = tower.x
	y = tower.y 
	depth = -2996
	foe = instance_nearest(x,y,obj_enemy_troup)
	tower.archer = id
	if distance_to_object(foe) < 400 {
		direction = point_direction(x, y - 90, foe.x, foe.y);
		sprite_index = spr_array[round(direction / 60) % 6];
		if image_index >= 6 && image_index <= 6.20 {
			var arrow = instance_create_layer(x,y - 90,"Instances",obj_arrow)
			arrow.direction = direction
			arrow.image_angle = arrow.direction
		}
		foe = instance_nearest(x,y,obj_enemy_troup)
	}
}