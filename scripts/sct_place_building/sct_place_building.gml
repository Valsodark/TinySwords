function sct_place_building(_building,_price){
	if (global.money < _price){
		state = "stateFree";
		itemDrag = -1;
		inventoryDrag = -1;
		slothDrag = -1;
		return;
	}
    var build = instance_create_layer(round(x / 160) * 160, round(y / 160) * 160, "Instances", _building);
    var worker = sct_get_objs(obj_player_worker);
    if (worker != noone) {
        build.worker = worker;
        with (worker) {
            building = build;
            state = "build";
        }
    }
    global.money -= _price;
    state = "stateFree";
    itemDrag = -1;
    inventoryDrag = -1;
    slothDrag = -1;
}
