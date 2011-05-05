stacktitle = "TransportOfEndosomalVirus.tif";
diam = 9;
offset = floor(diam/2);

for (i = 0; i < nResults; i++){
	frame = getResult("Frame", i) + 1;
	ypos = getResult("x", i);
	xpos = getResult("y", i);
	print(frame + ", " + xpos + ", " + ypos);
	selectWindow(stacktitle);
	setSlice(frame);
	makeOval(xpos-offset, ypos-offset, diam, diam);
	getRawStatistics(nPixels, mean, min, max, std);
	setResult("RoiInt", i, mean);

}
