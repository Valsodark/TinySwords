part_particles_create(global.psa, x, y, global._pta, 1)
call_later(10, time_source_units_seconds, function(){ instance_destroy() },false);

depth = -2999