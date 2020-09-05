macro "3_3" {

path = "?" //set path

output_folder = path + "images/"
mask_folder = path + "masks/"
rois_folder = path + "rois/"

title =  getTitle();
parts = split(title, ".");
label = parts[0]

saveAs("PNG", output_folder + label + ".png");

roiManager("Deselect");
roiManager("Combine");
run("Set...", "value=255");
run("Make Inverse");
run("Set...", "value=0");
roiManager("Deselect");
run("Convert to Mask");

roiManager("Save", rois_folder  + label + "_RoiSet.zip");
mask_name = label + "_P" + ".png"
saveAs("PNG", mask_folder + label + "_P" + ".png");

roiManager("Delete");
selectWindow(mask_name);
close();

}