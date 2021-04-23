/// @description Draw the eclipse
shader_set(shader);
xpos = player.x;
ypos = player.y;
zoom = view_control.zoom;
shader_set_uniform_f(time,current_time * space_speed * (1/1000));
shader_set_uniform_f(xpos_,xpos);
shader_set_uniform_f(ypos_,ypos);
shader_set_uniform_f(zoom_,zoom);
var res_array;
res_array[0] = camera_get_view_width(view_camera[0]);//min(sprite_get_width(sprite_index) * 4, sprite_width);
res_array[1] = camera_get_view_height(view_camera[0]);//min(sprite_get_height(sprite_index) * 4, sprite_height);

shader_set_uniform_f_array(resolution, res_array);
var xx = camera_get_view_x(view_camera[0]),
yy = camera_get_view_y(view_camera[0]), 
w = camera_get_view_width(view_camera[0]), h = camera_get_view_height(view_camera[0]);
draw_set_alpha(1);
draw_set_color(c_white);
draw_rectangle(xx, yy, xx + w, yy + h, false);
shader_reset();
