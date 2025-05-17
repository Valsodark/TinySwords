function sct_move_view(){
	right = keyboard_check(ord("A"))
	left = keyboard_check(ord("D"))
	up = keyboard_check(ord("W"))
	down = keyboard_check(ord("S"))

	var camX = camera_get_view_x(view_camera[0])
	var camY = camera_get_view_y(view_camera[0])
	var camW = camera_get_view_height(view_camera[0])
	var camH = camera_get_view_width(view_camera[0])
	

	
	if right {
		x -= 4
	}
	if left {
		x += 4
	}
	if up {
		y -= 4
	}
	if down {
		y += 4
	}
	camera_set_view_pos(view_camera[0], x, y)
}