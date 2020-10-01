macro "Add monomer label [1]" {
roiManager("add");
count = roiManager("count");
roiManager("select", count-1);
roiManager("rename", "monomer");
}

macro "Add dimer label [2]" {
roiManager("add");
count = roiManager("count");
roiManager("select", count-1);
roiManager("rename", "dimer");
}

macro "Add ignored label [3]" {
roiManager("add");
count = roiManager("count");
roiManager("select", count-1);
roiManager("rename", "ignored");
}

macro "Get labels and boxes in csv [0]" {
Dialog.create("set Path");
Dialog.addString("Title:", "set output folder");
Dialog.show();
path = Dialog.getString();

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