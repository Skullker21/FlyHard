
var desired_dir = point_direction(x, y, mouse_x, mouse_y);
var difference = angle_difference(direction, desired_dir);
var player_turn = (abs(difference)) * 0.1;
var player_turn = clamp(player_turn,0.1,3);

var image_desired_dir = point_direction(x, y, mouse_x, mouse_y);
var image_difference = angle_difference(image_angle, image_desired_dir);

var image_turn = (abs(image_difference)) * 0.1;

var drift = keyboard_check(162);
if drift == 1 {
	var image_turn = clamp(image_turn,0.1,4);
}
else
{
	var image_turn = clamp(image_turn,0.1,3);
}
	
	
	

direction -= min(abs(difference), player_turn) * sign(difference);
image_angle -= min(abs(image_difference), image_turn) * sign(image_difference);
clamp(image_angle,direction,direction +- 5)




// Weapon Offset v1
left_offset_x = x + dsin( direction) * 13;
left_offset_y = y + dsin( direction + 90) * 13;
var bx = left_offset_x + 10 * dcos( image_angle);
var by = left_offset_y + 10 * dcos( image_angle + 90);
//

// Weapon Offset v2
var LX = x + lengthdir_x(10, image_angle);
var LY = y + lengthdir_y(10, image_angle);
//	

// Follow Point

global.FX = x + lengthdir_x(-500, image_angle);
global.FY = y + lengthdir_y(-500, image_angle);


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


// Thrust Speed
motion_add(image_angle,0.2);
if (thrust_up == 1 && drift != 1) { motion_add(image_angle,0.4); }
if (thrust_down == 1) && speed > 3 { speed -= 0.24; }

// Boost Speed
if (boost == 1) { motion_add(image_angle,0.6); }

// Max Speed
if (boost == 1) speed = clamp(speed, 0, 18)
	else {speed = clamp(speed, 0, 12)}

// Abilites
var spinright = keyboard_check(68);
var spinleft = keyboard_check(65);

if (spinright == 1) && spinright_cooldown 
{
	motion_add(image_angle - 90,30)
	spinright_cooldown = false;
	alarm[3] = 60;
}

if (spinleft == 1) && spinleft_cooldown 
{
	motion_add(image_angle + 90,30)
	spinleft_cooldown = false;
	alarm[4] = 60;
}

// Boost Settings

if boost == 1 {
	boost_meter = boost_meter - boost_decay
}



// Camera settings



// Weapon Parameters

if default_cooldown && (shoot_default == 1)
{
	{instance_create_layer (x, y,"bullets", bullet_default);}
	default_cooldown = false;
	alarm[0] = 5
}

if right_missile_cooldown && (shoot_right == 1)
{
	{instance_create_layer (x, y,"bullets", missile);}
	right_missile_cooldown = false;
	alarm[2] = 60
}

// Left Gatling Parameters

if left_gatling_cooldown && (shoot_left == 1)
{
	
	{instance_create_layer (LX, LY, "bullets", bullet_gatling);}
	left_gatling_cooldown = false;
	alarm[1] = 2
}

// Right Gatling Parameters



// Missile Lock-on


// Speed Indicator

// Stall
if speed <= 1.5
{	draw_set_halign(fa_center)
	draw_text(x,y+50,"STALLED")
}

// Enemy Lead


//Create EXHAUST Particles

exhaust_emitter = part_emitter_create(global._part_system);

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