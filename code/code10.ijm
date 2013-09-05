//Code 10
macro "Measure Ave Intensity Stack" {
	frames=nSlices;
	run("Set Measurements...", "  mean  min integrated redirect=None decimal=4");
	run("Clear Results");
	for(i=0; i<frames; i++) {
		currentslice=i+1;
		setSlice(currentslice);
		run("Measure");
	}
}







