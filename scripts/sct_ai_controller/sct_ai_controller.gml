function create_attack_goal(target, target_type = "unit") {
    return {
        type: "attack",
        target_type: target_type, // "unit" or "structure"
        foe: target,
        force_size: 5 + irandom(2),
        triggered: false,
        active: false
    };
}

function nearest_player_unit() {
    return instance_nearest(x, y, obj_player_troup); // Or whatever your player units are called
}
function goal_queue_push_unique(goal) {
    // Prevent stacking identical attack goals
    for (var i = 0; i < array_length(goal_queue); i++) {
        var g = goal_queue[i];
        if (g.type == goal.type && g.foe == goal.foe && !g.triggered) {
            return; // Already queued
        }
    }
    array_push(goal_queue, goal);
}