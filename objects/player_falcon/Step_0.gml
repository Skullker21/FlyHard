// Thrust Controls
// w = 87, s = 83, shift = 16
var thrust_up = keyboard_check(87);
var thrust_down = keyboard_check(83);
var boost = keyboard_check(16);

// Weapon Controls
// space = 32, ctrl = 162
var shoot_default = keyboard_check(32);
var shoot_right = mouse_check_button(mb_right);
var shoot_left = mouse_check_button(mb_left);

// Control

if global.control = 1 {
desired_dir = point_direction(x, y, mouse_x, mouse_y);
}
else
{desired_dir = direction;}

if global.control = 1 {
image_desired_dir = point_direction(x, y, mouse_x, mouse_y);
}
else
{
	image_desired_dir = direction;
}

difference = angle_difference(direction, desired_dir);
player_turn = (abs(difference)) * 0.1;
player_turn = clamp(player_turn,0,3);

image_difference = angle_difference(image_angle, image_desired_dir);

image_turn = (abs(image_difference)) * 0.1;

fast = speed/100;
lift = difference * fast;
lift = clamp(lift,-90,90);
//direction -= (min(abs(difference), player_turn) * sign(difference)) * 0.01;

drift = keyboard_check(162);
if drift == 1 && global.control = 1 {
	image_turn = clamp(image_turn,0,10);
	friction = 0.01;
	image_angle -= (min(abs(image_difference), image_turn) * sign(image_difference)) * 0.8;
	
}
else
{
	image_turn = clamp(image_turn,0,5);
	friction = 0.02;
	image_angle -= (min(abs(image_difference), image_turn) * sign(image_difference)) * 0.95;
	motion_add(image_angle + (-1 * lift), (player_turn * fast));
	motion_add(image_angle,0.5);
}
	
if health <= 0 {
	global.control = 0;
}

// Follow Point

global.FX = x + lengthdir_x(-500, image_angle);
global.FY = y + lengthdir_y(-500, image_angle);

// Thrust Speed
//motion_add(image_angle,0.2);
if (thrust_up == 1 && global.control=1) { motion_add(image_angle,0.4); }
if (thrust_down == 1 && global.control=1) && speed > 3 { speed -= 1; }

// Boost Speed
if (boost == 1 && global.control=1) 
{ 
	motion_add(image_angle + image_difference,0.6); 
	
}

// Max Speed
if (boost == 1 && global.control = 1) speed = clamp(speed, 0, 18)
	else {speed = clamp(speed, 0, 12)}

// Abilites
var spinright = keyboard_check(68);
var spinleft = keyboard_check(65);

if (spinright == 1) && spinright_cooldown && global.control=1
{
	motion_add(image_angle - 90,30)
	spinright_cooldown = false;
	alarm[3] = 60;
}

if (spinleft == 1) && spinleft_cooldown && global.control=1
{
	motion_add(image_angle + 90,30)
	spinleft_cooldown = false;
	alarm[4] = 60;
}

// Shield Settings
clamp(shield,0,50);
if shield < 50 && shield_timer = true
{
	shield = shield + 0.2
}

// Drift Charge Settings
clamp(drift_charge,0,100);

if drift_charge > 0 && drift = true && global.control = 1
{
	drift_charge = drift_charge - ((speed/2000) * abs(angle_difference(direction,image_angle)))
	drift_cooldown = false
	alarm[11] = 120;
}

if drift_charge <= 0 && drift = true && global.control = 1
{
	health = health - ((speed/5000) * abs(angle_difference(direction,image_angle)))
	drift_cooldown = false
	alarm[11] = 120;
	
}

if drift = false && drift_charge < 100 && drift_cooldown
{
	drift_charge = drift_charge + 0.4
}













// Boost Settings

if boost == 1 {
	boost_meter = boost_meter - boost_decay
}



// Camera settings




// Left Offset

global.slot1x = x + lengthdir_x(10, image_angle - 90);
global.slot1y = y + lengthdir_y(10, image_angle - 90);

// Right Offset



// Missile Lock-on


// Speed Indicator

// Stall
if speed <= 2
{	draw_set_halign(fa_center)
	draw_text(x,y+50,"STALLED")
}

// Enemy Lead


//Create EXHAUST Particles

exhaust_emitter = part_emitter_create(global._part_system);

_fps = game_get_speed(gamespeed_fps);

e_offsetX = x + lengthdir_x(-10, image_angle);
e_offsetY = y + lengthdir_y(-10, image_angle);


part_type_direction(global.exhaust0, image_angle-180, image_angle-180, 0, 0);
part_type_gravity(global.exhaust0, 0.20, image_angle-180);

part_type_direction(global.exhaust1, image_angle-180, image_angle-180, 0, 0);
part_type_gravity(global.exhaust1, 0.20, image_angle-180);

part_emitter_region(global._part_system, exhaust_emitter, e_offsetX, e_offsetX, e_offsetY, e_offsetY, ps_shape_ellipse, ps_distr_gaussian);

//Create a burst on the alarm[6] timer with an amount of 2
if(emit && boost==1){

part_emitter_burst(global._part_system, exhaust_emitter, global.exhaust0, 6);
part_type_scale(global.exhaust0, .5, .5);
emit = false;
alarm[6] = 1
	
}
else if(emit){

part_type_scale(global.exhaust0, .3, .3);

part_emitter_burst(global._part_system, exhaust_emitter, global.exhaust0, 3);
emit = false;
alarm[6] = 1

}


// Sound
audio_listener_position(x,y,0);
audio_listener_orientation(0,0,1000,0,0,-500);



// Weapon Slots

global.falcon_wep_1_x = x + lengthdir_x(10, image_angle + 90)
global.falcon_wep_1_y = y + lengthdir_y(10, image_angle + 90)

// Weapon Parameters

if default_cooldown && (shoot_default == 1) && global.control=1
{
	{instance_create_layer (x, y,"bullets", bullet_default);}
	default_cooldown = false;
	audio_play_sound(snd_gun_default,1,false);
	default_rof_time = time_source_create(time_source_game, 0.1, time_source_units_seconds, function()
	{
		default_cooldown = true;
	}, [], 1);
	time_source_start(default_rof_time);
}

if right_missile_cooldown && (shoot_right == 1) && global.control=1
{
	{instance_create_layer (x, y,"bullets", bullet_missile);}
	right_missile_cooldown = false;
	audio_play_sound(snd_gun_missile,1,false);
	right_missile_rof_time = time_source_create(time_source_game, 1, time_source_units_seconds, function()
	{
		right_missile_cooldown = true;
	}, [], 1);
	time_source_start(right_missile_rof_time);
}

if right_gatling_cooldown && (shoot_left = 1) && global.control = 1
{
	{instance_create_layer (x, y, "bullets", bullet_gatling);}
	gatling_cooldown = false;
	audio_play_sound(snd_gun_gatling,1,false);
	right_gatling_rof_time = time_source_create(time_source_game, 0.1, time_source_units_seconds, function()
	{
		right_gatling_cooldown = true;
	}, [], 1);
	time_source_start(right_gatling_rof_time);
}