//Code 9
macro "loop1" {
	message_txt = getString("message to loop?", "whatever");
	for(i=0; i<5; i+=1) {
		print(i + ": " + message_txt);
	}
} 






