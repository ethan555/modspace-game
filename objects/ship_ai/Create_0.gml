/// @description Init ai states

// Inherit the parent event
event_inherited();
patrol_x = random(room_width);
patrol_y = random(room_height);

/*
ai_state_times[0] = seconds_to_frames(3);
ai_state_times[1] = seconds_to_frames(1);
ai_state_times[2] = seconds_to_frames(2);
*/

alarm[DIALOGUE_ALARM] = random_gauss(dialogue_time,dialogue_dev);