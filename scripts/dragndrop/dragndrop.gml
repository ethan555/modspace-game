// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function dragndrop() {
	var mx = mouse_x, my = mouse_y;
	if (drag) {
		x = mx;//-sprite_width*.5;//mouse_x;
		y = my;//-sprite_height*.5;//mouse_y;
		//var xx = round(x / 16)*16, yy = round(y / 16)*16;
		var xx = round(x/16)*16,//bbox_left / 16)*16+8,
			yy = round(y/16)*16;//bbox_top / 16)*16+8;
		
		var change_angle = keyboard_check_pressed(ord("Q")) - keyboard_check_pressed(ord("E"));
		image_angle = modulo(image_angle + 90 * change_angle, 360);
		/*if (keyboard_check_pressed(ord("Q")) || keyboard_check_pressed(ord("E"))) { 
			// Rotate to alternate angle
			var temp_index = sprite_index;
			sprite_index = alternate_sprite;
			alternate_sprite = temp_index;
		}*/

		if (xx != dx || yy != dy || change_angle != 0) {
			dx = xx;
			dy = yy;
			var empty = !place_meeting(xx,yy,layout_parent) && !place_meeting(xx,yy,ship_parent);//place_empty(xx,yy);
			var adjacent = place_adjacent(xx,yy);
			valid = empty && adjacent;
			image_blend = valid ? c_white : c_red;
		}
	
		if (mouse_check_button_released(mb_left)) {
			drag = false;
			image_alpha = 1;
			var empty = !place_meeting(xx,yy,layout_parent) && !place_meeting(xx,yy,ship_parent);//place_empty(xx,yy);
			var adjacent = place_adjacent(xx,yy);
			var ship = instance_find(ship_parent,0);
			valid = empty && adjacent && layout_number <= ship.max_layouts;
			if (valid) {
				x = xx;
				y = yy;
				dx = x - ship.x;
				dy = y - ship.y;
				parent = ship;
			} else {
				reset_piece();
			}
			with(layout_parent) {
				// Reset so we can recursively check if the pieces are valid
				valid = false;
			}
			with (ship) {
				check_valid_ship();
			}
		}
	} else {
		if (mouse_check_button_pressed(mb_left) && layout_bool) {
			if (position_meeting(mx, my, id)) {
				drag = true;
				image_alpha = .5;
				var xx = round(bbox_left / 16)*16, yy = round(bbox_top / 16)*16;
				x = xx;
				y = yy;
			}
		}
	}
}