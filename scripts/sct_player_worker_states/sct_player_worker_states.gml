function idle_worker_state(){
	friction = .5
	sprite_index = spr_worker_idle
}
function walk_worker_state(){
	friction = 0
	sprite_index = spr_worker_walk
	 if (instance_exists(target)){
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
function mine_worker_state(){
	friction = 0
	sprite_index = spr_worker_walk
	if (!instance_exists(mine)) {
		state = "idle";
		return;
	}

	mp_potential_step(mine.x, mine.y, 3, false);

	if (point_distance(x, y, mine.x, mine.y) < 32) {
		state = "mined";
	}

	if (speed > spd) speed = spd;
}
function mined_worker_state(){
	friction = 0
	sprite_index = spr_mine_walk

	if (!instance_exists(base)) {
		state = "idle";
		return;
	}

	mp_potential_step(base.x, base.y, 3, false);

	if (point_distance(x, y, base.x, base.y) < 48) {
		global.money += 100;
		state = "mine";
	}

	if (speed > spd) speed = spd;
}
function build_worker_state(){
	friction = 0;
	sprite_index = spr_worker_walk;

	if (!instance_exists(building)) {
		state = "idle";
		return;
	}

	mp_potential_step(building.x + 80, building.y + 20, 3, false);

	if (point_distance(x,y,building.x + 80,building.y + 20) < 1) {
		state = "building";
	}


	if (speed > spd) speed = spd;
}
function building_worker_state(){
	friction = .5
	sprite_index = spr_worker_build;
	if !instance_exists(building){
		//if building.alarm[0] == 0{
			state = "idle"
		//}
	}
}