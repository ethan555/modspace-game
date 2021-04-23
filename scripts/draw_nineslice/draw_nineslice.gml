function draw_nineslice(sprite_,width_,height_,x1,y1,x2,y2) {
	// Middle
	draw_sprite_part_ext(sprite_,0,width_,height_,1,1,x1+width_,y1+height_,x2-x1-width_*2,y2-y1-height_*2,c_white,gui_alpha);
	// Top Middle
	draw_sprite_part_ext(sprite_,0,width_,0,1,height_,x1+width_,y1,x2-x1-width_*2,1,c_white,gui_alpha);
	// Bottom Middle
	draw_sprite_part_ext(sprite_,0,width_,height_*3,1,height_,x1+width_,y1+height_*3,x2-x1-width_*2,1,c_white,gui_alpha);
	// Left Middle
	draw_sprite_part_ext(sprite_,0,0,height_,width_,1,x1,y1+height_,1,y2-y1-height_*2,c_white,gui_alpha);
	// Right Middle
	draw_sprite_part_ext(sprite_,0,width_*3,height_,width_,1,x2-width_,y1+height_,1,y2-y1-height_*2,c_white,gui_alpha);
	// Top Left
	draw_sprite_part_ext(sprite_,0,0,0,width_,height_,x1,y1,1,1,c_white,gui_alpha);
	// Top Right
	draw_sprite_part_ext(sprite_,0,width_*3,0,width_,height_,x2-width_,y1,1,1,c_white,gui_alpha);
	// Bottom Left
	draw_sprite_part_ext(sprite_,0,0,height_*3,width_,height_,x1,y2-height_,1,1,c_white,gui_alpha);
	// Bottom Right
	draw_sprite_part_ext(sprite_,0,width_*3,height_*3,width_,height_,x2-width_,y2-height_,1,1,c_white,gui_alpha);
}