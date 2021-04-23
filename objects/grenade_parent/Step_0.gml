/// @description Slow down

spd = approach(spd, 0, FRICTION);
pspd = approach(pspd, 0, FRICTION);

var xspd = lengthdir_x(spd,dir) + lengthdir_x(pspd,pdir), yspd = lengthdir_y(spd,dir) + lengthdir_y(pspd,pdir);

x += xspd;
y += yspd;

if (find_solid_near(x,y,explode_distance) != noone) {
	lifespan = 0;
}

// Inherit the parent event
event_inherited();

