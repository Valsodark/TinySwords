// Inherit the parent event
event_inherited();


if selected {
	if !instance_exists(shop){
		shop = instance_create_layer(-1,-1,"Instances",obj_panel)
		inventory_add_item_in_sloth(shop,obj_player_worker,0)
	}
}
else if instance_exists(shop) {
	with(shop) instance_destroy();
}