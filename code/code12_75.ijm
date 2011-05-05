//Code 12.75------------------------------

macro "Condition_if_else 3"{
	input_num1 = getNumber("Input a number 1", 5);
	input_num2 = getNumber("Input a number 2", 6);
	message0 = ""+input_num1 + ","+input_num2;	//use this string four times
	if ( (input_num1==5) && (input_num2==6) ) {
		print(message0+ ": The parameter1 is 5 and the parameter2 is 6");
	} else {
		if (input_num1!=5) && (input_num2!=6) {
				print(message0 + ": The parameter1 is not 5 and the parameter2 is not 6");
		} else {
			if (input_num2==6) {
				print(message0 + ": The parameter1 is NOT 5 but the parameter2 is 6");
			} else {
				print(message0 + ": The parameter1 is 5 but the parameter2 is NOT 6");
			}
}