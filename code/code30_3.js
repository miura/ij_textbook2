imp = IJ.openImage("http://imagej.nih.gov/ij/images/blobs.gif");
imp.show();
ip = imp.getProcessor();
imp2 = new ImagePlus("SecondWindow with same IP", ip);
imp2.show();