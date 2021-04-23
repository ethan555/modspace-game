/// @description Get Controls
inputs[PRIMARY] = false;
inputs[SECONDARY] = false;
aim_point = new_aim_point(x+lengthdir_x(1000,image_angle),y+lengthdir_y(1000,image_angle));
script_execute(control_script);
speed_added = false;
ship_moved = false;