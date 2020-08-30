macro "one_1" {

output_folder = "path"

label =  getTitle();// getMetadata("Label");
split_here = indexOf(label, "MMStack");
save_name = substring(label,0,split_here);

save_name
print(label);

print(save_name);

title = getTitle();
roiManager("Deselect");
roiManager("Remove Channel Info");
roiManager("Remove Slice Info");
roiManager("Remove Frame Info");

log(save_name);
roiManager("Save", output_folder  + save_name + "_RoiSet.zip");

Stack.getDimensions(width, height, channels, slices, frames);
for (i=1; i<channels+1; i++){
Stack.setChannel(i);

slice_label = getMetadata("Label");

roiManager("Multi Plot");
selectWindow("Profiles"); 
Plot.showValues(); 

saveAs("Results", output_folder +save_name +"_Channel" +i  +"_.csv"); 
selectWindow("Profiles");
close();
}


roiManager("Delete");
selectWindow(title);
close();
}
