treasureCutscene = [
	[cutscene_play_sound, sndbgMusic, 1, 1],
	
	// TODO: Roll up character movement into one script
	// Rely on the object to know what to do when walking in a specific direction
	// Rely on the script to manage the actual movement
	// objSara.walk_right()
	[cutscene_set_object_variable, objSara, "sprite_index", sprSaraWalkRight],
	[cutscene_set_object_variable, objSara, "image_speed", 1],
	// The script
	[cutscene_move_character, objSara, 3 * 32, 0, true, 1],
	// objSara.face_right()
	[cutscene_set_object_variable, objSara, "image_index", 0],
	[cutscene_set_object_variable, objSara, "image_speed", 0],
	
	
	[cutscene_set_object_variable, objBaldric, "sprite_index", sprBaldricSurprise],
	
	// cutscene_create_textbox_anchored(text, obj, xOffset, yOffset)
	[cutscene_create_textbox_anchored, "What are you doing in my house?", objSara, 0, -75],
	
	// objSara.walk_down()
	[cutscene_set_object_variable, objSara, "sprite_index", sprSaraWalkRight],
	[cutscene_set_object_variable, objSara, "image_speed", 1],
	[cutscene_move_character, objSara, 0, 2 * 32, true, 1],
	// objSara.face_down()
	[cutscene_set_object_variable, objSara, "image_index", 0],
	[cutscene_set_object_variable, objSara, "image_speed", 0],
	
	// TODO: Switch from relative movement to moving to stage spikes
];