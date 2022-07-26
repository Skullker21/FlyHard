thrust = 50;
friction = 0.2;
health = 100;
shield = 50;
image_speed = 0;
global.control = 1;
motion_add(image_angle,10);
// Boost Cooldown
boost_meter = 1;
boost_decay = 0.01;

// Ability Cooldown
spinright_cooldown = true;
spinleft_cooldown = true;






default_cooldown = true;








// Right Weapon Cooldown 
right_missile_cooldown = true;
right_gatling_cooldown = true;

// Emit Particles
emit = true;

// Create Weapon Slots
global.falcon_wep_1_x = x + lengthdir_x(10, image_angle + 90)
global.falcon_wep_1_y = y + lengthdir_y(10, image_angle + 90)