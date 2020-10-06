macro "Get labels and boxes in csv" {
path = "PATH"

title =  getTitle();
parts = split(title, ".");
label = parts[0]

setOption("ScaleConversions", true);
run("8-bit");

saveAs("PNG", path + label + ".png");
roiManager("List");
saveAs("Results", path + label + "_boxes" + ".csv");
roiManager("Delete");
selectWindow(label + ".png");
run("Close");
selectWindow(label + "_boxes" + ".csv");
run("Close");
}