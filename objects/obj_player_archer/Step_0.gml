// Inherit the parent event
event_inherited();

switch (state) {
    case "idle":
        idle_archer_state();
        break;
    case "walk":
        walk_archer_state(250);
        break;
    case "attack":
        attack_archer_state();
        break;
	case "walk_to_guard":
		archer_walk_to_guard_state();
		break;
    case "guard":
        archer_gard_warrior_state();
        break;
	case "toTower":
		to_tower_state();
		break;
	case "inTower":
		in_tower_state();
		break;
}

if instance_exists(foe){
	image_xscale = sign(foe.x - x)
} else if instance_exists(tower){
	image_xscale = sign(tower.x - x)
} else if instance_exists(target){
	image_xscale = sign(target.x - x)
}