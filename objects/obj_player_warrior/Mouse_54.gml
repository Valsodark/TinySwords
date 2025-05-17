event_inherited()

if (!selected){
	exit;
}

if (!instance_exists(obj_enemy_troup)){
	exit;
}

foe = instance_nearest(obj_mouse.x,obj_mouse.y,obj_enemy_troup)
foe = point_distance(obj_mouse.x,obj_mouse.y,foe.x,foe.y - 25)

if foe >= 30 {
	exit;
}

with(target){ instance_destroy()}
foe = instance_nearest(obj_mouse.x,obj_mouse.y,obj_enemy_troup)
with(foe) selected = true
state = "walk";

