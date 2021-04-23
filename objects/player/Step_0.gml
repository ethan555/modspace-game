/// @description Inherit outside construction

// Inherit the parent event
if (!construction) {
	event_inherited();
}

if (warping == 0) {
	var warp = instance_place(x,y,warp_gate);
	if (warp != noone) {
		var warp_direction = point_direction(x,y,warp.x,warp.y);
		if (abs(angle_difference(warp_direction,dir)) < WARP_ANGLE && spd > 0) {
			// Warp!
			warping = 1;
			warp_spd = spd;
			warp_dir = warp.warp_direction;
			warp_room = warp.room_to;
			room_from = room;
			audio_play_sound(whoosh_synthetic_s,1,false);
		}
	}
} else {
	// Warp
	var warp_amount = abs(warping);
	if (warp_amount < warp_time) {
		var warp_spd_extra = warping > 0 ? (warp_amount / warp_time) : 1 - (warp_amount / warp_time);
		if (warping > 0) {
			// Warping out
			warping = approach(warping, warp_time, 1);
		} else {
			// Warping in
			warping = approach(warping, -warp_time, 2);
		}
		x += warp_spd_extra * lengthdir_x(WARP_SPEED,warp_dir);
		y += warp_spd_extra * lengthdir_y(WARP_SPEED,warp_dir);
	} else {
		if (warping > 0) {
			if (instance_exists(view_control)) {
				zoom = view_control.zoom;
			}
			room_goto(warp_room);
			warping = -1;
		} else {
			warping = 0;
		}
	}
}