// Generate Lead Point

_x = player_falcon.x - x;
_y = player_falcon.y - y;
_s = player_falcon.speed;
_b = 24;
_d = point_distance(x,y,player_falcon.x,player_falcon.y);

lead_angle = sin(_y - sin(player_falcon.direction) * _d/sqrt((abs((_b/_s)^2) + 1))) / (_d * sqrt(abs(1 - (1/((_b/_s)^2 + 1))))) ;
lead_distance = sqrt(abs(_x^2 + _y^2)) ;

_LX = player_falcon.x + lengthdir_x((1.5 * player_falcon.speed) * (0.5 * sqrt(point_distance(x,y,player_falcon.x,player_falcon.y))), player_falcon.image_angle);
_LY = player_falcon.y + lengthdir_y(player_falcon.speed * sqrt(point_distance(x,y,player_falcon.x,player_falcon.y)), player_falcon.image_angle);






// Plane Handling

turn_range = random_range(2,3)

if distance_to_object(player_falcon) >= 50
{
var desired_dir = point_direction(x, y, _LX,_LY);
var image_desired_dir = point_direction(x, y, _LX,_LY);
}
else
{
var desired_dir = point_direction(x, y, global.FX,global.FY);
var image_desired_dir = point_direction(x, y, global.FX,global.FY);
}

var difference = angle_difference(direction, desired_dir);
var player_turn = (abs(difference) * 0.98);
var player_turn = clamp(player_turn,0.1,turn_range);

var image_difference = angle_difference(image_angle, image_desired_dir);

var image_turn = (abs(image_difference) * 0.98);
var image_turn = clamp(image_turn,0.1,turn_range);

direction -= min(abs(difference), player_turn) * sign(difference);
image_angle -= min(abs(image_difference), image_turn) * sign(image_difference);
clamp(image_angle,direction,direction +- 5);

// Thrust Speed

if speed < 10
{
motion_add(image_angle,0.2);
}
clamp (speed,0,10);


// collisions
var _inst = instance_place(x, y, plane_enemy);
    if (_inst != noone) {
        motion_add(random_range(0,359),0.2)
    }
	
// Enemy Guns
		
if abs(difference) <= 5 && enemy_bullet_cooldown && distance_to_object(player_falcon) <= 750 
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

