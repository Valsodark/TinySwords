sct_select_controller(obj_player_worker)


if keyboard_check_pressed(ord("L")){
	var enemy = instance_create_layer(50,50,"Instances",obj_enemy_torch);
}
if keyboard_check_pressed(ord("K")){
	var good = instance_create_layer(600,600,"Instances",obj_player_warrior);
}