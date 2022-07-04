/// @description Manual Controls
var cameraX = camera_get_view_x(global.Camera);
var cameraY = camera_get_view_y(global.Camera);

var targetX = cameraTarget.x - global.CameraWidth / 2;
var targetY = cameraTarget.y - global.CameraHeight / 2;

//Clamp
targetX = clamp(targetX, 0, room_width - global.CameraWidth);
targetY = clamp(targetY, 0, room_height - global.CameraHeight);

//Smooth Move
cameraX = lerp(cameraX, targetX, global.CameraSpeed);
cameraY = lerp(cameraY, targetY, global.CameraSpeed);

//Apply Changes
camera_set_view_pos(global.Camera, cameraX, cameraY);

// Parallax
layer_x("parallax_background_1", cameraX * 0.9);
layer_y("parallax_background_1", cameraY * 0.9);

layer_x("parallax_background_3", cameraX * -3);
layer_y("parallax_background_3", cameraY * -3);

layer_x("parallax_background_4", (cameraX - 3000) * 0.84);
layer_y("parallax_background_4", (cameraY - 250) * 0.84);

layer_x("parallax_background_5", cameraX * 0.7);
layer_y("parallax_background_5", cameraY * 0.7);
