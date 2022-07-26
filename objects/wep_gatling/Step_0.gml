shoot = mouse_check_button(mb_left);

if gatling_cooldown && (shoot = 1) && global.control = 1
{
	
	{instance_create_layer (x, y, "bullets", bullet_gatling);}
	gatling_cooldown = false;
	//audio_play_sound(snd_gun_gatling,1,false);
	alarm[1] = 2
}



