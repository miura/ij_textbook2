//code 28
macro "Load Track File to Results (trackwise)"{
 	print("\\Clear");
	run("Clear Results");
	tempstr = File.openAsString("");
	openedFile = File.name();
	print(openedFile);
	openedDirectory = File.directory;
	Load2ResultsV3(openedDirectory, openedFile);
}

function Load2ResultsV3(openpath,openedFile) {
	fullpathname = openpath + openedFile;
	print(fullpathname);
	tempstr = File.openAsString(fullpathname);
	linesA = split(tempstr,"\n");
	trajectoryCount = 1;
	rowcounter = 0;
	for (i = 0; i < linesA.length; i++) {
		tempstr = linesA[i];
		comparestr = "%% Trajectory " + trajectoryCount;
		if (tempstr == comparestr) {
			traj_startline = i;
			do {
				i++;
				paramA = split(linesA[i], " ");
				tempstr2="";
				for (j = 0; j<paramA.length; j++) {
					tempstr2 = tempstr2 + paramA[j] + "\t";
				}
				tempstr = "" + trajectoryCount + "\t" + tempstr2;
				finalstr = CommaEliminator(tempstr);
				linecontentA = split(finalstr, "\t");
				if (linecontentA.length>1) {
					setResult("TrackNo", rowcounter , linecontentA[0]);
					setResult("Frame", rowcounter , linecontentA[1]);
					setResult("x", rowcounter , parseFloat(linecontentA[3]));
					setResult("y", rowcounter , parseFloat(linecontentA[2]));
					rowcounter++;
				}				
			} while (linesA[i]!= "") 
			trajectoryCount++;
		}
	}
	updateResults();
}

function CommaEliminator(strval) {
	while (indexOf(strval, ",")>0) {
			delindex = indexOf(strval, ",");
			returnstr = substring(strval, 0, delindex) + substring(strval, delindex+1, lengthOf(strval));
			strval = returnstr ;
	}	 	
	return strval;
}