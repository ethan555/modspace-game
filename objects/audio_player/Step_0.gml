/// @description Play the listed sounds
var length = ds_list_size(audio_list);
for (var i = length - 2; i >= 0; i -= 2) {
    var sound = audio_play_sound(audio_list[| i], audio_list[| i+1], false);
    audio_sound_pitch(sound, random_range(.85,1.2));
    ds_list_delete(audio_list, i+1);
    ds_list_delete(audio_list, i);
}
