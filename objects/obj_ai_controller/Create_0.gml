// AI State
ai_money = 0;
build_timer = 0;
attack_timer = 0;
active_goal = undefined;
goal_cooldown = 0;

// Task force definition (basic example)
task_force = []; // Will be filled with units

// AI goals
goal_queue = []; // Each goal is a struct
// Reference to player base
player_base = instance_nearest(x,y,obj_player_base);

enum UnitType {
    Melee,
    Ranged,
    Suicide,
    Worker
}
