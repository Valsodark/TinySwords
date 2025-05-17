if state == "build" || state == "building" {
	exit;
}
event_inherited()
if (selected){
	if (instance_exists(obj_mine)){
		mine = instance_nearest(obj_mouse.x,obj_mouse.y,obj_mine)
		mine = point_distance(obj_mouse.x,obj_mouse.y,mine.x,mine.y - 25)
		if mine < 50 {
			with(target){ instance_destroy() }
			mine = instance_nearest(obj_mouse.x,obj_mouse.y,obj_mine)
			with(mine) selected = true
			state = "mine";
		}
	} 
}
