outputFolder = "folder/";

// 
// Check if the directory exists, if not, create one
if (!File.exists(outputFolder))
File.makeDirectory(outputFolder);

// Get the current image name, and make the corresponding mask image name
fileName = getTitle();
fileName = substring(fileName,0,lengthOf(fileName)-4);

// Conver the ROIs to the binary mask, save it and close it and the the original image
run("Binary (0-255) mask(s) from Roi(s)", "show_mask(s) save_in=[] suffix=[] save_mask_as=tif rm=[RoiManager[size=42, visible=true]]");
saveAs("Tiff", outputFolder + fileName + "_mask.tif");
close(fileName + "_mask.tif");
close(fileName + ".tif");
// Clear the ROI manager
roiManager("Delete");
