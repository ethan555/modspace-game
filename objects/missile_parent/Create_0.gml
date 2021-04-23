/// @description Add trail

// Inherit the parent event
event_inherited();

add_trail(x,y,10,4,0,1,0,c_white);
flares = new flare_data(trail_sprite, seconds_to_frames(.5), 3, .5, 1.5, .25, 1.25, 1, 0, 0, c_white);
