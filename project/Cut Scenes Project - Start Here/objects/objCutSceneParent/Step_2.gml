if (keyboard_check_pressed(vk_delete)) {
	showLocation = true;
}

if (showLocation) {
	show_debug_message("Mouse X: " + string(mouse_x));
	show_debug_message("Mouse Y: " + string(mouse_y));
	show_debug_message("Current Step: " + string(currentStep));
}