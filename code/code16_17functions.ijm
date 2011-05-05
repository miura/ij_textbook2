//Code 16
function CheckStack() {
	if (nSlices==1) {
		exit("Active window is not a stack");
	}
}

//Code 17
function CheckThreshold() {
	getThreshold(lower, upper);
	if ((lower==-1) && (upper==-1)) {
		exit("Image must be thresholded");
	}
}

