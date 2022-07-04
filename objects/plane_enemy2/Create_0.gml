// Lead Accuracy, 1.5=perfect 0=none
_LA = random_range(1.2,1.5);

selected = false;
motion_add(image_angle,5);
bounce = true;
enemy_bullet_cooldown = true;
instance_health = 300;
friction = 0.05;

// Emit Particles
emit = true;