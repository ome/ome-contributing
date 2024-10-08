ROI Insight
===========



**To test in**: Insight

**Purpose of the test** is to check main ROI features in Insight (creation, editing, propagation, merging, result collection and export)

**Section 1: Create ROI, Manager, Inspector and Results tabs**





#. Open an image with multiple z/t planes in Full Viewer

#. Open ROI tool

   - from the icon on the top of the Full Viewer [:ref:`ROIInsight001`]
   - from the main menu go ``Controls > ROI Tool`` 


#. Create ROIs (more than 3) of different types including Text (Text is one of ROI types).[:ref:`ROIInsight002`]

#. Use a multi-t image. 
   
   - Create ROI and project it across all time points
   - Delete the ROI
   - Create new ROI, project across all time points
   - Close Viewer
   - Save changes when prompted
   - |C| that the new ROI IS saved


#. Draw a line and "break" into segments and Save

   - Go to the Results tab.
   - The length should display length per segment and the total. Same for angle.
   - Export to Excel. The value displayed in table should be exported as such in Excel.

#. Add comment to the shape (double-click on the shape and write). Tick and untick the ``Show comment`` box

   - |C| that the comment appears and disappears.[:ref:`ROIInsight003`]
   - |C| that when the only action after the image was open was toggling the ``Show comment`` box, no dialog asking whether you want to save pops up

#. Create a Text ROI (the ``A`` icon in ROI manager).

   - |C| that changes in the color of the text are displayed instantly, not just after you saved the text ROI.

#. Select and de-select the ROIs and shapes. Check that type is correct and it corresponds with the selection in Viewer.

#. Move shapes and close the full viewer. 

   - |C| that dialog asking whether you want to save pops up.

#. Propagate shapes, Merge shapes from different z or t planes, Split shapes (which you Merged previously), Duplicate and Delete shapes [:ref:`ROIInsight005`][:ref:`ROIInsight006`][:ref:`ROIInsight007`, :ref:`ROIInsight008`]. Execute these 5 commands from

   - right-click menu on the region in the image
   - right-click menu on the ROI in the list in Measurement Tools window

#. Change Fill and Line color [:ref:`ROIInsight009`]. Change width and height of a shape (Inspector tab).

   - |C| the changes of the region display.

#. In Results tab, add new Measurements and remove Measurements using Results wizard.

   - Click on a row, check that the chosen region/plane changes in the image.
   - Export to Excel.
   - |C| the file was created.

#. Units

   - Import ``test_images_good/EM-data/`` 
   - Draw a line region
   - |C| that the units and values in the Results tab are correctly displayed. This means checking in the General Tab the size of the pixel and judge from it how long approximately your line should be and compare it with what is displayed.


#. Select a Big image

   - |C| that only Manager, Inspector and Results tabs are displayed in the ROI Tool and columns are populated.
   - |C| that the area is now displayed when drawing a rectangle for example.
   - |C| that the font size changes according to the resolution level.
   

**Section 2: Graph, Intensity View and Intensity Results View tabs:**

#. Choose a region propagated on more than 2 z and 2 t planes & scroll through the histograms

#. Choose a Line-type of region.

   - |C| that both Line profile and Histogram are shown. 
   - Export the graph as JPEG or PNG. Only the line plot should be exported.
   - |C| that when you hover over the line in the Graph, in case the pixel size of the image is known, it shows the tooltip with current position in microns.


#. Repeat the step 2 but this time with a rectangle. Note that no Line profile will be shown in this case.

#. In Graph Tab, progress through T using both the slider in the ROI tool and in the Full Viewer of the image. 
    - Close the ROI tool. 
    - Go through T in the Full Viewer of the image.
    - |C| that the ROI tool window does not reopen.
    - |C| that no other unexpected windows pop up (such as magnifying tool).
    - |C| that the ``Help`` menu of the image is not empty.


#. Try to create new regions when on Graph pane and to propagate them

   - Using the magic wand icon
   - Using right-click on the region
   - |C|: message appears "ROI assistant cannot be used in graph pane or intensity view".

#. Switch channels on/off on the image. Select different regions. Scroll through z planes on the Graph tab

   - |C| that the graphs update
   - |C| that the planes in the stack of images updates concurrently
   - Turn channels on off. |C| that histogram updates.

#. In Intensity View tab:

   - |C| that when no region is selected, the ``Intensity Values`` button is greyed out.
   - Select a region in the image which you have saved before.
   - Click to ``Intensity Values`` button.
   - |C| that window pops up with intensity values of single pixels [:ref:`ROIInsight009b`].
   - Toggle channels on the image on/off.
   - Change the channel selection in the ``Intensity Values`` window.
   - Export to Excel. 
   - |C| the file.
   - Close the image viewer, reopen it and open the ROI tool again.

#. Intensity Results View tab.

#. Check freeze at low memory does not occur.

   - Reduce the default memory allocated to insight 

     - right-click on Insight and click on ``Show package contents``
     - edit the ``info.plist`` file
     - note down what are the settings from around Line 110 of this file
       of ``<string>-Xms&&M -Xmx&&M</string>`` (note down the numbers 
       replaced here by ``&&``)
     - change these settings to ``<string>-Xms64M -Xmx64M</string>``
     
   - Draw a rectangle and propagate the shape across few z or t
   - Select the shape
   - Go to "Intensity Results Tab" and add the selected shape
   - After a while, a dialog indicating that an error occurred will pop up.
   - Click OK and check that all the controls do not stay greyed out.
   - Set the default memory allocated to Insight back to the same value as it was before you reduced it.

#. Multi-t/z addition behaviour check

   - Draw a line and propagate it across z or t.
   - Select the shape
   - Go to "Intensity Results Tab" and add the selected shape
   - Wait till the results of the shapes composing the ROI are displayed in the table.
   - Scroll to a new plane where the shape has been propagated. Check
     that the results of the shapes composing the ROI are not added again to the table.
   - Draw another line. Save. Select and Add it. Make sure that only 
     rows corresponding to the new line are added.

#. ``Add selected`` test1

   - Go away from Intensity Results View tab (i.e. select Manager tab). 
   - Still NOT being on Intensity Results View tab, select one region to add (in Results/Manager tabs or in the image itself)
   - NOW Select Intensity Results View tab (the region is still selected - do not change your selection now)
   - Press Add Selected
   - |C| the data were added to the table [:ref:`ROIInsight010`]
   - Try to select more regions and press Add Selected
   - |C| the data were added to the table [:ref:`ROIInsight010`]
   - Try ``Remove`` and ``Remove All`` buttons.
   - Add data again and Export to Excel
   - |C| the file. [:ref:`ROIInsight011`]
   
#. ``Add selected`` test2

   - Draw a rectangle for example.
   - Go the Intensity View Tab. Wait till the results are displayed.
   - Go the Intensity Results View Tab, Click Add selected. the results should be displayed.


**Section 3: ROIs created in 3rd party software**

#. 3rd Party ROIs: 

   
   - Import all the files from ``data_repo/test_images_good/zeiss-lsm/roi-scenario``
   - Import all the files from ``data_repo/test_images_roi/zvi/``
   - All the images thus imported should have ROIs on them.
   - Open all the images.
   - |C| that the ROIs are displayed. 

#. Shapes without linkage to a plane

   - Create a shape (a ROI) not linked to any plane, for example in ImageJ (see :doc:`InsightasPluginImageJFiji` , Section **ImageJ - ROI and OMERO upload**, step 1 for instructions).
   - Import the image into OMERO using OMERO.insight, NOT the IJ-plugin.
   - Open the image in Insight, open the Measurement Tool, do not save the ROI
   - Go to the Graph, Intensity View, Intensity Result View.
   - |C| that the shape is analysed.



	.. _ROIInsight001:
	.. figure:: images/testing_scenarios/ROIInsight/001.png
	   :align: center

	   ROIInsight001: 


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ROIInsight002:
	.. figure:: images/testing_scenarios/ROIInsight/002.png
	   :align: center

	   ROIInsight002:


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ROIInsight003:
	.. figure:: images/testing_scenarios/ROIInsight/003.png
	   :align: center

	   ROIInsight003


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ROIInsight005:
	.. figure:: images/testing_scenarios/ROIInsight/005.png
	   :align: center

	   ROIInsight005


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ROIInsight006:
	.. figure:: images/testing_scenarios/ROIInsight/006.png
	   :align: center

	   ROIInsight006: 


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ROIInsight007:
	.. figure:: images/testing_scenarios/ROIInsight/007.png
	   :align: center

	   ROIInsight007:


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ROIInsight008:
	.. figure:: images/testing_scenarios/ROIInsight/008.png
	   :align: center

	   ROIInsight008


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ROIInsight009:
	.. figure:: images/testing_scenarios/ROIInsight/009.png
	   :align: center

	   ROIInsight009: 


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|	
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ROIInsight009b:
	.. figure:: images/testing_scenarios/ROIInsight/009b.png
	   :align: center

	   ROIInsight009b: 


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|	
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ROIInsight010:
	.. figure:: images/testing_scenarios/ROIInsight/010.png
	   :align: center

	   ROIInsight010:


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ROIInsight011:
	.. figure:: images/testing_scenarios/ROIInsight/011.png
	   :align: center

	   ROIInsight011
	
	
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|

