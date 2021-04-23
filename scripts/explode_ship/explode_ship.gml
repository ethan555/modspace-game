function explode_ship(){
	// Destroy the ship
	var w = (bbox_right - bbox_left)/2, h = (bbox_bottom - bbox_top)/2;
	part_emitter_region(part_system,part_emitter,bbox_left-w,bbox_right+w,bbox_top-h,bbox_bottom+h,ps_shape_ellipse,ps_distr_gaussian);
	repeat(clamp(weight, 3, 10)) {
		part_emitter_burst(part_system,part_emitter,choose_explosion(),1);
	}
	var shake_amount = min(2*weight/5, 5);
	if (instance_exists(player)) screenshake_distance(shake_amount,weight);
	var explosion_sound = choose(exp_long1_s,exp_long2_s);
	audio_play_at(explosion_sound,x,y,1,false,1);
	
	for (var i = 0, length = ds_list_size(layout_inst_list); i < length; ++i) {
	    var inst = layout_inst_list[| i];
		with (inst) {
			destroy_part();
			spd = random_range(-5,5) / weight;
			dir = random(360);
			spin = random_range(-10,10) / weight;
		}
	}
	for (var i = 0, length = ds_list_size(component_inst_list); i < length; ++i) {
	    var inst = component_inst_list[| i];
		with (inst) {
			destroy_part();
			spd = random_range(-5,5) / weight;
			dir = random(360);
			spin = random_range(-10,10) / weight;
		}
	}
	destroyed = true;
	instance_destroy();
}