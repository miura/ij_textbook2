//Code 18.5
macro "Calculate Distance 2" {
	Dialog.create("Calculate Distance");
	Dialog.addMessage("Calculates distance between two points");

	Dialog.addNumber("point1 x:", 0);		//number 1
	Dialog.addNumber("point1 y:", 0);		//number 2
	Dialog.addNumber("point2 x:", 2);		//number 3
	Dialog.addNumber("point2 y:", 2);		//number 4
	Dialog.addNumber("Scale [um/pixel]:", 0.1);	//number 5
	Dialog.addCheckbox("scale?", true);		//check 1

	Dialog.show();

	p1x = Dialog.getNumber();	//1
	p1y = Dialog.getNumber();	//2
	p2x = Dialog.getNumber();	//3
	p2y = Dialog.getNumber();	//4
	scale = Dialog.getNumber();	//5
	scaleswitch = Dialog.getCheckbox();

	distance = CalcDistance(p1x, p1y, p2x, p2y);

	if (scaleswitch) distance *= scale;
	
	print("p1:" + p1x + "," + p1y);
	print("p2:" + p2x + "," + p2y);
	if (scaleswitch) {
		print("distance:" + distance + " [um]");
	} else {
		print("distance:" + distance + " [pixels]");
	}			
}