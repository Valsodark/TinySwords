// Inherit the parent event

if selected {
	draw_set_alpha(.25)
	draw_ellipse_color(x - 22, y - 10,x + 22,y + 20,c_aqua,c_aqua,true)
	draw_set_alpha(.1)
	draw_ellipse_color(x - 22, y - 10,x + 22,y + 20,c_aqua,c_aqua,false)
	draw_set_alpha(1)
	if state != "inTower"{
		draw_healthbar(x - 30,y- 90, x + 30,y - 100,hp,c_black,c_red,c_green,0,true,true)
	}
}

if state != "inTower" {
	draw_self()
} else {
	draw_sprite(sprite_index, image_index, x, y- 90);
}