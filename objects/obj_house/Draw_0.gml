// Inherit the parent event

if selected {
	draw_set_alpha(.25)
	draw_ellipse_color(x - 60, y + 45,x + 60,y + 20,c_aqua,c_aqua,true)
	draw_set_alpha(.1)
	draw_ellipse_color(x - 60, y + 45,x + 60,y + 20,c_aqua,c_aqua,false)
	draw_set_alpha(1)
	draw_healthbar(x -30 ,y - 170, x + 30,y - 160,hp,c_black,c_red,c_green,0,true,true)
}

event_inherited();