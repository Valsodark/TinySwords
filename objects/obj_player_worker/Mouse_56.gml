// Inherit the parent event
event_inherited();

if state == "build" || state == "building"{
	exit;
}

if selected  {
	if !instance_exists(shop){
		shop = instance_create_layer(-1,-1,"Instances",obj_panel)
		inventory_add_item_in_sloth(shop,obj_house,0)
		inventory_add_item_in_sloth(shop,obj_player_tower,1)
	}
}
else if instance_exists(shop) {
	with(shop) instance_destroy();
}