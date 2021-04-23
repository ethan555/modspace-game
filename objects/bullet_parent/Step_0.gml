/// @description Move and collide
event_inherited();

image_alpha = min(1, 2 * lifespan / max_lifespan);

var xspd = lengthdir_x(spd, dir)+lengthdir_x(pspd, pdir), yspd = lengthdir_y(spd, dir)+lengthdir_y(pspd, pdir);

x += xspd;
y += yspd;

var x_collide = x, y_collide = y;
/*var collision_number = collision_line_list(x,y,
	x+xspd,
	y+yspd, 
	solid_parent,false,true,global_collision_list,true);
/**/

var collision_number = instance_place_list(x,y,solid_parent,global_collision_list,true);
damage_collision_line(x_collide, y_collide, collision_number);
ds_list_clear(global_collision_list);
