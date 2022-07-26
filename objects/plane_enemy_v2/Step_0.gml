
// Lead Fire
_LX = player_falcon.x + (_LA * lengthdir_x(player_falcon.speed * sqrt(point_distance(x,y,player_falcon.x,player_falcon.y)), player_falcon.direction));
_LY = player_falcon.y + (_LA * lengthdir_y(player_falcon.speed * sqrt(point_distance(x,y,player_falcon.x,player_falcon.y)), player_falcon.direction));


if distance_to_object(player_falcon) >= 50 && control = 1
{
var desired_dir = point_direction(x, y, _LX, _LY);
var image_desired_dir = point_direction(x, y, _LX, _LY);
}

if distance_to_object(player_falcon) < 50 && control = 1

{
var desired_dir = point_direction(x, y, global.FX,global.FY);
var image_desired_dir = point_direction(x, y, global.FX,global.FY);
}

if control = 0
{
	desired_dir = direction;
	image_desired_dir = direction;
}

// Turn Rate
turn_range = random_range(2,2.2)

var difference = angle_difference(direction, desired_dir);
var player_turn = (abs(difference) * 0.9);
var player_turn = clamp(player_turn,0.1,turn_range);

var image_difference = angle_difference(image_angle, image_desired_dir);

var image_turn = (abs(image_difference) * 0.9);
var image_turn = clamp(image_turn,0.1,turn_range);

fast = speed/100;
lift = difference * fast;
lift = clamp(lift,-90,90);

image_turn = clamp(image_turn,0,3);
image_angle -= (min(abs(image_difference), image_turn) * sign(image_difference)) * 0.98;
	
if speed < 10
{
	motion_add(image_angle,0.3);
}
	
if difference != 0
{
	motion_add(image_angle + (-1 * lift), 2 * (player_turn * fast));
}

speed = clamp(speed,0,10);
	
	
	
	




// collisions
var _inst = instance_place(x, y, plane_enemy);
    if (_inst != noone) {
        motion_add(random_range(0,359),0.2)
    }
	
// Enemy Guns
		
if abs(image_difference) <= 2 && enemy_bullet_cooldown && distance_to_object(player_falcon) <= 750 && control = 1
	{
	var bullet_inst = instance_create_layer (x, y,"enemy_bullets", bullet_enemy);
	bullet_inst.direction = random_range(image_angle - 15,image_angle + 15);
	enemy_bullet_cooldown = false;
	//audio_play_sound_at(snd_gun_enemy,x,y,0,100,1000,1,false,1);
	alarm[1] = 10
}


// Enemy Health

if instance_health <= 0 {
	control = 0;
	instance_create_layer(x,y,"enemy_bullets",explosion_1);
	instance_destroy();
}


// Create EXHAUST particles

enemy_exhaust_emitter = part_emitter_create(global._part_system);

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


if distance_to_object(player_falcon) <= 50
{
	desired_dir = point_direction(x,y,global.FX,global.FY);
	image_desired_dir = point_direction(x, y, global.FX,global.FY);
}