/// @description Countdown to death

if (lifespan > 0) {
	if (image_alpha < 1) {
		// Make visible
		image_alpha += alpha_d;
	}
} else {
	if (image_alpha > 0) {
		image_alpha -= alpha_d;
	} else {
		instance_destroy();
	}
}
