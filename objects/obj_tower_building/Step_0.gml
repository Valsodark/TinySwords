 if (alarm[0] > 0){
	hp = (100 + 1) - (round(alarm[0]) / 10)
}

if (instance_exists(worker) && worker.state == "building") {
	 if (alarm_paused > 0) {
        alarm[0] = alarm_paused;
        alarm_paused = -1;
    }
	if worker.image_index >= 3 && worker.image_index <= 3.20{
		hit = true
	} 
	
} else {
    if (alarm[0] > 0) {
        alarm_paused = alarm[0];
        alarm[0] = -1;
    }
}

	if hit {
		var pos = animcurve_channel_evaluate(animCurve, precent)
		precent += 2/60
		image_xscale = 1 - pos * .3
		image_yscale = 1 - pos * .1
	}
	
	if precent > 1 {
		precent = 0
		hit = false
	}