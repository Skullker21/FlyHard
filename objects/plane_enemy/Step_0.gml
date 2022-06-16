
if distance_to_object(Plane_Player) > 75
	{var desired_dir = point_direction(x, y, Plane_Player.x, Plane_Player.y);
}
else
	{var desired_dir = point_direction(x,y, global.FX, global.FY);
	
}




var difference = angle_difference(direction, desired_dir);
direction -= min(abs(difference), 2) * sign(difference);


if bounce
{
	{speed = 12}
	bounce = false;
	alarm[0] = 30
}

image_angle = direction;

// collisions
var _inst = instance_place(x, y, plane_enemy);
    if (_inst != noone) {
        var _diff_x = x - _inst.x;
        var _diff_y = y - _inst.y;
        speed = speed + (_diff_x / 128);
        direction = direction + (_diff_y / 128);
    }
	
// Enemy Guns
		
if abs(difference) <= 2 && enemy_bullet_cooldown && distance_to_object(Plane_Player) <= 750
	{
	var bullet_inst = instance_create_layer (x, y,"enemy_bullets", bullet_enemy);
	bullet_inst.direction = direction;
	enemy_bullet_cooldown = false;
	alarm[1] = 10
}


// Enemy Health

if instance_health <= 0 {
	instance_destroy();
}


// Create EXHAUST particles

enemy_exhaust_emitter = part_emitter_create(global._part_system);

_fps = game_get_speed(gamespeed_fps);

e_offsetX = x + lengthdir_x(-10, image_angle);
e_offsetY = y + lengthdir_y(-10, image_angle);


part_type_direction(global.exhaust2, image_angle-180, image_angle-180, 0, 0);
part_type_gravity(global.exhaust2, 0.20, image_angle-180);

part_type_direction(global.exhaust3, image_angle-180, image_angle-180, 0, 0);
part_type_gravity(global.exhaust3, 0.20, image_angle-180);

part_emitter_region(global._part_system, enemy_exhaust_emitter, e_offsetX, e_offsetX, e_offsetY, e_offsetY, ps_shape_ellipse, ps_distr_gaussian);


if(emit){

//part_type_scale(global.exhaust0, .3, .3);

part_emitter_burst(global._part_system, enemy_exhaust_emitter, global.exhaust2, 4);
emit = false;
alarm[3] = 1

}