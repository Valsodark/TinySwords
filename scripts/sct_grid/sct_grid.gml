function move_to_object(_target, _speed, _grid, _path_var, _cooldown, _threshold) {
    // Assumes the caller (self) has these instance variables:
    // - cached_target_x
    // - cached_target_y
    // - pathfinding_timer

    if (!instance_exists(_target)) return false;

    var tx = _target.x;
    var ty = _target.y;

    if (pathfinding_timer <= 0 || point_distance(cached_target_x, cached_target_y, tx, ty) > _threshold) {
        cached_target_x = tx;
        cached_target_y = ty;
        pathfinding_timer = _cooldown;

        if (mp_grid_path(_grid, _path_var, x, y, tx, ty, true)) {
            path_start(_path_var, _speed, path_action_stop, false);
        }
    }

    // Countdown timer
    if (pathfinding_timer > 0) {
        pathfinding_timer--;
    }

    return true;
}
