//code27
path = getDirectory("image");
filename = getTitle();
txtfile = "Traj_" + substring(filename, 0, lengthOf(filename)-4) + ".txt";
fullpath = path+txtfile;
print(fullpath);

if (!File.exists(fullpath)) 
	exit("data file not found");

str = File.openAsString(fullpath);
print(str);





