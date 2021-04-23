function explode_mine(){
	// Destroy the ship
	var w = (bbox_right - bbox_left)/2, h = (bbox_bottom - bbox_top)/2;
	part_emitter_region(part_system,part_emitter,bbox_left-w,bbox_right+w,bbox_top-h,bbox_bottom+h,ps_shape_ellipse,ps_distr_gaussian);
	repeat(clamp(weight, 3, 10)) {
		part_emitter_burst(part_system,part_emitter,choose_explosion(),1);
	}
	var shake_amount = min(2*weight/5, 5);
	if (instance_exists(player)) screenshake_distance(shake_amount,weight);
	
	// Run mine script
	script_execute(mine_script);
	instance_destroy();
}