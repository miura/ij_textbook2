//Code 15.2
macro "addition with function1" {
	a = 1;
	b = 2;
	c = ReturnAdd(a, b);
	print(c);
}
//Code 15.1
function ReturnAdd(n, m) {
	p = n + m;
	return p;
}