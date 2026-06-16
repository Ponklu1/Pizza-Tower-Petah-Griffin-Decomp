scr_getinput();
movespeed = 0;
hsp = 0;
landAnim = 1;
sprite_index = spr_player_freefall;

if (vsp > 0)
	superslam++;
else
	superslam = 0;

if (superslam > 30)
	state = 22;

if (place_meeting(x, y + 1, obj_collisionparent) && !place_meeting(x, y + 1, obj_destructibles) && !(input_buffer_jump < 8)) {
	state = 56;
	jumpAnim = 1;
	jumpstop = 0;
	
	with (obj_baddie) {
		if (point_in_rectangle(x, y, view_xview[0], view_yview[0], view_xview[0] + view_wview[0], view_yview[0] + view_hview[0])) {
			vsp = -7;
			hsp = 0;
		}
	}
	
	with (obj_camera) {
		shake_mag = 10;
		shake_mag_acc = 30 / room_speed;
	}
	
	combo = 0;
	bounce = 0;
	image_index = 0;
	
	with (instance_create(x, y + 35, obj_bangeffect))
		image_xscale = obj_player.xscale;
	
	if (!place_meeting(x, y, obj_water2))
		instance_create(x, y, obj_landcloud);
	
	freefallstart = 0;
	audio_sound_gain(sfx_land, 0.7, 0);
	
	if (!audio_is_playing(sfx_land))
		audio_play_sound(sfx_land, 1, false);
}

if (place_meeting(x, y + 1, obj_collisionparent) && input_buffer_jump < 8 && vsp > 0) {
	sprite_index = spr_player_hanstandjump;
	stompAnim = 0;
	hsp = 0;
	state = 1;
	jumpAnim = 1;
	jumpstop = 0;
	image_index = 0;
	
	if (!place_meeting(x, y, obj_water2))
		instance_create(x, y, obj_landcloud);
	
	freefallstart = 0;
}

if (key_jump)
	input_buffer_jump = 0;

image_speed = 0.35;
scr_collideandmove();
