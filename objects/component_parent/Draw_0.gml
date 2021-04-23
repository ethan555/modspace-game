/// @description Draw Component
if (construction) {
	if (drag) {
		var xx = round(x / 16)*16-8, yy = round(y / 16)*16-8;
		//var xx = round(bbox_left / 16)*16, yy = round(bbox_top / 16)*16;
		var width = bbox_right - bbox_left + 1;
		var height = bbox_bottom - bbox_top + 1;
	
		draw_sprite_ext(rectangle_sp,0,xx,yy,width,height,0,image_blend,.5);
		draw_circle(dx,dy,4,false);
	} else if (position_meeting(mouse_x, mouse_y, id)) {
		
	}
	draw_self();
} else {
	if (instance_exists(parent)) {
		draw_sprite_ext(sprite_index,0,
			round(parent.x) + dx * lengthdir_x(1, parent.image_angle) + dy * lengthdir_x(1, 270+parent.image_angle),
			round(parent.y) + dx * lengthdir_y(1, parent.image_angle) + dy * lengthdir_y(1, 270+parent.image_angle),
			image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	} else {
		draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}
}
