/// @description Choose explosion
event_inherited();

sprite_index = choose(explosion_1_sp,explosion_3_sp,explosion_7_sp,explosion_8_sp);
explosion_sound = choose(exp_light1_s,exp_light2_s,exp_light3_s,exp_light4_s);
audio_play_at(explosion_sound,x,y,1,false,1);
image_angle = random(360);

max_lifespan = lifespan;