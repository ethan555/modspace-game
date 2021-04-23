function init_explosion(explosion, sprite){
	part_type_sprite(explosion,sprite,true,true,false);
	part_type_size(explosion,.25,2,0,0);
	//part_type_color_hsv(explosion,0,255,50,50,255,255);
	part_type_direction(explosion,0,359,0,0);
	part_type_orientation(explosion,0,359,0,0,false);
	part_type_speed(explosion,0,.1,-.001,0);
	part_type_alpha3(explosion,1,1,0);
	part_type_life(explosion,seconds_to_frames(.7),seconds_to_frames(1));
}