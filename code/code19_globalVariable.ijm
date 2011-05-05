//Code 19 ************* Global variable ************
var G_scale=0.2;

macro "convert pixel to um" {
	length_pix = getNumber("Length? [pixel]", 10);
	print(length_pix+" [pixel] --> " + Conv_pix2um(length_pix) + " [um]");
}

function Conv_pix2um(in_pix){
	in_um = in_pix * G_scale;
	return in_um;
}

macro "Change Scale" {
	new_scale = getNumber("Length? [pixel]", G_scale);
	G_scale = new_scale;
	print("scale chaged to " + G_scale + " [um/pixel]");
}