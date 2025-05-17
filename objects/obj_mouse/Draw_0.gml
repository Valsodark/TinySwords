if (itemDrag != -1){
	draw_set_alpha(0.5)
	draw_set_alpha(1)
	var dx = round(x / 160) * 160
	var dy = round(y / 160) * 160
	switch(itemDrag){
		case obj_house:
		if place_meeting(dx,dy,[obj_troup,obj_palyer_building,obj_wall]){
			draw_sprite_ext(House_Blue,0,dx,dy,1,1,0,c_red,1)
		}else {
			draw_sprite_ext(House_Blue,0,dx,dy,1,1,0,c_green,1)
		}
		break;
		case obj_player_tower:
		if place_meeting(dx,dy,[obj_troup,obj_palyer_building,obj_wall]){
			draw_sprite_ext(Tower_Blue,0,dx,dy,1,1,0,c_red,1)
		}else {
			draw_sprite_ext(Tower_Blue,0,dx,dy,1,1,0,c_green,1)
		}
		break;
	}

}
if (mouseclick){
	draw_set_alpha(.25)
	draw_rectangle_color(px,py,mouse_x,mouse_y,c_aqua,c_aqua,c_aqua,c_aqua,true)
	draw_set_alpha(.1)
	draw_rectangle_color(px,py,mouse_x,mouse_y,c_aqua,c_aqua,c_aqua,c_aqua,false)
	draw_set_alpha(1)
}
draw_self()