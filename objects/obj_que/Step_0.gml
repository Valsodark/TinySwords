var cx = camera_get_view_x(view_camera[0])
var cy = camera_get_view_y(view_camera[0])

if sct_get_objs(obj_house) || sct_get_objs(obj_player_base){
	x = cx + 1000
	y = cy + 350
	visible = true
}
else {
	x = -1
	y = -1
	visible = false
}

for (var i = 0; i < panel_sloths; i++){
	if( inventory[i] != -1) && !deque {
		alarm[0] = 100
		deque = true
		alarm_ended = false
		warrior = false
		archer = false
		worker = false
	}
}

iwar = sct_inventory_search(id,obj_player_warrior)
iarc = sct_inventory_search(id,obj_player_archer)