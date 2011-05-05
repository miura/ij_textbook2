importPackage(Packages.org.apache.commons.math.stat.descriptive);

//prparation of data
stats = new DescriptiveStatistics();
var exA = [0, 1, 2, 3, 8, 9, 10];
for (i in exA) stats.addValue(exA[i]);

// Compute some statistics
mean = stats.getMean();
std = stats.getStandardDeviation();
npnts = stats.getN();
IJ.log("mean: "+ mean + "\nsd: " + std + "\npnts:" + npnts);