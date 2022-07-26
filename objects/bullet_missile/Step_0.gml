speed += 0.3;
clamp(speed, 0, 20)

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
alarm[6] = 1

}
