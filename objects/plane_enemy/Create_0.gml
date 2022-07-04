// Lead Accuracy, 1=perfect 0=none
_LA = random_range(0.4,0.7);

control = 1;
selected = false;
motion_add(image_angle,5);
bounce = true;
enemy_bullet_cooldown = true;
instance_health = 100;
friction = 0.05;

// Emit Particles
emit = true;

image_speed = 1;
image_index = -1;