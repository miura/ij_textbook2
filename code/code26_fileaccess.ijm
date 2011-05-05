path = getDirectory("image");
filename = getTitle();
txtfile = "Traj_" + substring(filename, 0, lengthOf(filename)-4) + ".txt";
fullpath = path+txtfile;
print(fullpath);
run("Particle Tracker", "radius=3 cutoff=3 percentile=0.10000 link=2 displacement=10");
if (!File.exists(fullpath)) exit("data file not found");

str = File.openAsString(fullpath);
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
	selectWindow("TransportOfEndosomalVirus.tif");
	setSlice(frameA[i]);
	makeOval(xA[i]-offset, yA[i]-offset, diam, diam);
	getRawStatistics(nPixels, mean, min, max, std);
	intA[i] = mean;
	print(xA[i] + " , " + yA[i] + ":  mean int="+ intA[i]);
	setResult("track num", i-1, trackA[i]);		
	setResult("Slicenum", i-1, frameA[i]);		
	setResult("RoiInt", i-1, intA[i]);
}




