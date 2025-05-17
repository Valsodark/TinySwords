/// === AI CONTROLLER STEP EVENT ===

ai_money += 0.5;


build_timer++;
if (build_timer > 60 && ai_money >= 100) {
    var u = instance_create_layer(x + irandom(100), y + 50, "Instances", obj_enemy_torch);
    u.team = "ai";
    array_push(task_force, u);
    ai_money -= 100;
    build_timer = 0;
}


// --- Goal Cooldown ---
if (goal_cooldown > 0) {
    goal_cooldown--;
    return; // Wait before issuing new goal
}

// --- Only 1 active goal at a time ---
if (active_goal != undefined && active_goal.active) {
    if (!instance_exists(active_goal.foe)) {
        // Try to find a new target of the same type
        var new_target = undefined;

        if (active_goal.target_type == "unit") {
            new_target = nearest_player_unit();
        } else if (active_goal.target_type == "structure") {
            new_target = instance_nearest(x, y, obj_player_base);
        }

        if (instance_exists(new_target)) {
            // Retarget the goal
            active_goal.foe = new_target;

            // Reassign the units
            for (var i = 0; i < array_length(task_force); i++) {
                var u = task_force[i];
                if (instance_exists(u) && u.state == "idle") {
                    u.foe = new_target;
                    u.state = "walk";
                }
            }
        } else {
            // No target left; goal complete
            active_goal = undefined;
            goal_cooldown = 180;
        }
    }
    return;
}

// --- Generate new goal if none is active ---
attack_timer++;
if (attack_timer > 180) {
    var unit_target = nearest_player_unit();
    var structure_target = instance_nearest(x, y, obj_player_base);

    if (instance_exists(unit_target)) {
        active_goal = create_attack_goal(unit_target, "unit");
    } else if (instance_exists(structure_target)) {
        active_goal = create_attack_goal(structure_target, "structure");
    }
    attack_timer = 0;
}

// --- Assign units to goal if not yet triggered ---
if (active_goal != undefined && !active_goal.triggered) {
    var ready_units = [];

    // Select idle units that match goal
    for (var i = 0; i < array_length(task_force); i++) {
        var u = task_force[i];
        if (!instance_exists(u)) continue;

        var can_use = (active_goal.target_type == "unit" && u.unit_type != UnitType.Worker)
            || (active_goal.target_type == "structure" && u.unit_type == UnitType.Melee);

        if (can_use && u.state == "idle") {
            array_push(ready_units, u);
        }
    }

    if (array_length(ready_units) >= active_goal.force_size) {
        // Trigger goal
        for (var j = 0; j < active_goal.force_size; j++) {
            var u = ready_units[j];
            u.foe = active_goal.foe;
            u.state = "walk";
        }
        active_goal.triggered = true;
        active_goal.active = true;
    }
}