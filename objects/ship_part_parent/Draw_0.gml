/// @description Draw layout
if (construction) {
	if (drag) {
		var xx = round(x / 16)*16-8, yy = round(y / 16)*16-8;
		//var xx = round(bbox_left / 16)*16, yy = round(bbox_top / 16)*16;
		var width = bbox_right - bbox_left + 1;
		var height = bbox_bottom - bbox_top + 1;
	
		draw_sprite_ext(rectangle_sp,0,xx,yy,width,height,0,image_blend,.5);
		draw_circle(dx,dy,4,false);
	}
	draw_self();
} else {
	draw_sprite_ext(sprite_index,0,
		round(parent.x) + dx * lengthdir_x(1, parent.image_angle) + dy * lengthdir_x(1, 270+parent.image_angle),
		round(parent.y) + dx * lengthdir_y(1, parent.image_angle) + dy * lengthdir_y(1, 270+parent.image_angle),
		image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}
/*var layout_size = sprite_get_width(layout_nineslice_sp) / 3;
draw_sprite_part_ext(layout_nineslice_sp,0,layout_size,layout_size,layout_size,layout_size,x,y,1,1,c_white,1);

if (!instance_place(x,y-1,layout_parent)) {
	draw_sprite_part_ext(layout_nineslice_sp,0,layout_size,0,layout_size,layout_size,x,y,1,1,c_white,1);
}
if (!instance_place(x-1,y,layout_parent)) {
	draw_sprite_part_ext(layout_nineslice_sp,0,0,layout_size,layout_size,layout_size,x,y,1,1,c_white,1);
}
if (!instance_place(x+1,y,layout_parent)) {
	draw_sprite_part_ext(layout_nineslice_sp,0,layout_size*2,layout_size,layout_size,layout_size,x,y,1,1,c_white,1);
}
if (!instance_place(x,y+1,layout_parent)) {
	draw_sprite_part_ext(layout_nineslice_sp,0,layout_size,layout_size*2,layout_size,layout_size,x,y,1,1,c_white,1);
}
