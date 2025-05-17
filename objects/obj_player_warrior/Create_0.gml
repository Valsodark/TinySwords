event_inherited()
hp = 100
sct_troups_param(hp)

path = path_add();
cached_target_x = -1;
cached_target_y = -1;
pathfinding_timer = 0;

spr_array = [
    spr_warrior_side,
    spr_warrior_back,
    spr_warrior_side,
   spr_warrior_front];