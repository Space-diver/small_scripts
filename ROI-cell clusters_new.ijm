// About creating masks for region of interest:
// First, open the rotated mask stack labeled by ID, do z projection.
// Select all ROIs with ROI manager. Rename the ROIs based on their anatomical positions.
// Save the ROIs overview by taking a screenshot.
// Then save the ROIs from ROI manager -> More -> Save. Select all ROIs before saving.
// Then delete the ROI list.
//Close everything on Fiji before run the following.

// Make sure the directories exist:
nSegments = 6 // The number of segments on each side

date="20230928";
_Folder = "./"+date+"/debug/"; 
maskStackName = date+"_T3601_mask_label_by_corrected_id_rotated_65.png"; //Name of the rotated nuclei ROI z-projection

RotatedMaxImage = _Folder + maskStackName; //Path to the rotated nuclei mask stack
outputFolder = _Folder + "Region masks/"; // Path to the output mask files
ROIFolder = outputFolder + "RoiSet/" //Path to the cell cluster roi files

open(RotatedMaxImage);
convert_ROI("L");
convert_ROI("R");
close();

function convert_ROI(side) { 
for (i=1; i<nSegments+1; i++) {
      // open the ROI
      roiManager("Open", ROIFolder+"A"+i+side+".roi");
      // Conver the ROIs to the binary mask, save it and close it and the the original image
      run("Binary (0-255) mask(s) from Roi(s)", "show_mask(s) save_in=[] suffix=[] save_mask_as=tif rm=[RoiManager[size=42, visible=true]]");
      saveAs("Tiff", outputFolder+date+"_mask_A"+i+side+".tif");
      close();//Close the mask
      // Clear the ROI manager
      roiManager("Delete");
   }
}

