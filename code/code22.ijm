// Code 22
macro "List files in a folder" {
	dir = getDirectory("Choose a Directory ");
	list = getFileList(dir);
	for(i = 0; i < list.length; i++) {
		print(list[i]);
	}
}