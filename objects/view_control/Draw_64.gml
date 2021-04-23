/// @description Draw debug
draw_set_color(c_white);
draw_set_font(display_font);
	var aim_offset = aim_distance / max(1, zoom * zoom_lerp_effect);
draw_text(10,190,"Zoom:" + string(zoom));
draw_text(10,200,"Aim Offset:" + string(aim_offset));
