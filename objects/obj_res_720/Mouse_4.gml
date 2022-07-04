global.CameraWidth = 1280;
global.CameraHeight = 720;
global.CameraScale = 1;
window_set_size(global.CameraWidth * global.CameraScale, global.CameraHeight * global.CameraScale);

surface_resize(application_surface, global.CameraWidth * global.CameraScale, global.CameraHeight * global.CameraScale);
var windowWidth = global.CameraWidth * global.CameraScale;
var windowHeight = global.CameraHeight * global.CameraScale;
window_set_position(display_get_width() / 2 - windowWidth / 2, display_get_height() / 2 - windowHeight / 2);