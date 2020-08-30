macro "3_3" {

roiManager("Deselect");
roiManager("Combine");
run("Set...", "value=255");
run("Make Inverse");
run("Set...", "value=0");
roiManager("Deselect");
run("Convert to Mask");

}