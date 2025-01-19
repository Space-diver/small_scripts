folder = "folder/"
fileName = "T3601_mask_label_by_corrected_id.tif"

// Roration angle
angle = 65

open(folder+fileName);
selectImage(fileName);
run("Properties...", "channels=1 slices=98 frames=1 pixel_width=1.0000 pixel_height=1.0000 voxel_depth=3.3");
run("TransformJ Rotate", "z-angle=0.0 y-angle=0.0 x-angle="+angle+" interpolation=[Nearest Neighbor] background=0.0 adjust anti-alias");
close(fileName);
run("Z Project...", "projection=[Max Intensity]");
setMinAndMax(0, 1);
