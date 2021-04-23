/// @description Draw warp
if (warping != 0) {
	var warp_amount = warping > 0 ? warping : (warp_time + warping);
	var warp_alpha = warp_amount / warp_time;
	var warp_distance = warping > 0 ? warping : (warp_time - warping);
	var gx = display_get_gui_width() / 2, gy = display_get_gui_height() / 2;
	draw_sprite_ext(warp_effect_sp,0,gx-lengthdir_x(warp_distance*WARP_EFFECT_SPEED,warp_dir),gy-lengthdir_y(warp_distance*WARP_EFFECT_SPEED,warp_dir),WARP_SCALE,WARP_SCALE,warp_dir,c_white,warp_alpha);
}