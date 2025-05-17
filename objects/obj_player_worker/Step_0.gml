// Inherit the parent event
event_inherited();

guarding = false
switch (state) {
    case "idle":
       idle_worker_state();
       break;
    case "walk":
        walk_worker_state();
        break;
    case "mine":
        mine_worker_state();
        break;
	case "mined":
		mined_worker_state();
		break;
    case "build":
        build_worker_state();
        break;
	case "building":
        building_worker_state();
        break;	
}

if instance_exists(mine){
	image_xscale = sign(mine.x - x)
} else if  instance_exists(building){
	image_xscale = sign(building.x - x)
} else if instance_exists(target){
	image_xscale = sign(target.x - x)
}

if state == "build" || state == "building"{
	with(shop) instance_destroy();
}