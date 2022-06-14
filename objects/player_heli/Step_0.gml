// Heli Direction & Turn Speed

global.desired_dir_heli = point_direction(x, y, mouse_x, mouse_y);
global.difference_heli = angle_difference(image_angle, global.desired_dir_heli);
image_angle -= min(abs(global.difference_heli), 1.5) * sign(global.difference_heli);


// Weapon Controls
// space = 32, ctrl = 162
var shoot_heli_gat = mouse_check_button(mb_left);
var shoot_heli_mis = mouse_check_button(mb_right);

// Weapon Parameters

if (shoot_heli_gat == 1) && heli_bullet_cooldown && min(abs(global.difference_heli)) < 90
{
	{instance_create_layer (x, y,"bullets", bullet_heli);}
	heli_bullet_cooldown = false;
	alarm[0] = 5
}

if (shoot_heli_mis == 1) && heli_missile_cooldown
{
	{instance_create_layer (x, y,"bullets", missile_heli);}
	heli_missile_cooldown = false;
	alarm[1] = 30
}


// Flight Controls
// w = 87, s = 83, d = 68, a = 68, shift = 16
var fly_north = keyboard_check(87);
var fly_south = keyboard_check(83);
var fly_east = keyboard_check(68);
var fly_west = keyboard_check(65);
var boost = keyboard_check(16);

// Thrust Speed
if (fly_north == 1) { vspeed -= 0.05; }
if (fly_south == 1) { vspeed += 0.05; }
if (fly_east == 1) { hspeed += 0.05; }
if (fly_west == 1) { hspeed -= 0.05; }

// Max Speed
if (boost == 1) && (boost_meter_heli > 0) speed = clamp(speed, 0, 8)
	else {speed = clamp(speed, 0, 4)}

friction = 0.01;


// Boost

if (fly_north == 1) && (boost == 1) && (boost_meter_heli > 0) { vspeed -= 0.1; }
if (fly_south == 1) && (boost == 1) && (boost_meter_heli > 0) { vspeed += 0.1; }
if (fly_east == 1) && (boost == 1) && (boost_meter_heli> 0) { hspeed += 0.1; }
if (fly_west == 1) && (boost == 1) && (boost_meter_heli > 0) { hspeed -= 0.1; }

if boost == 1 && boost_meter_heli > 0 {
	boost_meter_heli = boost_meter_heli - boost_decay_heli
}