//Code 13
macro "Generate Dot Animation back and forth" {

// **** initial values ****
	sizenum=10;	//dot size in pixel
	int=255;	//dot intensity in 8bit grayscale
	frames=50;	//frames in stack
	w=200;		//width of frame 
	h=50;		//height of frame 
	x_position = sizenum;	//starting x position: 
	y_position= (h/2)-(sizenum/2);	//y positon of the oval top-left corner: constant

//**** set colors *****
	setForegroundColor(int, int, int);
	setBackgroundColor(0, 0, 0);

//**** ask speed *****
	speed=getNumber("Speed [pix/frame]?",10)

//**** prepare stack ****
	stackname="dotanimation"+speed;	
	newImage(stackname, "8-bit Black", w, h, frames);

//**** drawing oval in the stack ****
	for(i=0; i<frames; i++) {
		setSlice(i+1);
		x_position += speed;
		if ((x_position > (w-sizenum)) || (x_position < 0) ) { 
			speed*=-1;
			x_position += speed*2;  //avoids penetrating boundary
		}
		makeOval(x_position, y_position, sizenum, sizenum);
		run("Fill", "slice");
	}
	run("Select None");
}
