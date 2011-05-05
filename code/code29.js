imp = IJ.openImage("http://imagej.nih.gov/ij/images/blobs.gif");
imp.setRoi(0, 0, 149, 116);                              
IJ.run(imp, "Flip Horizontally", "");
IJ.run(imp, "Gaussian Blur...", "sigma=2");
imp.show();