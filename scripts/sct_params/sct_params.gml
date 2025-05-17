function sct_troups_param(_hp){
	target = noone
	foe = noone
	selected = false
	shop = noone
	mine = noone
	building = noone
	guarding = false
	guard_center = { x: 0, y: 0 };
	guard_radius = 250;
	state = "idle"
	spd = 4
	name = object_get_name(object_index)
	hp = _hp 
	worker = noone
	has_worker = false
	tower = noone
}

function sct_mouse_params(){
	mouseclick = false
	uiclick = true
	can_buy = true
	inventoryHover = -1
	slothHover = -1
	inventoryDrag = -1
	slothDrag = -1
	itemDrag = -1
	itemBuy = -1
	state = "stateFree"
	
	
	troups = [
	obj_player_worker,
	obj_player_warrior,
	obj_player_archer
	];
	building = [
	obj_house,
	obj_player_base,
	obj_player_tower
	];
	
}

function sct_part_params(){
	global._pt = part_type_create()
	var pt = global._pt
	
	part_type_shape(pt, pt_shape_ring)
	part_type_size(pt, 1,1,0,0)
	part_type_color3(pt,c_white,c_ltgray,c_dkgray)
	part_type_speed(pt,1,3,0,0)
	part_type_direction(pt,0,360,0,0)
	part_type_blend(pt,true)
	part_type_life(pt, 4, 2)
	part_type_alpha2(pt, .1, .1)
}

function sct_part_arrow_params(){
	global._pta = part_type_create()
	var pt = global._pta
	
	part_type_shape(pt, pt_shape_line)
	part_type_size(pt, 1,1,0,0)
	part_type_color3(pt,c_white,c_ltgray,c_dkgray)
	part_type_speed(pt,1,10,0,0)
	part_type_direction(pt,0,360,0,0)
	part_type_blend(pt,true)
	part_type_life(pt, 4, 2)
	part_type_alpha2(pt, .1, .1)
}

