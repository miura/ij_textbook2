//Code 14.5
macro "Exercise23441: Automatic Threshold Adjustment" {
	CheckStack();
	CheckThreshold();
	getThreshold(lower, upper);

 	w=getWidth();
	h=getHeight();
	frames=nSlices;
	ref_slice=getSliceNumber(); 
	originalStackID=getImageID();
	run("Clear Results");
	resetThreshold();	
	run("Set Measurements...", "integrated redirect=None decimal=0");
	run("Select All");	
	run("Measure");
	ref_int=getResult("IntDen",0); 
	newImage("bin stack", "8-bit White", w, h, frames);
	binStackID=getImageID();

 	for(i=0;i<frames;i++) {
	            selectImage(originalStackID);
 		setSlice(i+1);
		run("Copy");
		newImage("stack", "8-bit White", w, h, 1);
		run("Paste");
		run("Clear Results");
		run("Select All");	
		run("Measure");
		temp_int=getResult("IntDen", 0);  
		temp_lower= lower*temp_int/ref_int;
		setThreshold(temp_lower, upper);//added
		run("Convert to Mask");
		run("Copy");
		close();
		selectImage(binStackID);
		setSlice(i+1);
		run("Paste");
    	}
}
