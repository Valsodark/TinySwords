function sct_inventory_search(rootObject,itemType){
	for (var i = 0; i < rootObject.panel_sloths; i++){
		if (rootObject.inventory[i] == itemType){
			return (i);
		}
	}
	return (-1)
}


function inventory_remove(rootObject,itemType){
	var _sloth = sct_inventory_search(rootObject,itemType)
	if (_sloth != -1){
		with(rootObject) inventory[_sloth] = -1;
		return true;
	}
	else return false
}

function inventory_add(rootObject,itemType){
	var _sloth = sct_inventory_search(rootObject,-1)
	if (_sloth != -1){
		with(rootObject) inventory[_sloth] = itemType;
		return true;
	}
	else return false
}
function inventory_add_item_in_sloth(rootObject,itemType,_sloth){
	if (_sloth != -1 && _sloth < rootObject.panel_sloths){
		with(rootObject) inventory[_sloth] = itemType;
	}
	else return false
}

