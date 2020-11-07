/// @description Insert description here
if(playerCanMove) {
	if(keyboard_check(ord("D")) && place_free(x + collisionSpeed, y)) { //Move to the right
		x += walkSpeed; //Physically moves the object the amount of walkSpeed to the right
		image_speed = walkSpeed / 3; //Moves through the frames of the playing sprite
		sprite_index = sprBaldricWalkRight; //Assigns the walking right sprite when D is pressed
	}
	if(keyboard_check(ord("A")) && place_free(x - collisionSpeed, y)) { //Move to the left
		x -= walkSpeed;
		image_speed = walkSpeed / 3;
		sprite_index = sprBaldricWalkLeft;
	}
	if(keyboard_check(ord("W")) && place_free(x, y - collisionSpeed)) { //Move Up
		y -= walkSpeed;
		image_speed = walkSpeed / 3;
		sprite_index = sprBaldricWalkUp;
	}
	if(keyboard_check(ord("S")) and place_free(x, y + collisionSpeed)) { //Move Down
		y += walkSpeed;
		image_speed = walkSpeed / 3;
		sprite_index = sprBaldricWalkDown;
	}
	if(keyboard_check(vk_nokey)) { //Stop animating
		image_speed = 0; //Set speed of playing frames to 0
		image_index = 0; //Set current frame to 0
		walkSpeed = 3.5; //Return speed to normal
	}
}

if (place_meeting(x + 5, y, objTreasureChest)) {
	if (keyboard_check_pressed(vk_space) && !instance_exists(objCutSceneParent)) {
		instance_create_layer(x, y, "objects", objCutSceneTreasureChest);
		image_index = 0;
		image_speed = 0;
	}
}