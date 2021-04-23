function spawn_followers(follower_array) {
	var follower_number_to_spawn = follower_number - irandom(follower_dev);
	for (var i = 0; i < follower_number_to_spawn; ++i) {
	    var follower = instance_create_depth(
			x+lengthdir_x(follower_range,random(360)),
			y+lengthdir_y(follower_range,random(360)),
			depth, follower_array[i]
		);
		with (follower) {
			leader = other;
			leader_follow_distance = other.follower_range;
			faction = other.faction;
			image_angle = other.image_angle + random_gauss(10,5);
			
			create_ship();
		}
	}
}