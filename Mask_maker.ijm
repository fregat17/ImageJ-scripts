macro "3_3" {

path = "C:/FASTAI/MPP8/new_processed_train_data/" //set path

output_folder = path + "images/"
mask_folder = path + "masks/"
rois_folder = path + "rois/"

title =  getTitle();
parts = split(title, ".");
label = parts[0]
setMinAndMax(0, 255);
run("8-bit");
saveAs("PNG", output_folder + label + ".png");

roiManager("Deselect");
roiManager("Combine");
run("Set...", "value=1");
run("Make Inverse");
run("Set...", "value=0");
roiManager("Deselect");
setMinAndMax(0, 255);
run("Grays");

roiManager("Save", rois_folder  + label + "_RoiSet.zip");
mask_name = label + "_P" + ".png"
saveAs("PNG", mask_folder + mask_name);

roiManager("Delete");
selectWindow(mask_name);
close();

}