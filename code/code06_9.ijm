//Code 6.9
	newImage("test", "8-bit Black", 300, 300, 1);
	run("Salt and Pepper");
	run("Gaussian Blur...", "radius=2");
	setThreshold(32, 100);
	run("Convert to Mask");