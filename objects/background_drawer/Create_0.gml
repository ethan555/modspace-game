/// @description Background Struct

background_data = array_create(5, noone);
var i = 0;
background_data[i++] = new bg_struct(0,0,bg_blue_sp,2,2,4,45,c_white,1,false);
//background_data[i++] = new bg_struct(bg_nebula_sp,2,2,2,c_white,1);
background_data[i++] = new bg_struct(0,0,bg_stars_sp,1.5,1.5,1,0,c_white,1,true);
//background_data[i++] = new bg_struct(bg_stars_planets_sp,2.1,2.1,2,c_white,1);
//background_data[i++] = new bg_struct(bg_stars_planets_sp,2.1,2.1,2,c_white,1);
var col = make_color_hsv((179/360)*255,(39/100)*255,255);
background_data[i++] = new bg_struct(0,0,star_sp,2,2,1,0,col,1,false);
