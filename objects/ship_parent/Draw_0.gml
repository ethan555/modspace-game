/// @description Draw ship
//draw_self();
/*
draw_sprite_ext(ship_core_sprite,0,
	x-sprite_get_width(ship_core_sprite)/2,
	y-sprite_get_height(ship_core_sprite)/2,
	image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	*/
draw_sprite_ext(sprite_index,0,
	round(x),
	round(y),
	image_xscale,image_yscale,image_angle,image_blend,image_alpha);
//draw_set_color(c_white);
//draw_point(x,y);
/*
var length;
for (var i = 0, length = ds_list_size(layout_list); i < length; i++) {
	// Draw the layout
}
*/
