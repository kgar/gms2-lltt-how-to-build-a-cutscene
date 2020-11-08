switch(currentStep) {
	case 8:
		draw_sprite_ext(sprSaraWizardChanting, 0, objSara.x, objSara.y, 1, 1, 0, c_white, counter/100);
		objSara.image_alpha = 1 / (counter + 1);
		break;
	case 10:
		draw_text(objBaldric.x - 75, objBaldric.y - 55, "Press A to dodge!"); 
		break;
}