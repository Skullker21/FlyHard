


if gatling_cooldown && (shoot = 1) && global.control = 1
{
	
	{instance_create_layer (x, y, "bullets", bullet_gatling);}
	gatling_cooldown = false;
	alarm[1] = 2
}

x = global.falcon_wep_1_x;
y = global.falcon_wep_1_y;
image_angle = player_falcon.image_angle;