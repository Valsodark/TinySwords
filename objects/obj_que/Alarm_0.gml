
if (iwar != -1 && iarc == -1){
	warrior = inventory_remove(self,obj_player_warrior)
}
else if (iwar == -1 && iarc != -1) {
	archer = inventory_remove(self,obj_player_archer)
} else if (iwar != -1 && iarc != -1) {
	if (iwar < iarc ){
		warrior = inventory_remove(self,obj_player_warrior)
	}
	else {
		archer = inventory_remove(self,obj_player_archer)
	}
}
worker = inventory_remove(self,obj_player_worker)
deque = false
