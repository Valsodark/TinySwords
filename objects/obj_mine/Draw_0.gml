if selected {
	draw_set_alpha(.25)
	draw_ellipse_color(x - 90, y -30,x + 90,y + 25,c_aqua,c_aqua,true)
	draw_set_alpha(.1)
	draw_ellipse_color(x - 90, y -30,x + 90,y + 25,c_aqua,c_aqua,false)
	draw_set_alpha(1)
	draw_healthbar(x - 60,y- 90, x + 60,y - 100,hp,c_black,c_red,c_green,0,true,true)
}
draw_self()