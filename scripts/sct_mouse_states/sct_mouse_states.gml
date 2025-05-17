 function isTroup(){
	if (slothHover == -1) return false;
	if (inventoryHover.inventory[slothHover] == -1) return false;
	if (!uiclick) return false;
	for (var i = 0; i < array_length(troups);i++){
		if (inventoryHover.inventory[slothHover] == troups[i]){
			return true;
		}
	}
	return false
}
function isBuilding(){
	if (!mouse_check_button(mb_left)) return false;
	if (slothHover == -1) return false;
	if (inventoryHover.inventory[slothHover] == -1) return false;
	if (!uiclick) return false;
	for (var i = 0; i < array_length(building);i++){
		if (inventoryHover.inventory[slothHover] == building[i]){
			return true;
		}
	}
	return false
}


function chooseState(){
	sct_mouse_over()
	
	if isTroup() {
		state = "stateBuy"
		itemBuy = inventoryHover.inventory[slothHover]
		itemDrag = -1
		inventoryDrag = -1
		slothDrag = -1
		
	}
	else if isBuilding() {
		state = "stateDrag";
		itemBuy = -1
		itemDrag = inventoryHover.inventory[slothHover]
		inventoryDrag = inventoryHover
		slothDrag = slothHover
	}
	else if !mouse_check_button(mb_left) && itemDrag == -1{
		state = "stateFree"
		itemBuy = -1
		itemDrag = -1
		inventoryDrag = -1
	}
}

function stateFree(){
	sct_mouse_over()
	state = "stateFree"
	itemBuy = -1
	itemDrag = -1
	inventoryDrag = -1
}
function stateBuy(){
	sct_mouse_over()
	if (mouse_check_button_pressed(mb_left)){
		switch (itemBuy){
			case obj_player_warrior:
			if global.money >= 100 {
				var house = sct_get_objs(obj_house);
				with(house)	inventory_add(que.id,obj_player_warrior);
				global.money -= 100;
			}
			break;
			case obj_player_worker:
			if global.money >= 75 {
				with(obj_player_base)	inventory_add(que.id,obj_player_worker);
				global.money -= 75;
			}
			break;
			case obj_player_archer:
			if global.money >= 75 {
				var house = sct_get_objs(obj_house);
				with(house)	inventory_add(que.id,obj_player_archer);
				global.money -= 75;
			}
			break;
		}
	}
}

function stateDrag(){
	sct_mouse_over()
	if (itemDrag != -1) {
		var price = 0
		if (mouse_check_button_released(mb_left) && !place_meeting(x,y,[obj_troup,obj_palyer_building,obj_wall])){
			if (itemDrag == obj_house){
				price = 100
				sct_place_building(obj_house_building,price)
			} else 	if (itemDrag == obj_player_tower){
				price = 150
				sct_place_building(obj_tower_building,price)
			} 
		} else if (mouse_check_button_released(mb_left) && place_meeting(x,y,[obj_troup,obj_palyer_building,obj_wall])){
				state = "stateFree";
				itemDrag = -1;
				inventoryDrag = -1;
				slothDrag = -1;
		}
	}
}
