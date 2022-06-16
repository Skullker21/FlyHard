global._part_system = part_system_create();

part_system_automatic_update(global._part_system, true);
part_system_automatic_draw(global._part_system, true);
var _fps = game_get_speed(gamespeed_fps);

/* Flames */
global._part_type_0 = part_type_create();
part_type_speed(global._part_type_0, 0, 0, 0, 0);
part_type_direction(global._part_type_0, 0, 0, 0, 0);
part_type_gravity(global._part_type_0, 0.20, 90);
part_type_orientation(global._part_type_0, 0, 0, 0, 0, 0);
part_type_size(global._part_type_0, 1, 1, 0, 0);
part_type_scale(global._part_type_0, 1.50, 1.50);
part_type_life(global._part_type_0, 1 * _fps, 1.50 * _fps);
part_type_blend(global._part_type_0, true);
part_type_color2(global._part_type_0, 17663, 255);
part_type_alpha2(global._part_type_0, 1, 0);
part_type_shape(global._part_type_0, pt_shape_flare);
/* Smoke */
global._part_type_1 = part_type_create();
part_type_speed(global._part_type_1, 0, 0, 0, 0);
part_type_direction(global._part_type_1, 0, 0, 0, 0);
part_type_gravity(global._part_type_1, 0.20, 90);
part_type_orientation(global._part_type_1, 0, 0, 0, 0, 0);
part_type_size(global._part_type_1, 1, 1, 0, 0);
part_type_scale(global._part_type_1, 1, 1);
part_type_life(global._part_type_1, 2 * _fps, 2 * _fps);
part_type_blend(global._part_type_1, false);
part_type_color3(global._part_type_1, 16777215, 8421504, 16777215);
part_type_alpha3(global._part_type_1, 0, 0.02, 0);
part_type_shape(global._part_type_1, pt_shape_smoke);

part_type_step(global._part_type_0, ceil(20/ _fps), global._part_type_1);

/* Fire Source */
global._part_emitter_0 = part_emitter_create(global._part_system);
part_emitter_region(global._part_system, global._part_emitter_0, 320, 448, 704, 832, ps_shape_ellipse, ps_distr_gaussian);
var _odds = 50;
if (_odds < _fps) {
    var _rate =  -1 / (_odds / _fps);
} else {
    var _rate = _odds / _fps;
}
part_emitter_stream(global._part_system, global._part_emitter_0, global._part_type_0, _rate);
