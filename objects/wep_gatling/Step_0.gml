
// assign variables to each wep, if variable equals 1 on plane, create weapon instance


if gatling_cooldown && (shoot = 1) && global.control = 1
{
	
	{instance_create_layer (x, y, "bullets", bullet_gatling);}
	gatling_cooldown = false;
	alarm[1] = 2
}