var desired_dir = point_direction(x, y, player_heli.x, player_heli.y);
var difference = angle_difference(direction, desired_dir);
direction -= min(abs(difference), 2) * sign(difference);


if bounce
{
	{speed = 7}
	bounce = false;
	alarm[0] = 30
}

image_angle = direction;

// collisions
var _inst = instance_place(x, y, plane_enemy_heli);
    if (_inst != noone) {
        var _diff_x = x - _inst.x;
        var _diff_y = y - _inst.y;
        speed = speed + (_diff_x / 128);
        direction = direction + (_diff_y / 128);
    }
	
// Enemy Guns
		
if abs(difference) <= 2 && enemy_bullet_cooldown && distance_to_object(player_heli) <= 600
	{
	var bullet_inst = instance_create_layer (x, y,"enemy_bullets", bullet_enemy);
	bullet_inst.direction = direction;
	enemy_bullet_cooldown = false;
	alarm[1] = 10
}


if instance_health <= 0
{
	instance_destroy()
}