//code 20.4
macro "select minima positions" {
	if (selectionType() !=5) 
		exit("selection type must be segmented line ROI");
	pA = getProfile();
	minsA = Array.findMinima(pA, 40);
	getSelectionCoordinates(xpoints, ypoints);
	resamplex = Array.resample(xpoints, pA.length);
	resampley = Array.resample(ypoints, pA.length);
	minxA = newArray(minsA.length);
	minyA = newArray(minsA.length);	
	for (i = 0; i < minsA.length; i++){
		minxA[i] = resamplex[minsA[i]];
		minyA[i] = resampley[minsA[i]];
	}
	makeSelection("point",minxA,minyA);
}