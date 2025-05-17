// Inherit the parent event
event_inherited();

var _range = 40

switch (state) {
    case "idle":
        idle_torch_state();
        break;
    case "walk":
        walk_torch_state(_range);
        break;
	case "attack":
		attack_torch_state(_range)
		break;
}
