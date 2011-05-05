//code 25.5
stacktitle = "TransportOfEndosomalVirus.tif";
str = getInfo("window.contents");
strA = split(str, "\n");
trackA = newArray(strA.length);
frameA = newArray(strA.length);
xA = newArray(strA.length);
yA = newArray(strA.length);
for (i = 0; i < strA.length; i++){
	lineA = split(strA[i], "\t");
	trackA[i] = lineA[1];
	frameA[i] = lineA[2];
	xA[i] = lineA[3];
	yA[i] = lineA[4];
}
diam = 9;
offset = floor(diam/2);
intA = newArray(xA.length);
for (i = 1; i< xA.length; i++){
	selectWindow(stacktitle);
	setSlice(frameA[i]);
	makeOval(xA[i]-offset, yA[i]-offset, diam, diam);
	getRawStatistics(nPixels, mean, min, max, std);
	intA[i] = mean;
	print(xA[i] + " , " + yA[i] + ":  mean int="+ intA[i]);
	setResult("track num", i-1, trackA[i]);		
	setResult("Slicenum", i-1, frameA[i]);
	setResult("X", i-1, xA[i]);	
	setResult("Y", i-1, yA[i]);					
	setResult("RoiInt", i-1, intA[i]);
}