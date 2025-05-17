// Inherit the parent event
event_inherited();

if (selected){
	
	if (instance_exists(obj_enemy_troup)){
		foe = instance_nearest(obj_mouse.x,obj_mouse.y,obj_enemy_troup)
		foe = point_distance(obj_mouse.x,obj_mouse.y,foe.x,foe.y - 25)
		if foe < 30 {
			with(target) instance_destroy()
			foe = instance_nearest(obj_mouse.x,obj_mouse.y,obj_enemy_troup)
			with(foe) selected = true
			state = "walk";
		}
	}
	if  sct_select_controler_no_shop(obj_player_archer) exit;
	
	if (instance_exists(obj_player_tower)){
		tower = instance_nearest(obj_mouse.x,obj_mouse.y,obj_player_tower)
		tower = point_distance(obj_mouse.x,obj_mouse.y,tower.x,tower.y)
		if tower < 100 {
			with(target){ instance_destroy() }
			tower = instance_nearest(obj_mouse.x,obj_mouse.y,obj_player_tower)
			with(tower) selected = true
			state = "toTower";
		}
	} 
}