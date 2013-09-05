//Code 10.1
requires("1.42i");
macro "Measure Ave Intensity Stack" {
	frames=nSlices;
	meanA = newArray(frames)
	sdA = newArray(frames)
	for(i=0; i<frames; i++) {
		currentslice=i+1;
		setSlice(currentslice);
		List.setMeasurements;
		meanA[i] = List.getValue("Mean");
		sdA[i] = List.getValue("StdDev");
		
	}
	Array.print(meanA)
	Array.print(sdA)
}