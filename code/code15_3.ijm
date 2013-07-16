//Code 15.3
macro "addition with function2" {
	a = 1;
	b = 2;
	print(ReturnAdd(a, b));
}
//Code 15.1
function ReturnAdd(n, m) {
	p = n + m;
	return p;
}