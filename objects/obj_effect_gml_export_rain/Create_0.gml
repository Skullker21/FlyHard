//Generated by Geon FX v0.8.4
//Put this code in Create event

//Creating Particle System
global.ps = part_system_create();
part_system_depth(global.ps, -1);

//Creating Particle Types
//rain
global.pt_rain = part_type_create();
part_type_shape(global.pt_rain, pt_shape_pixel);
part_type_sprite(global.pt_rain, spr_pt_shape_pixel, 0, 0, 0);
part_type_size(global.pt_rain, 1, 1, 0, 0);
part_type_scale(global.pt_rain, 0.30, 8);
part_type_orientation(global.pt_rain, 0, 0, 0, 0, 0);
part_type_colour3(global.pt_rain, 15133336, 15328923, 15702044);
part_type_alpha3(global.pt_rain, 1, 1, 1);
part_type_blend(global.pt_rain, 0);
part_type_life(global.pt_rain, 60, 60);
part_type_speed(global.pt_rain, 0, 0, 0, 0);
part_type_direction(global.pt_rain, 0, 359, 0, 0);
part_type_gravity(global.pt_rain, 0.30, 270);

//splash
global.pt_splash = part_type_create();
part_type_shape(global.pt_splash, pt_shape_pixel);
part_type_sprite(global.pt_splash, spr_pt_shape_pixel, 0, 0, 0);
part_type_size(global.pt_splash, 1, 1, 0, 0);
part_type_scale(global.pt_splash, 1, 1);
part_type_orientation(global.pt_splash, 0, 0, 0, 0, 0);
part_type_colour3(global.pt_splash, 14932305, 14476625, 14673241);
part_type_alpha3(global.pt_splash, 1, 0.70, 0);
part_type_blend(global.pt_splash, 0);
part_type_life(global.pt_splash, 20, 40);
part_type_speed(global.pt_splash, 1, 5, 0, 0);
part_type_direction(global.pt_splash, 45, 135, 0, 0);
part_type_gravity(global.pt_splash, 0.30, 270);

//vapor
global.pt_vapor = part_type_create();
part_type_shape(global.pt_vapor, pt_shape_smoke);
part_type_sprite(global.pt_vapor, spr_pt_shape_smoke, 0, 0, 0);
part_type_size(global.pt_vapor, 1, 3, 0, 0);
part_type_scale(global.pt_vapor, 1, 1);
part_type_orientation(global.pt_vapor, 0, 359, 1, 0, 0);
part_type_colour3(global.pt_vapor, 16777214, 16776958, 16777214);
part_type_alpha3(global.pt_vapor, 0, 0.13, 0);
part_type_blend(global.pt_vapor, 0);
part_type_life(global.pt_vapor, 160, 200);
part_type_speed(global.pt_vapor, 0, 0, 0, 0);
part_type_direction(global.pt_vapor, 0, 359, 0, 0);
part_type_gravity(global.pt_vapor, 0, 0);

//Linking Particle Types together (Death and Step)
part_type_death(global.pt_rain, 7, global.pt_splash);

//Creating Emitters
global.pe_rain = part_emitter_create(global.ps);
global.pe_vapor = part_emitter_create(global.ps);