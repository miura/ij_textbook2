//Code 8
macro "GB2_Thr_userinput" {
	img_w = getNumber("width?", 300);
	img_h = getNumber("height?", 300);
	newImage("test", "8-bit Black", img_w, img_h, 1);
	run("Salt and Pepper");
	run("Gaussian Blur...", "radius=2");
	setThreshold(32, 100);
	run("Convert to Mask");
}





