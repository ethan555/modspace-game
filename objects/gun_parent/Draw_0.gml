/// @description Draw gun base and gun

if (construction) {
	if (drag) {
		var xx = round(x / 16)*16-8, yy = round(y / 16)*16-8;
		//var xx = round(bbox_left / 16)*16, yy = round(bbox_top / 16)*16;
		var width = bbox_right - bbox_left + 1;
		var height = bbox_bottom - bbox_top + 1;
	
		draw_sprite_ext(rectangle_sp,0,offset_x(xx,gun_offset_x,gun_offset_y,image_angle),offset_y(yy,gun_offset_x,gun_offset_y,image_angle),width,height,0,image_blend,.5);
	}
	//draw_sprite_ext(base_sprite,0,xx,yy,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle+gun_angle,image_blend,image_alpha);
} else {
	var xx = round(parent.x) + lengthdir_x(dx, parent.image_angle) + lengthdir_x(dy, 270+parent.image_angle),
		yy = round(parent.y) + lengthdir_y(dx, parent.image_angle) + lengthdir_y(dy, 270+parent.image_angle);
	draw_sprite_ext(mask_index,0,xx,yy,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	draw_sprite_ext(sprite_index,0,offset_x(xx,gun_offset_x,gun_offset_y,image_angle),offset_y(yy,gun_offset_x,gun_offset_y,image_angle),image_xscale,image_yscale,gun_angle,image_blend,image_alpha);
}
