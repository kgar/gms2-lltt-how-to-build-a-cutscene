
if (keyboard_check_pressed(vk_escape)) {
	currentState = CutSceneStates.Paused;
	audio_pause_sound(bgMusic);
}

if (keyboard_check_pressed(vk_space) && audio_is_paused(bgMusic)) {
	currentState = CutSceneStates.Active;
	audio_resume_sound(bgMusic);
}

if (currentState == CutSceneStates.Active) {
	switch (currentStep) {
		case 0: // Walk out of bed  
			objSara.sprite_index = sprSaraWalkRight;
			if (objSara.x != 718) {
				++objSara.x;
				objSara.image_speed = 1;
			} 
			else {
				objSara.image_speed = 0;
				objSara.image_index = 0;
				++currentStep;
			}
			
			break;
		case 1: // Create a dialogue box
			if (!instance_exists(objDialogueBox)) {
				dB = instance_create_layer(objSara.x, objSara.y - 75, "objects", objDialogueBox);
				dB.myText = "What are you doing in my house?!";
				objBaldric.sprite_index = sprBaldricSurprise;
			}
			
			if (counter == 120) {
				counter = 0;
				++currentStep;
			}
			else {
				++counter;
			}
			break;
		case 2: // Move Sara down
			instance_destroy(dB);
			if (objSara.y != 590) {
				++objSara.y;
				objSara.image_speed = 1;
				objSara.sprite_index = sprSaraWalkDown;
			}
			else {
				++currentStep;
			}
			break;
		case 3: // Move Sara right
			if (objSara.x != 920) {
				++objSara.x;
				objSara.sprite_index = sprSaraWalkRight;
			}
			else {
				++currentStep;
			}
			break;
		case 4: // Move in front of Baldric
			if (objSara.y != 615) {
				++objSara.y;
				objSara.sprite_index = sprSaraWalkDown;
			}
			else {
				++currentStep;
			}
			break;
		case 5: // Face player and stop walking
			objSara.sprite_index = sprSaraWalkRight;
			objSara.image_speed = 0;
			if (!instance_exists(objDialogueBox)) {
				dB = instance_create_layer(objSara.x, objSara.y - 75, "objects", objDialogueBox);
				dB.myText = "*SLAP*";
				objBaldric.currentHealth -= 1;
				audio_play_sound(sndFaceSlap, 1, 0);
			}
			if (counter == 60) {
				counter = 0;
				++currentStep;
			} 
			else {
				++counter;
			}
			break;
		case 6: // Move up
			instance_destroy(dB);
			if (objSara.y != 590) {
				objSara.sprite_index = sprSaraWalkUp;
				objSara.image_speed = 1;
				--objSara.y;
			}
			else {
				++currentStep;
			}
			break;
		case 7: // Move back to the left
			if (objSara.x != 815) {
				objSara.sprite_index = sprSaraWalkLeft;
				--objSara.x;
			}
			else {
				objSara.image_speed = 0;
				objSara.sprite_index = sprSaraWalkRight;
				objSara.image_index = 0;
				++currentStep;
			}
			break;
		case 8: // Change sprites
			if (counter == 100) {
				objSara.sprite_index = sprSaraWizardChanting;
				objSara.image_alpha = 1;
				objSara.image_speed = .25;
				++currentStep;
				counter = 0;
			}
			else {
				++counter;
			}
			break;
			
		case 9: // Create the attack
			if (!audio_is_playing(sndElectricity)) {
				audio_play_sound(sndElectricity, 1, 1);
			}
			if (!instance_exists(objElectricAttack)) {
				attack = instance_create_layer(objSara.x + 10, objSara.y, "objects", objElectricAttack);
				attack.image_alpha = 0;
			}
			if (counter == 100) {
				counter = 0;
				++currentStep;
			}
			else {
				++counter;
				attack.image_alpha = counter / 100;
			}
			break;
		case 10: // Attacks baldric
			with(attack) {
				objSara.sprite_index = sprSaraWizardCasting;
				move_towards_point(objBaldric.x, objBaldric.y, 1);
				if (collision_circle(x, y, 16, objBaldric, false, true)) {
					instance_destroy();
					audio_stop_sound(sndElectricity);
					++other.currentStep;
				}
			}
			if (keyboard_check_pressed(ord("A"))) {
				audio_stop_sound(sndElectricity);
				currentStep = 15;
			}
			break;
		case 11: // Baldric dies
			objBaldric.sprite_index = sprBaldricFaint;
			objBaldric.currentHealth = 0;
			objBaldric.image_speed = 1;
			if (objBaldric.image_index == 4) {
				objBaldric.image_speed = 0;
				++currentStep;
			}
			break;
		case 12: // Sara moves back to bed
			objSara.sprite_index = sprSaraWalkLeft;
			objSara.image_speed = 1;
			if (objSara.x > 700) {
				--objSara.x;
			} 
			else {
				++currentStep;
			}
			break;
		case 13: // Move up to bed
			objSara.sprite_index = sprSaraWalkUp;
			if (objSara.y > 505) {
				--objSara.y;
			}
			else {
				++currentStep;
			}
			break;
		case 14: // Move back to bed
			objSara.sprite_index = sprSaraWalkLeft;
			if (objSara.x > 660) {
				--objSara.x;
			}
			else {
				objSara.sprite_index = sprSaraWalkDown;
				objSara.image_speed = 0;
				objSara.image_index = 0;
				if (escapedRoom == false) {
					game_restart();
				}
				if (escapedRoom && counter == 60) {
					room_goto(room1);
					objBaldric.image_alpha = 1;
					objBaldric.x = 500;
					objBaldric.y = 500;
					currentStep = 17;
					counter = 0;
				}
				else {
					++counter;
				}
			}
			
			break;
		case 15: 
			instance_destroy(attack);
			if (!instance_exists(objDialogueBox)) {
				dB = instance_create_layer(objBaldric.x, objBaldric.y - 75, "objects", objDialogueBox);
				dB.myText = "Not today! I'm out!";
			}
			if (keyboard_check_pressed(vk_space)) {
				counter = 1;
				escapedRoom = true;
				++currentStep;
			}
			break;
		
		case 16: 
			objBaldric.image_alpha = counter;
			if (counter == 0) {
				instance_destroy(dB);
				currentStep = 12;
			}
			else {
				counter -= .01;
			}
			break;
		case 17:
			if (!instance_exists(objDialogueBox)) {
				dB = instance_create_layer(objBaldric.x, objBaldric.y - 100, "objects", objDialogueBox);
				dB.myText = "Now.. where am I?";
			}
			if (keyboard_check_pressed(vk_space)) {
				instance_destroy();
				instance_destroy(dB);
				playerCanMove = true;
				audio_stop_sound(bgMusic);
			}
			break;
			
		}
		
		
			
}
else if (currentState == CutSceneStates.Paused) {
	
}