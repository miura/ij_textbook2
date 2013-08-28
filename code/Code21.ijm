// Code 21
var G_Ddir = "D:\\_Kota\\CMCI\\course_macro\\"; //Windows path 
//var G_Ddir = "/Users/Kota/CMCI/course_macro/"; //OSX path 

macro "Set Directory to save Results" {
	G_Ddir = getDirectory("Choose Destination Directory");
	print(G_Ddir);
}

macro "auto save results" {
	getThreshold(lower, upper);
	if ((lower == -1) && (upper == -1)) {
		exit("Image must be thresholded");
	}
	setThreshold(lower, 255);
	img_title = getTitle();
	run("Set Measurements...", "area mean centroid shape circularity slice limit redirect=None decimal=2");
	run("Analyze Particles...", "size=10-Infinity circularity=0.50-1.00 show=Outlines display exclude clear stack");
	dest_filename = img_title+"_measure.xls";
	fullpath = G_Ddir + dest_filename;
	saveAs("Measurements", fullpath);
}
