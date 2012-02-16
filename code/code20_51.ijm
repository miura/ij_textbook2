//exrecise answer
//modofication of code 20_5
macro "get profile and printout" {
	if (selectionType() !=5) exit("selection type must be a straight line ROI");
	tempProfile=getProfile();
	totalint = 0;
	for (i = 0; i < tempProfile.length; i++)
		totalint += tempProfile[i];
	print(totalint);
} 