/// @description Follow the player
if (instance_exists(player)) {
	// Follow the player
	var target_ = player;
	zoom = clamp(zoom + (((mouse_wheel_down() - mouse_wheel_up())) * zoom_rate), zoom_min, zoom_max);
	
	// Handle screenshake
	var screenshake_x = 0, screenshake_y = 0;
	if (screenshake_time > 0) {
		screenshake_x = random_gauss(0,sqrt(screenshake_amount * zoom));
		screenshake_y = random_gauss(0,sqrt(screenshake_amount * zoom));
		screenshake_time = max(0, screenshake_time - 1);
	} else {
		screenshake_amount = 0;
	}
	
	var mx = mouse_x;
	var my = mouse_y;
	var move_rate = 1;//min(1, lerp_rate / (zoom * zoom_lerp_effect));
	var view_zoom_offset = max(1,zoom * zoom_lerp_effect);
	var aim_offset = aim_distance / view_zoom_offset;
	var zoom_offset = min(1, view_offset_rate * view_zoom_offset);
	var t_x = round(target_.x);
	var t_y = round(target_.y);
	var aim_x = lerp(t_x, mx, aim_offset) - t_x;
	var aim_y = lerp(t_y, my, aim_offset) - t_y;
	var warping = 0;
	if (player.warping != 0) {
		warping = player.warping > 0 ? player.warping / player.warp_time : 1 - abs(player.warping) / player.warp_time;
	}
	view_offset_x = lerp(lerp(view_offset_x,aim_x,zoom_offset), 0, warping);
	view_offset_y = lerp(lerp(view_offset_y,aim_y,zoom_offset), 0, warping);
	
	var xx = t_x + view_offset_x + screenshake_x,//round((target_.bbox_left + target_.bbox_right) / 2),
		yy = t_y + view_offset_y + screenshake_y;//round((target_.bbox_top + target_.bbox_bottom) / 2);
	
	//var pos_x = camera_get_view_x(view_camera[0]);
	//var pos_y = camera_get_view_y(view_camera[0]);
	var view_w = camera_get_view_width(view_camera[0]);
	var view_h = camera_get_view_height(view_camera[0]);
	//Get new sizes by interpolating current and target zoomed size
	var new_w = lerp(view_w, zoom * start_width, zoom_lerp_rate);
	var new_h = lerp(view_h, zoom * start_height, zoom_lerp_rate);
	//Apply the new size
	camera_set_view_size(view_camera[0], new_w, new_h);
	
	var cam_w = new_w * .5;
	var cam_h = new_h * .5;
	
	var new_x = xx - cam_w;//round(lerp(pos_x, xx - cam_w, lerp_rate));
	var new_y = yy - cam_h;//round(lerp(pos_y, yy - cam_h, lerp_rate));
	x = xx;
	y = yy;
	
	camera_set_view_pos(view_camera[0], new_x, new_y);
	
	// Zoom
	
	/*var view_w = camera_get_view_width(view_camera[0]);
	var view_h = camera_get_view_height(view_camera[0]);
	//Get new sizes by interpolating current and target zoomed size
	var new_w = lerp(view_w, zoom * start_width, zoom_lerp_rate);
	var new_h = lerp(view_h, zoom * start_height, zoom_lerp_rate);
	//Apply the new size
	camera_set_view_size(view_camera[0], new_w, new_h);
	
	//Get the shift necessary to re-align the view.
	var shift_x = camera_get_view_x(view_camera[0]) - (new_w - view_w) * 0.5;
	var shift_y = camera_get_view_y(view_camera[0]) - (new_h - view_h) * 0.5;
	//Update the view position
	camera_set_view_pos(view_camera[0],shift_x,shift_y);*/
}
