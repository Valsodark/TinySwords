function sct_toggle_select(press_x,press_y,release_x,release_y){
	// press
	px = press_x
	py = press_y
	
	//release
	rx = release_x
	ry = release_y
	
	var _minX = min(px,rx),
	_maxX = max(px,rx),
	_minY = min(py,ry),
	_maxY = max(py,ry);
	
	if obj_mouse.itemDrag != -1 return;
	if obj_mouse.itemBuy != -1 return;
	// Case
	if(point_in_rectangle(x,y,_minX,_minY,_maxX,_maxY)){
		selected = true
	} else if (distance_to_object(obj_mouse) < 10) {
		with(instance_nearest(px, py, obj_troup)) 
		selected = true;
	} 
	else {
		selected = false;
	}
}