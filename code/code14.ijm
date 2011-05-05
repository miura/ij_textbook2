//Code 14
macro "Automatic Threshold Adjustment" {
	if (nSlices==1) {
		exit("Active window is not a stack");
	}
	getThreshold(lower, upper);
	if ((lower==-1) && (upper==-1)) {
		exit("Image must be thresholded");
	}
	w=getWidth();
	h=getHeight();	
	frames=nSlices;
	ref_slice=getSliceNumber();	//reference frame
	originalStackID=getImageID();

	run("Clear Results");
	run("Set Measurements...", "area limit redirect=None decimal=0");
	run("Measure");
	ref_area=getResult("Area", 0);	//reference area
	temp_area=0; 
	tol=0.03;	// tolerence for the area difference +-3%

	newImage("bin stack", "8-bit White", w, h, frames);
	binStackID=getImageID();
	for(i=0;i<frames;i++) {		//flipping frames
		selectImage(originalStackID);
		setSlice(i+1);
		run("Copy");
		newImage("stack", "8-bit White", w, h, 1);
		run("Paste");
		while ((ref_area*(1-tol)>temp_area) || (temp_area>ref_area*(1+tol))){		
			setThreshold(lower,upper);
			run("Clear Results");
			run("Measure");
			temp_area=getResult("Area", 0);
			lower--;
		} 
		run("Convert to Mask");
		run("Copy");
		close();
		selectImage(binStackID);				
		setSlice(i+1);
		run("Paste");
	}
}
