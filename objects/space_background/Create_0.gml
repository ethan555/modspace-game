/// @description Initialize Space


depth = BACKGROUND_DEPTH;
shader = space_sh;
time = shader_get_uniform(shader,"time");
resolution = shader_get_uniform(shader,"resolution");
xpos_ = shader_get_uniform(shader,"xpos");
ypos_ = shader_get_uniform(shader,"ypos");
zoom_ = shader_get_uniform(shader,"zoom");
