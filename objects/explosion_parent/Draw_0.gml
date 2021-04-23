/// @description Draw explosion
image_alpha = lifespan / max_lifespan;
var size = (.5 + image_alpha) * radius/BLOOM_SIZE;
draw_sprite_ext(bloom_sp,0,x,y,size,size,0,image_blend,image_alpha);
draw_self();