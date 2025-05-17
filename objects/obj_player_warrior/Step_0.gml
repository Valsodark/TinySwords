event_inherited();

switch (state) {
    case "idle":
        idle_warrior_state();
        break;

    case "walk":
        walk_warrior_state(40);
        break;

    case "attack":
        attack_warrior_state(40);
        break;
	case "walk_to_guard":
		walk_to_guard_state();
		break;
    case "guard":
        gard_warrior_state();
        break;
		
}

if instance_exists(foe){
	image_xscale = sign(foe.x - x)

} else if instance_exists(target){
	image_xscale = sign(target.x - x)
}