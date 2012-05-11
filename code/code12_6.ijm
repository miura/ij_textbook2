macro "Condition_if_else 2"{
	input_num = getNumber("Input a number", 5);
	if (input_num == 5) {
		print(input_num+ ": The number is 5 ");
	} else {
		print(input_num+ ": The number is not 5 ");
	}
	print("--------------");
}
