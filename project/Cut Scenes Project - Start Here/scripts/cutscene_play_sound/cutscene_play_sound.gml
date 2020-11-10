function cutscene_play_sound(soundid, priority, loops){
	audio_play_sound(soundid, priority, loops);
	cutscene_end_action();	
}