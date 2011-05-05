for (i = 0; i < nResults; i++){
	frame = getResult("Frame", i) + 1;
	ypos = getResult("x", i);
	xpos = getResult("y", i);
	print(frame + ", " + xpos + ", " + ypos);	
}
