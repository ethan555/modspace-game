/// @description Draw backgrounds

// Furthest back
var xx = room_width / 2;
var yy = room_height / 2;
var dx = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2;
var dy = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2;

// Very back. Might not be transparent.
// Second back
for (var i = 0; i < 4; ++i) {
	var bg_data = background_data[i];
	if (bg_data == noone) continue;
	if (bg_data.tiled) {
		draw_sprite_tiled_ext(
			bg_data.sprite,
			0,
			bg_data.xx+(dx+bg_offset_x)/bg_data.dist_x,
			bg_data.yy+(dy+bg_offset_y)/bg_data.dist_y,
			bg_data.scale,bg_data.scale,
			bg_data.bg_color,bg_data.alpha
		);
	} else {
		draw_sprite_ext(
			bg_data.sprite,
			0,
			(xx + bg_data.xx+dx+bg_offset_x)/bg_data.dist_x,
			(yy + bg_data.yy+dy+bg_offset_y)/bg_data.dist_y,
			bg_data.scale,bg_data.scale,
			bg_data.bg_rotation,
			bg_data.bg_color,bg_data.alpha
		);
	}
}