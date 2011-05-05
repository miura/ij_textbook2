//code 25
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
// checking
for (i = 0; i < trackA.length; i++)
	print(xA[i] + ", " + yA[i]);
