//Code 18
macro "Calculate Distance" {
	p1x = getNumber("point 1 x coordinate", 0);
	p1y = getNumber("point 1 y coordinate",0);
	p2x = getNumber("point 2 x coordinate",2);
	p2y = getNumber("point 2 y coordinate",2);

	sum_difference_squared = pow((p2x - p1x),2) + pow((p2y - p1y),2);
	distance = pow(sum_difference_squared, 0.5);

	print("p1:", p1x, ",", p1y);
	print("p2:", p2x, ",", p2y);
	print("distance:" + distance);
}
