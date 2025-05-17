if part_type_exists(global._pt){
	part_particles_create(global.ps, x, y, global._pt, 1)
}
call_later(.1, time_source_units_seconds, function(){ instance_destroy() },false);