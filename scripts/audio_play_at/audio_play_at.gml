function audio_play_at(sound,x_,y_,falloff_factor,loops,priority){
	audio_play_sound_at(sound,x_,y_,0,AUDIO_FALLOFF_REF_DISTANCE,AUDIO_FALLOFF_DISTANCE,falloff_factor,loops,priority);
}