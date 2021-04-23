/// @description Init gun damage type

// Inherit the parent event
event_inherited();

gun_type = new damage_struct(gun_damage,gun_armor,gun_shields,gun_fire,gun_electric,gun_force,gun_scrap);
audio_emitter = audio_emitter_create();
audio_emitter_falloff(audio_emitter, AUDIO_FALLOFF_REF_DISTANCE, AUDIO_FALLOFF_DISTANCE, 1);
audio_emitter_position(audio_emitter, x, y, 0);