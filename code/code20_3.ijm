//code 20.3
macro "get segmented line profile and get statistics" {
	if (selectionType() !=6) exit("selection type must be segmented line ROI");
	pA = getProfile();
	Array.print(pA);
	Array.getStatistics(pA, min, max, mean, stdDev);
	print("Mean:", mean, " sd:", stdDev);
}