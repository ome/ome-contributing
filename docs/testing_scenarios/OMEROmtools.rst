############
OMERO.mtools
############




**To test in**: OMERO.mtools

**Purpose of the test** is to check that the OMERO.mtools starts, connects to OMERO server and performs its functionality on Mac and Windows.

Installation
============

#.  Copy the appropriate installer (Mac/Windows) from ``squig:\team\mporter\mtools testing versions``. The Mac installer contains the Matlab Compiler Runtime (MCR) so it will be a very large file.
#.  Execute the installer and follow on-screen prompts, accepting the default locations and settings

    - Windows: The installer will check for the presence of the correct MCR. If not found it will download and install this for you. Please accept the default locations and settings.
    - Mac: The installer will install the MCR. If you know it is already installed then this step can be cancelled. If you are unsure then please allow this process to continue, accepting the default locations and settings.
#.  After the installer has completed, OMERO.mtools will be listed in your Start menu (Win) or Applications folder (Mac).
#.  Launch the application and type in the username, password and server name. It will attempt to log in when you press the button of the tool you wish to run.


BoxIt Feature
=============

#.  Import following images from ``squig:\ome\data_repo\curated\deltavision\michael\mtools`` into a suitable project/dataset (ALL mtools WORKFLOWS REQUIRE FULL PROJECT/DATASET HIERARCHY)::

       090829_HeLa_siCTL_coilin_ATUB01_01_R3D_D3D
       090829_HeLa_siCTL_coilin_ATUB01_02_R3D_D3D
       090829_HeLa_siCTL_coilin_ATUB01_03_R3D_D3D

#.  Ensure the username, password and server address are entered into the text boxes
#.  Click on the `Box It` button to log in to the server and open the tool. In the dialogue that pops up choose the group that contains the images imported in step 1.
#.  The main application window should now be displayed. From the file menu choose `Open Image…` or press ctrl+O/cmd+O
#.  In the drop-down boxes, select the project and dataset used in step 1 and open the first image. An image of DAPI stained nuclei should be visible. The `Next Image` button should be enabled and the `Previous Image` button should be disabled.
#.  Click the `create ROI` button (white box on a red background) and click/drag to select a region around one of the nuclei. The application will now download the z-stack.
#.  If multiple objects were detected a dialogue will appear asking you to choose an object. In this window click on the cell that you intended to capture in the ROI.
#.  Repeat steps 6 and 7 for a few more cells.
#.  From the `File` menu click `Save ROIs` or press ctrl+S/cmd+S.
#.  Click on the `Next Image` button. Verify that image 2 loads.
#.  Repeat steps 6 to 9 for this image.
#.  Click on the `Next Image` button. Image 3 should load and the `Next Image` button should now be disabled.
#.  Exit the application by closing the window. You should be returned to the main menu window.
#.  Open these images in Insight and verify that the ROIs exist.

Testing EventTimer
==================

#.  Import images from ``squig:\ome\data_repo\curated\deltavision\michael\mtools`` into a suitable project/dataset (ALL mtools WORKFLOWS REQUIRE FULL PROJECT/DATASET HIERARCHY)::

       RPE1-CAG_Trans_01_01_R3D
       RPE1-CAG_Trans_01_02_R3D
       

#.	In Insight open each of the new images and create some rectangular ROIs that are propagated over some time points. The time points for an ROI should be consecutive, without gaps.
#.	Open mtools and ensure the username, password and server address are entered into the text boxes.
#.	Click on the `Event Timer` button to log in to the server and open the tool. In the dialogue that pops up choose the group that contains the images imported in step1.
#.	The main application window should now be displayed. Press the `Add/Remove Datasets` button and in the dialogue that appears select the project and dataset containing the images from step 1. Press the `+` button to add this dataset to the analysis queue and press `OK` to return to the main window.
#.	Check the box to `Save masks` and accept the warning about the time it takes to process.
#.	Add a number of frames to the start and end of each ROI by entering a number in the related text boxes.
#.	Press `Begin Analysis` and look for the progress bar moving as the mask images are uploaded to the server.
#.	Once analysis is complete a save file dialogue will appear. Save the results spreadsheet/.csv to a convenient location.
#.	The application can now be closed.


#.  In Insight, check for the masks images::

       RPE1-CAG_Trans_01_01_R3D_masks
       RPE1-CAG_Trans_01_02_R3D_masks


#.	|C| that these images are mostly black, except for the areas enclosed by the ROIs in the corresponding original images (= event areas). 
#.  Scroll through t and watch for these events appearing in the mask images and 

    - |C| that each event will display the event number in the top left corner of the event area. 
    - |C| that the number is present in the time points that match those of the ROIs in the original image. 
    - |C| that the numbers are not present in time points before/after the ROI. 
    - |C| that the correct number of frames has been added to the start/end of the events, as specified in step 7.


Testing Label Images 
====================

#.  Open mtools and ensure the username, password and server address are entered into the text boxes.
#.  Click on the `Label Images` button to log in to the server and open the tool. In the dialogue that pops up choose a group that contains images of various sizes.
#.  In the main application window, select `File` -> `Open Image` and browse to an image up to 1024 x 1024 in size that has multiple z-sections and/or time points.
#.  Click `Add label` and enter some text for the new label. Choose a colour from the drop-down list. Click `OK`.
#.  Repeat step for a few times, varying the text and colour chosen.
#.  Inspect the drop-down list of labels you have created. Delete one of the labels and check that the drop-down list updated correctly.
#.  Click the `Create point` button (cross-hairs) and place a few points on the image. 
#.  Click the `Select point` button (arrow) and select a point. The point should turn white.
#.  Select a few more points and check only the selected point is white.
#.  Delete some of the points: select one and hit the `Delete selected point` button, or press `Del` on the keyboard.
#.  Add points from the various labels you have created to various z-sections/time points of the image. From the View menu test the `Flatten points in Z/T` options.
#.  Click the `Zoom in` button (+ magnifying glass) and click on the image to zoom in to that region. Do this again to zoom in further.
#.  Click the `Zoom out` button (- magnifying glass) to zoom right out to see the whole image again.
#.  Play with adding/selecting/deleting points whilst zoomed in at the two zoom levels on various z-sections/time points.
#.  From the `File` menu, select `Save Points` to save the points to a location on your computer. Note the image name should be automatically filled out as the name of the file.
#.  From the `File` menu, select `Save Label Definitions` to save the label definitions to a location on your computer.
#.  Add some more labels to your drop-down list (step 4).
#.  From the `File` menu, choose to `Open Label Definitions`. Observe the question dialogue that appears, and select to continue. Browse to and select the labels definition file saved in step 16.
#. Inspect the labels drop-down to confirm that the labels are as they were when you saved them in step 16.

#.  Repeat the opening and creation of points with three more images, one image at a time, and each time save the points to your computer. 
#.  From the `Analysis` menu, choose `Batch analysis`. In the text box make up a name for an experimental condition (e.g. siCtrl). Click `Add Points Files` and browse to and select two of the points files saved earlier. |C| that this condition appears in the list box.
#.  Enter a second experimental condition (e.g. siRNA), click `Add Points Files` and browse to and select the other two points files created earlier. |C| that this condition appears in the list box.
#.  Click `Analyse` and in the dialogue that appears select a location to save it to. Creating a new directory is recommended for this analysis. Specify a name for the save file and click `Save`.
#.  As the progress bar moves, the data is being written out to .xls (Windows) or .csv (Mac). When this is complete, open these files in Excel to inspect them. Note that there will be files for each image analysed plus the summary file that you named in step 23.
#.  Select the ``Analyse the points on current image`` menu item under ``Analysis``. |C| that the output is one (csv or xls) file corresponding to the image which was at display at the time of execution of the command.
#.  Try to open one of the very large images. It should handle two different scenarios here:

    - A large image that has been imported but not yet viewed in Insight/web (i.e. no rendering settings exist yet)
    - A pyramidal image that will take a long time to download.

Please investigate whether these scenarios play out correctly (i.e. there is a warning asking you to open the non-rendered image in Insight or Web first). Note that it may take a LONG time for a very large image to appear, so don’t assume too quickly that it has crashed.


Testing Intensity Measurement tool
==================================

Prerequisites:
    - Some small number of images (multi-Z, multi-C, not ‘large images’) across some number of datasets/projects
    - Rectangular, multi-Z ROIs encompassing some object in the images (e.g. a cell)
    
      - ROIs can be produced via BoxIt or the measurement tool in Insight
      - ROIs can be distributed as single ROI or multiple ROIs per image

#.  Launch mtools and enter the user credentials. Click on ‘Intensity Measure’ and select the correct working group when the dialogue appears. The main programme window will appear. 
#.  From the ‘File’ menu click ‘Choose Datasets’
#.  In the Dataset Chooser dialogue use the drop-down control to select a project. The datasets will be listed in the left-hand ‘Datasets:’ list. Select a dataset and click the ‘+’ button to add it to the ‘Datasets to analyse:’ list on the right-hand side.
#.  Repeat step 3 to add all of the desired datasets, from whichever projects are necessary, containing the images from the ‘Prerequisites’ section.
#.  Incorrect datasets can be removed from the analysis list by highlighting and clicking the ‘-‘ button. The whole list can be cleared by clicking the ‘x’ button.
#.  Once all of the datasets have been selected, click the ‘ok’ button. The programme will now go through each selected dataset and find all of the images containing rectangular ROIs.
#.  Focus will now return to the main programme window. After a few seconds a thumbnail of the first image will appear in the left-hand viewer with the first ROI drawn in green. After a few more seconds the right-hand viewer will display an example of the default ‘Otsu’ segmentation of the first channel in the image.
#.  The channel for segmentation can be changed in the drop-down box in the top-centre panel. The right-hand viewer will update with the new segmentation. Choosing ‘Separate Objects’ and clicking ‘Preview Segmentation’ will update the image again, with a different grey-scale representation of each object.
#.  The segmentation algorithm used can be changed in the bottom-middle panel. ‘Otsu’ is the default. Other methods can be chosen here and you must click the ‘Preview Segmentation’ button the see the results of this. For ‘Absolute threshold’ you can use the horizontal slider under the right-hand viewer to adjust the threshold value or enter a value in the text box between the viewers. Again, click ‘Preview Segmentation’ to see the results. An adaptive threshold of ‘ROI mean + x * standard dev.’ can be adjusted by entering a number in the text box.
#. Small objects can be filtered out by specifying a ‘Min object size’ in the text box between the viewers, and the mask can be expanded in the same way. Click ‘Preview Segmentation’ to see the results of this.
#. Choose one or more channels to measure by ticking the boxes in the bottom-left panel. There are two columns for each channel in the image: ‘Measure directly’ takes intensity values directly under the segmentation mask for the chosen channels. ‘Measure around’ takes intensity values that are not under the mask. There is an optional tick box, ‘Use x pixels annulus with y pixel gap’, for constraining the ‘around’ measurement to only x pixels in width close to the mask with a y pixel gap.
#. Once segmentation parameters have been chosen, the effect on another image from the selected datasets can be assessed. Use the ‘Select Image:’ drop-down at the top-left of the programme window. This will load the image chosen and perform the segmentation.
#. The ‘Verify Z-sections’ tick box will generate a potentially time-consuming workflow, depending on the number of images/ROIs chosen for analysis. Leave this unticked for now, we can cover it later.
#. The ‘Save masks to server’ tick box will save a new mask image for each intensity image back into the relevant datasets.
#. Once all settings have been chosen, click the ‘ok’ button. A progress bar window will appear and increment as the programme analyses each of the images in the queue.
#. When the analysis has completed you will be prompted to save a local copy of the spreadsheets/csv files. Choose a location and change the name of the file if desired.
#. After several seconds the ‘attachResults’ dialogue will appear. Select one or more projects/datasets and click ‘Attach to Selected’. This will upload a copy of the data files to the server and link them to the selected objects. Success can be confirmed in insight. This will end the workflow and return you to the initial menu window.

If attaching the results to projects/datasets is not required, click the ‘Cancel’ button. A confirmation dialogue will appear. Clicking ‘No’ will allow you to select projects/datasets again. Clicking ‘Yes’ will end the workflow and return you to the initial menu window

