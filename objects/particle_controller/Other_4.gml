part_system_automatic_update(global._part_system, true);
part_system_automatic_draw(global._part_system, true);

_fps = game_get_speed(gamespeed_fps);

/* PLAYER Flames */
global.exhaust0 = part_type_create();
part_type_speed(global.exhaust0, 0, 0, 0, 0);
part_type_orientation(global.exhaust0, 0, 0, 0, 0, 0);
part_type_size(global.exhaust0, 1, 1, 0, 0);
part_type_scale(global.exhaust0, .3, .3);
part_type_life(global.exhaust0, .1 * _fps, .3 * _fps);
part_type_blend(global.exhaust0, true);
part_type_color2(global.exhaust0, 17663, 255);
part_type_alpha2(global.exhaust0, 1, 0);
part_type_shape(global.exhaust0, pt_shape_flare);

/* PLAYER Smoke */
global.exhaust1 = part_type_create();
part_type_speed(global.exhaust1, 0, 0, 0, 0);
part_type_orientation(global.exhaust1, 0, 0, 0, 0, 0);
part_type_size(global.exhaust1, 1, 1, 0, 0);
part_type_scale(global.exhaust1, .5, .5);
part_type_life(global.exhaust1, .4 * _fps, .6 * _fps);
part_type_blend(global.exhaust1, false);
part_type_color3(global.exhaust1, 16777215, 8421504, 16777215);
part_type_alpha3(global.exhaust1, 0, 0.02, 0);
part_type_shape(global.exhaust1, pt_shape_smoke);

part_type_step(global.exhaust0, ceil(20/ _fps), global.exhaust1);

//ENEMY PARTICLES

/* ENEMY Flames */
global.exhaust2 = part_type_create();
part_type_speed(global.exhaust2, 0, 0, 0, 0);
part_type_orientation(global.exhaust2, 0, 0, 0, 0, 0);
part_type_size(global.exhaust2, 1, 1, 0, 0);
part_type_scale(global.exhaust2, .25, .25);
part_type_life(global.exhaust2, .1 * _fps, .3 * _fps);
part_type_blend(global.exhaust2, true);
part_type_color2(global.exhaust2, 17663, 255);
part_type_alpha2(global.exhaust2, 1, 0);
part_type_shape(global.exhaust2, pt_shape_flare);

/* ENEMY Smoke */
global.exhaust3 = part_type_create();
part_type_speed(global.exhaust3, 0, 0, 0, 0);
part_type_orientation(global.exhaust3, 0, 0, 0, 0, 0);
part_type_size(global.exhaust3, 1, 1, 0, 0);
part_type_scale(global.exhaust3, .3, .3);
part_type_life(global.exhaust3, .4 * _fps, .6 * _fps);
part_type_blend(global.exhaust3, false);
part_type_color3(global.exhaust3, 16777215, 8421504, 16777215);
part_type_alpha3(global.exhaust3, 0, 0.02, 0);
part_type_shape(global.exhaust3, pt_shape_smoke);

part_type_step(global.exhaust2, ceil(20/ _fps), global.exhaust3);