//code 20.75 Array application 
macro "get segmented line profile wide" {
	if (selectionType() !=6) exit("selection type must be segmented line ROI");
	getSelectionCoordinates(xCA, yCA);
	width = getNumber("ROI Width?", 9);
	op = "line=" + width;
	run("Line Width...", op);
	totalprofile = newArray(0);
	for (i = 0; i < xCA.length-1; i++) {
		makeLine(xCA[i], yCA[i], xCA[i+1], yCA[i+1]);
		thisprofile = getProfile();
		totalprofile = Array.concat(totalprofile, thisprofile);
	}
	K_createThickProfilePlot(totalprofile);
	output_results(totalprofile);
}

//*********Graph Plotting *******

function K_createThickProfilePlot(pA) {
  Array.getStatistics(pA, min, max, mean, sdev);
	Plot.create("Intensity profile", "pixels", "intensity");
	Plot.setLimits(0, pA.length, min * 0.95, max * 1.05);
	Plot.setColor("black");
	Plot.add("line", pA);
	Plot.show();
}

//results output to a table
function output_results(rA) {
	run("Clear Results");
	for(i = 0; i < rA.length; i++) { 
		setResult("n", i, i);
		setResult("intensity", i, rA[i]);
	}
	updateResults();
}
