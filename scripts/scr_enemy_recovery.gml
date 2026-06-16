sprite_index = recoveryspr;
image_speed = 0.35;

if (floor(image_index) == 21) {
	sprite_index = idlespr;
	state = 73;
	image_index = 0;
}

scr_collideandmoveonlywall();
