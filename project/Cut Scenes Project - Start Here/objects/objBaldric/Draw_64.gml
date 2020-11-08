draw_healthbar(930, 10, 1030, 20, currentHealth / maxHealth * 100, c_black, c_red, c_lime, 0, true, true);
draw_text(850, 5, "Health");
draw_text(950, 20, string(currentHealth) + string("/") + string(maxHealth));
