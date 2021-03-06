//Generated by Geon FX v0.8.4
//Put this code in Create event

//Creating Particle System
global.ps = part_system_create();
part_system_depth(global.ps, -1);

//Creating Particle Types
//flame
global.pt_flame = part_type_create();
part_type_shape(global.pt_flame, pt_shape_smoke);
part_type_sprite(global.pt_flame, spr_pt_shape_smoke, 0, 0, 0);
part_type_size(global.pt_flame, 0.50, 1.50, -0.01, 0);
part_type_scale(global.pt_flame, 1, 1);
part_type_orientation(global.pt_flame, 0, 359, 1, 20, 0);
part_type_colour3(global.pt_flame, 9825000, 775671, 874464);
part_type_alpha3(global.pt_flame, 0.20, 1, 0);
part_type_blend(global.pt_flame, 1);
part_type_life(global.pt_flame, 30, 50);
part_type_speed(global.pt_flame, 5, 5, 0, 0);
part_type_direction(global.pt_flame, 90, 90, 0, 20);
part_type_gravity(global.pt_flame, 0, 0);

//fireplace
global.pt_fireplace = part_type_create();
part_type_shape(global.pt_fireplace, pt_shape_sphere);
part_type_sprite(global.pt_fireplace, spr_pt_shape_sphere, 0, 0, 0);
part_type_size(global.pt_fireplace, 1, 4, 0, 0);
part_type_scale(global.pt_fireplace, 1, 1);
part_type_orientation(global.pt_fireplace, 0, 0, 0, 0, 0);
part_type_colour3(global.pt_fireplace, 2024171, 900600, 10806506);
part_type_alpha3(global.pt_fireplace, 0, 0.50, 0);
part_type_blend(global.pt_fireplace, 1);
part_type_life(global.pt_fireplace, 10, 50);
part_type_speed(global.pt_fireplace, 0, 0, 0, 0);
part_type_direction(global.pt_fireplace, 0, 359, 0, 0);
part_type_gravity(global.pt_fireplace, 0, 0);

//spark
global.pt_spark = part_type_create();
part_type_shape(global.pt_spark, pt_shape_pixel);
part_type_sprite(global.pt_spark, spr_pt_shape_pixel, 0, 0, 0);
part_type_size(global.pt_spark, 1, 1, 0, 0);
part_type_scale(global.pt_spark, 1, 1);
part_type_orientation(global.pt_spark, 0, 0, 0, 0, 0);
part_type_colour3(global.pt_spark, 65535, 763386, 255);
part_type_alpha3(global.pt_spark, 1, 1, 0);
part_type_blend(global.pt_spark, 1);
part_type_life(global.pt_spark, 40, 100);
part_type_speed(global.pt_spark, 1, 2, 0, 0);
part_type_direction(global.pt_spark, 70, 110, 0, 20);
part_type_gravity(global.pt_spark, 0.10, 90);

//smoke
global.pt_smoke = part_type_create();
part_type_shape(global.pt_smoke, pt_shape_explosion);
part_type_sprite(global.pt_smoke, spr_pt_shape_explosion, 0, 0, 0);
part_type_size(global.pt_smoke, 1, 2, 0.02, 0);
part_type_scale(global.pt_smoke, 1, 1);
part_type_orientation(global.pt_smoke, 0, 359, 2, 0, 0);
part_type_colour3(global.pt_smoke, 14079702, 14408667, 14408667);
part_type_alpha3(global.pt_smoke, 0, 0.15, 0);
part_type_blend(global.pt_smoke, 0);
part_type_life(global.pt_smoke, 20, 60);
part_type_speed(global.pt_smoke, 5, 5, 0, 0);
part_type_direction(global.pt_smoke, 90, 90, 0, 0);
part_type_gravity(global.pt_smoke, 0, 0);

//Creating Emitters
global.pe_flame = part_emitter_create(global.ps);
global.pe_fireplace = part_emitter_create(global.ps);
global.pe_spark = part_emitter_create(global.ps);
global.pe_smoke = part_emitter_create(global.ps);

