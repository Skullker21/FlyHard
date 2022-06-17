part_type_destroy(global._part_system);
part_emitter_destroy(global._part_system, global.exhaust0);
part_emitter_destroy(global._part_system, global.exhaust1);
part_emitter_destroy(global._part_system, global.exhaust2);
part_emitter_destroy(global._part_system, global.exhaust3);
part_system_destroy(global._part_system);
game_restart();