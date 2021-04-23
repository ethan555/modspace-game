/// @description Init to player

if (instance_exists(player)) {
	//var target_ = player;
	//var mx = mouse_x;
	//var my = mouse_y;
	//var move_rate = 1;//min(1, lerp_rate / (zoom * zoom_lerp_effect));
	//var view_zoom_offset = max(1,zoom * zoom_lerp_effect);
	//var aim_offset = aim_distance / view_zoom_offset;
	//var zoom_offset = min(1, view_offset_rate * view_zoom_offset);
	//var t_x = round(target_.x);
	//var t_y = round(target_.y);
	//var aim_x = lerp(t_x, mx, aim_offset) - t_x;
	//var aim_y = lerp(t_y, my, aim_offset) - t_y;
	view_offset_x = 0;//aim_x;
	view_offset_y = 0;//aim_y;
}
