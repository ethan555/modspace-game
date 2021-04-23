/// @description add_sound() Add a sound to play to the audio player
/// @param sound The sound to play.
/// @param priority The priority at which the sound will play.
function add_sound(sound, priority) {
	if (!instance_exists(audio_player)) {return;}
	with (audio_player) {
	    ds_list_add(audio_list, sound, priority);
	}
}
