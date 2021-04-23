/// @description Init player

warp_direction = point_direction(room_width/2,room_height/2,x,y);

if (instance_exists(player)) {
if (player.room_from == room_to) {
	with (player) {
		warp_room = noone;
		room_from = noone;
		dir = image_angle;
		spd = WARP_SPEED;
		x = other.x + lengthdir_x(spd,dir);
		y = other.y + lengthdir_y(spd,dir);
		xspd = lengthdir_x(spd,dir);
		yspd = lengthdir_y(spd,dir);
	}
}
}