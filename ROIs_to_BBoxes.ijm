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