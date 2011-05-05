//code 20.5
macro "get profile and printout" {
	if (selectionType() !=5) exit("selection type must be a straight line ROI");
	tempProfile=getProfile();
	output_results(tempProfile);
} 
function output_results(rA) {
	run("Clear Results");
	for(i = 0; i < rA.length; i++) { 
		setResult("n", i, i);
		setResult("intensity", i, rA[i]);
	}
	updateResults();
}