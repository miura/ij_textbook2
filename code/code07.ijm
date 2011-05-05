//Code 7
macro "GB2_Thr" {
	newImage("test", "8-bit Black", 300, 300, 1);
	run("Salt and Pepper");
	run("Gaussian Blur...", "radius=2");
	setThreshold(32, 100);
	run("Convert to Mask");
}




