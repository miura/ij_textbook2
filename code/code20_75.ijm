//code 20.75 Array application 
var PlotRange_y_max = -50000;
var PlotRange_y_min = 50000;

macro "get segmented line profile wide" {
	if (selectionType() !=6) exit("selection type must be segmented line ROI");
	getSelectionCoordinates(xCA, yCA);
	width = getNumber("ROI Width?", 9);
	op = "line=" + width;
	run("Line Width...", op);
	totalprofilelength = 0;
	//totaldistance = 0;
	for (i = 0; i < xCA.length-1; i++) {
		makeLine(xCA[i], yCA[i], xCA[i+1], yCA[i+1]);
		tempProfile = getProfile();
		totalprofilelength += tempProfile.length;
		//print(i+"seg:"+tempProfile.length + "total:"+totalprofilelength);
	}
	print(xCA.length-1 + " segments: "+ totalprofilelength);
	print(" ******* ");
	totalprofile=newArray(totalprofilelength);
	totalprofile_counter = 0;
	segment_starts = 0;
	for (i = 0; i < xCA.length-1; i++) {
		makeLine(xCA[i], yCA[i], xCA[i+1], yCA[i+1]);
		tempProfile = getProfile();
		for(j=0;j<tempProfile.length;j++)      {
			totalprofile[segment_starts + j] = tempProfile[j];
			totalprofile_counter++;
		}
		segment_starts= totalprofile_counter;
		//print(i + ":"+ totalprofile_counter);
	}
	K_createThickProfilePlot(totalprofile);
	output_results(totalprofile);
}

//*********Graph Plotting *******

function K_createThickProfilePlot(pA) {
	K_updatePlotRange(pA);
	Plot.create("Intensity profile", "pixels", "intensity");
	Plot.setLimits(0, pA.length, PlotRange_y_min * 0.95, PlotRange_y_max * 1.05);
	Plot.setColor("black");
	Plot.add("line", pA);
	Plot.show();
}

//to set a plot range to fit a curve. global variables are used.
function K_updatePlotRange(referenceA) {
	for (k = 0; k < referenceA.length; k++) {
		if (PlotRange_y_max<referenceA[k])
			PlotRange_y_max = referenceA[k];
		if (PlotRange_y_min>referenceA[k])
			PlotRange_y_min = referenceA[k];
	}
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
