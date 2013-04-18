//Code 7.1
/*  
This macro creates binary image with randomly positioned dots.  
*/
macro "GB2_Thr" {
	//creates a new image window
	newImage("test", "8-bit Black", 300, 300, 1);
	//add noise
	run("Salt and Pepper");
	//blur the image
	run("Gaussian Blur...", "radius=2");
	//binarize the image
	setThreshold(32, 100);
	run("Convert to Mask");
}




