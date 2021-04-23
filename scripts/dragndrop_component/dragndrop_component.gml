// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function dragndrop_component() {
	var mx = mouse_x, my = mouse_y;
	if (drag) {
		x = mx;//-sprite_width*.5;//mouse_x;
		y = my;//-sprite_height*.5;//mouse_y;
		//var xx = round(x / 16)*16, yy = round(y / 16)*16;
		var xx = round(x/16)*16,//bbox_left / 16)*16+8,
			yy = round(y/16)*16;//bbox_top / 16)*16+8;

		var change_angle = keyboard_check_pressed(ord("Q")) - keyboard_check_pressed(ord("E"));
		image_angle = modulo(image_angle + 90 * change_angle, 360);

		if (xx != dx || yy != dy || change_angle != 0) {
			dx = xx;
			dy = yy;
			valid = place_meeting(xx,yy,layout_parent) && !place_meeting(xx,yy,component_parent);
			image_blend = valid ? c_white : c_red;
		}
	
		if (mouse_check_button_released(mb_left)) {
			drag = false;
			image_alpha = 1;
			var ship = instance_find(ship_parent,0);
			if (valid) {
				x = xx;
				y = yy;
				dx = x - ship.x;
				dy = y - ship.y;
				parent = ship;
			} else {
				reset_piece();
				x = x_start;
				y = y_start;
				image_blend = c_white;
			}
			/*with(layout_parent) {
				// Reset so we can recursively check if the pieces are valid
				valid = false;
			}
			with (ship) {
				check_valid_ship();
			}*/
		}
	} else {
		if (position_meeting(mx, my, id) && !layout_bool) {
			if (mouse_check_button_pressed(mb_left) ) {
				drag = true;
				image_alpha = .5;
				var xx = round(bbox_left / 16)*16, yy = round(bbox_top / 16)*16;
				x = xx;
				y = yy;
				image_blend = c_white;
			} else {
				image_blend = c_ltgray;
			}
		} else {
			image_blend = c_white;
		}
	}
}