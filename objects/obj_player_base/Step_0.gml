image_index = 0
if (que.alarm[0] == 0 && !que.alarm_ended){
	instance_create_layer(self.x,self.y + 60,"Instances",obj_player_worker);
	que.alarm_ended = true
}

if selected {
	que.depth = -9000
}
else{
	que.depth = 1
}

if hp <= 0 {
	image_index = 1
}