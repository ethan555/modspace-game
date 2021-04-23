/// @description Debug

// Inherit the parent event
event_inherited();

if (debug) {
	draw_set_color(c_white);
	draw_circle(x,y,target_range,true);
}