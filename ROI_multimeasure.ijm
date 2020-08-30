macro "two_2" {

output_folder = "path"
label =  getTitle();// getMetadata("Label");

save_name = label;

print(label);
print(save_name);

//parts=split(label, "(.*__)"); 
//parts=split(label, "(.*_XY)"); 
//part_of_parts =  split(parts[1],"(_CH)");
//big_name = part_of_parts[0];
title = getTitle();
roiManager("Deselect");
roiManager("Remove Channel Info");
roiManager("Remove Slice Info");
roiManager("Remove Frame Info");

roiManager("Save", output_folder  + save_name + "_RoiSet.zip");
//roiManager("Multi Measure");
//saveAs("Results", output_folder +save_name   +".csv"); 
roiManager("Multi Measure");
saveAs("Results", output_folder  + save_name + "_.csv");

roiManager("Delete");
selectWindow(title);
close();
selectWindow("Results");
run("Close")
}
