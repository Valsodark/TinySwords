draw_sprite_stretched(
	Banner_Horizontal,
	0,
	x,
	y,
	12 + rowLength * 105,
	12+(((panel_sloths - 1) div rowLength)+1) * 200
)


for (var i = 0; i < panel_sloths; i++){
	var xx = x + (i mod rowLength) * 84 + 70;
	var yy = y + (i div rowLength) * 84 + 70;
	var hover = (obj_mouse.inventoryHover == id) && (obj_mouse.slothHover == i)
	draw_sprite_stretched(Carved_Regular,hover,xx,yy,64 + 20,64 + 20)
	if (inventory[i] != -1){
		var alpha = 1
		if (hover){
			alpha = .5;
		}
		
		switch(inventory[i]){
			case obj_house:
				draw_sprite_stretched(House_Blue,0,xx+ 10 ,yy - 10 ,64,96)
			break;
			case obj_player_tower:
				draw_sprite_stretched(Tower_Blue,0,xx+ 15 ,yy - 10 ,52,96)
			break;
			case obj_player_worker:
				draw_sprite(spr_worker_idle,0,xx + 42,yy + 60)
			break;
			case obj_player_warrior:
				draw_sprite(spr_warrior_idle,0,xx + 42,yy + 60)
			break;
			case obj_player_archer:
				draw_sprite(spr_archer_idle,0,xx + 42,yy + 60)
			break;
		}
		draw_set_alpha(1)
	}
}
