//Curve fitting example
// see class CurveFitter
// http://rsb.info.nih.gov/ij/developer/api/ij/measure/CurveFitter.html

//creat example data arrays
var xa = [1, 2, 3, 4];
var ya = [3, 3.5, 4, 4.5];

//construct a CurveFitter instance
cf = CurveFitter(xa, ya);

//actual fitting
//fit models: see http://rsb.info.nih.gov/ij/developer/api/constant-values.html#ij.measure.CurveFitter.STRAIGHT_LINE
cf.doFit(0);

//print out fitted parameters.
IJ.log(cf.getParams()[0]+ " : " + cf.getParams()[1]);