window_set_fullscreen(1);
/// @description Camera
//global.CameraWidth = 1920;
//global.CameraHeight = 1080;
//global.CameraScale = 1;
//global.CameraSpeed = 0.2;
cameraTarget = player_falcon;
//global.Camera = camera_create();
global.Camera = camera_create_view(0, 0, global.CameraWidth, global.CameraHeight);
//global.Camera = camera_create_view(0, 0, CameraWidth, CameraHeight, 0, objPlayer, 4, 4, CameraWidth, CameraHeight);

//camera_set_view_border(global.Camera, CameraWidth, CameraHeight);
//camera_set_view_target(global.Camera, objPlayer);
//camera_set_view_speed(global.Camera, 4, 4);

view_enabled = true;
view_visible[0] = true;
view_set_camera(0, global.Camera);

//Viewport
window_set_size(global.CameraWidth * global.CameraScale, global.CameraHeight * global.CameraScale);
surface_resize(application_surface, global.CameraWidth * global.CameraScale, global.CameraHeight * global.CameraScale);
var windowWidth = global.CameraWidth * global.CameraScale;
var windowHeight = global.CameraHeight * global.CameraScale;
window_set_position(display_get_width() / 2 - windowWidth / 2, display_get_height() / 2 - windowHeight / 2);


