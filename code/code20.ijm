//Code 20
macro "EMBL array" {
	EMBL = newArray(5);
	EMBL[0] = "Heidelberg";
	EMBL[1] = "Hamburg";
	EMBL[2] = "Hixton";
	EMBL[3] = "Grenoble";
	EMBL[4] = "Monterotondo";
	address = getNumber("which address [0-4]?", 0);	
	if ((0<=address) && (address<4)) {
		print("address"+address+" -> "+EMBL[address]); 
	} else {
		print("That address is somewhere else not EMBL");
	}
}