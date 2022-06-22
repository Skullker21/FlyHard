/// @description Manual Controls
var cameraX = camera_get_view_x(global.Camera);
var cameraY = camera_get_view_y(global.Camera);

var targetX = cameraTarget.x - CameraWidth / 2;
var targetY = cameraTarget.y - CameraHeight / 2;

//Clamp
targetX = clamp(targetX, 0, room_width - CameraWidth);
targetY = clamp(targetY, 0, room_height - CameraHeight);

//Smooth Move
cameraX = lerp(cameraX, targetX, CameraSpeed);
cameraY = lerp(cameraY, targetY, CameraSpeed);

//Apply Changes
camera_set_view_pos(global.Camera, cameraX, cameraY);

// Parallax
layer_x("parallax_background_1", cameraX * 0.9);
layer_y("parallax_background_1", cameraY * 0.9);

layer_x("parallax_background_3", cameraX * -3);
layer_y("parallax_background_3", cameraY * -3);


