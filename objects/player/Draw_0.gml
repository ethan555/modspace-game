/// @description Draw cursor

// Inherit the parent event


event_inherited();

//draw_set_color(c_white);
if (warping != 0) {
	//Draw flare
	var warp_amount = warping > 0 ? power(warping / warp_time,.5) : (warp_time + warping) / warp_time;
	draw_sprite_ext(warp_flare_sp,0,x,y,warp_amount,warp_amount,image_angle,image_blend,warp_amount);
}

var mx = mouse_x, my = mouse_y;
//draw_circle(mx,my,2,false);