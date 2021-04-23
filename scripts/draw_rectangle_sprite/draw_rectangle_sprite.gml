function draw_rectangle_sprite(x_,y_,width_,height_,color_,alpha_) {
	draw_sprite_ext(rectangle_sp,0,x_,y_,width_,1,0,color_,alpha_);
	draw_sprite_ext(rectangle_sp,0,x_,y_+1,1,height_-2,0,color_,alpha_);
	draw_sprite_ext(rectangle_sp,0,x_,y_+width_-1,width_,1,0,color_,alpha_);
	draw_sprite_ext(rectangle_sp,0,x_+width_-1,y_+1,1,height_-2,0,color_,alpha_);
}