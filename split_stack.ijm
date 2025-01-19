// Specify the input stack file and output folder

run("Fresh Start");

date = "20240515";

//print("\\Clear");

inputStackFile = "./" + date + "/text/" +date+ "_red_T003601.tif";
outputFolder = "/home/tanh3/mercury/" +date+ "/red_T3601/";
//fileNamePre = date+"_red_T3601_";

// create the output folder
File.makeDirectory(outputFolder);

// Open the input stack
open(inputStackFile);

// split the stack
run("Stack to Images");

wait(1000);

// Get the list of frame windows
frameWindows = getList("image.titles");

// Loop through each frame and save as a TIFF file
for (frameIndex = 0; frameIndex < frameWindows.length; frameIndex++) {
    selectWindow(frameWindows[frameIndex]);
    FileName = frameWindows[frameIndex] + ".tif";
    output = outputFolder + FileName;
    saveAs("Tiff", output);
    //print(FileName);
    close(FileName);
}

exit();
