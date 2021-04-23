/// @description Button

var hover = position_meeting(mouse_x,mouse_y,id);

if (hover) {
	image_index = 1;
	if (mouse_check_button_pressed(mb_left)) {
		script_execute(on_click_script);
	}
} else {
	image_index = 0;
}
