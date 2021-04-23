/// @description Draw Engines

// Draw engine trails
//draw_sprite_ext(trail_sprite,0,x,y,trail_size * random_range(.75,1.25),trail_size,image_angle,image_blend,image_alpha);
if (!construction && !destroyed && parent != noone && engine_flares != noone)
	draw_flares(engine_flares, parent.ctrl_spd > 0);
event_inherited();
