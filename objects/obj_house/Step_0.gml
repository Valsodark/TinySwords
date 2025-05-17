event_inherited()
if (que.alarm[0] == 0 && !que.alarm_ended){
	que.alarm_ended = true
	
	if que.warrior{
		instance_create_layer(self.x,self.y + 60,"Instances",obj_player_warrior);
	}
	if que.archer {
		instance_create_layer(self.x,self.y + 60,"Instances",obj_player_archer);
	}
}

if selected {
	que.depth = -9000
}
else{
	que.depth = 1
}