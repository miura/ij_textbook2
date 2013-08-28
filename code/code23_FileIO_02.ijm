// Code 23

var G_Sdir = "D:\\_Kota\\CMCI\\";
var G_Ddir = "D:\\_Kota\\CMCI\\";
var G_threshold_lower = 20;
var G_threshold_upper = 255;


macro "Set Directory to save Results" {
	G_Ddir = getDirectory("Choose Destination Directory");
	print(G_Ddir);
}

macro "set the threshold lower level" {
	getThreshold(lower, upper);
	if ((lower == -1) && (upper == -1)) {
		exit("Image must be thresholded");
	}
	G_threshold_lower = lower;
}

macro "Multiple measurement" {
	G_Sdir = getDirectory("Choose the Directory where the file is");
	list = getFileList(G_Sdir);
	for(i = 0; i<list.length; i++) {
		NucAnalysis(list[i]);
	}	
}

function NucAnalysis(img_filename) {
	fullpath_image = G_Sdir + img_filename;
	open(fullpath_image);
	sourceID = getImageID();		
	setThreshold(G_threshold_lower, G_threshold_upper);
	img_title = getTitle();

	run("Set Measurements...", "area mean centroid circularity slice limit redirect=None decimal=2");
	run("Analyze Particles...", "size=10-Infinity circularity=0.50-1.00 show=Outlines display exclude clear stack");
	selectImage(sourceID);
	close();
	
	dest_outlinename = img_title + "_outline.tif";
	fullpath = G_Ddir + dest_outlinename;
	saveAs("tiff", fullpath);
	close();

	dest_filename = img_title+"_measure.xls";
	fullpath = G_Ddir + dest_filename;
	print(fullpath );
	saveAs("Measurements", fullpath);
}
