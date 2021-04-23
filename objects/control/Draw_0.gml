/// @description Draw construction gui
if (construction) {
	var view_width = camera_get_view_width(view_camera[0]);
	var view_height = camera_get_view_height(view_camera[0]);
	var view_third_width =  view_width/ 3;
	var view_third_height = view_height / 3;
	
	draw_sprite_ext(rectangle_sp,0,view_third_width*2,0,view_third_width,1,0,c_white,1);
	draw_sprite_ext(rectangle_sp,0,view_third_width*2,0,1,view_height,0,c_white,1);
	draw_sprite_ext(rectangle_sp,0,view_third_width*2,view_height-1,view_third_width,1,0,c_white,1);
	draw_sprite_ext(rectangle_sp,0,view_width-1,0,1,view_height,0,c_white,1);
}