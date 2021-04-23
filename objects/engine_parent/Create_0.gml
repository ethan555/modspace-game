/// @description Add trail effect

// Inherit the parent event
event_inherited();

//add_trail(x,y,10,8,0,1,0,trail_color);
//engine_flares = new flare_data(trail_sprite, seconds_to_frames(.5), 3, 4, sqrt(2), 2, sqrt(1), .5, 0, 90, c_white);
engine_flares = new flare_data(trail_sprite, seconds_to_frames(.5), 3, .5, 1.5, .25, 1.25, 1, 0, 0, c_white);
