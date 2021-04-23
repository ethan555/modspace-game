/// @description Draw beep

var beep_alpha = power((dsin(lifespan*10)+1)/2,2);
draw_sprite_ext(bloom_sp,0,x,y,beep_radius/BLOOM_SIZE,beep_radius/BLOOM_SIZE,0,image_blend,beep_alpha);
draw_self();
