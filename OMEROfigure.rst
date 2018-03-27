.. contents::
   :depth: 2


##############################################
OMERO.figure
##############################################




**To test in**: Web

**Purpose of the test** is to check that the OMERO.figure as an OMERO.web application is functioning correctly.

#. The redeployment of the daily CI servers currently causes the external
   scripts to be lost. If you need to test the export script, you can reupload
   it as follows where `servername` and `JOB_NAME` need to be replaced::

      $ ssh <servername>
      $ cd /home/hudson/OMERO.webapps/figure/scripts
      $ eval $(bash /home/hudson/ice/ice-multi-config.sh ice35)
      $ /home/hudson/<jobname>/bin/omero login root@<servername> -w omero
      $ /home/hudson/<jobname>/bin/omero script upload omero/figure_scripts/Figure_To_Pdf.py --official

   .. seealso::

        :devs_doc:`Deployment servers <ci-omero.html#deployment-servers>`
           Table of the contributing documentation listing the servers and
           their corresponding deployment job.

#. Go to \https://<servername>.openmicroscopy.org/merge/webclient/, login to the webclient then click on Figure in top toolbar to open OMERO.figure in another tab.

#. This first series of tests checks that saved and unsaved changes are not lost inadvertantly. Creating unsaved figure can be easily done by adding a single image to a new figure (note an image ID from the webclient). If you need to make more changes, simply copy, paste and move or edit the panel.


Saving files to OMERO
============================================================

**Test that saved figures are not lost**

#. Select images in the webclient -> Open with (in tree OR right panel) -> OMERO.figure. This will open OMERO.figure in a new tab, adding the images to the figure. Try to include big images in the various testing scenarios.

   - |C| that the 'Save' button becomes enabled, indicating you have an unsaved figure.

#. Save the figure (click 'Save' button or Menu: File > Save) and choose a figure name. 'Figure1'

   - |C| that the 'Save' button becomes disabled and the url updates with the figure ID. 
   - |C| that you can refresh your browser without any message popup and the figure is refreshed (not lost)

#. Copy the url, then navigate to the webclient and logout. Open new window and paste the url.

   - |C| that after login, you are redirected to the saved figure.

#. Make another change to 'Figure1' and Save. Goto File > New. Add an Image (copy image URL from webclient and paste into the Add Images dialog) and Save 'Figure2'.

   - |C| that no popup messages asked you to save.
   - |C| that File > Open > Figure1 shows your latest changes to Figure1 (no 'save' popups)
   - |C| that hitting the back button takes you to your saved Figure2 (no 'save' popups)

**Test that unsaved changes are not lost on existing figures**

#. Open a saved figure, make some changes without saving. Try to refresh the browser, navigate to webclient or close browser window.

   - |C| that you get a "Leave Page" or "Stay on Page" alert (or equivalent).
   - |C| that choosing "Stay on page" cancels & returns to page, allowing Save.
   - |C| that choosing "Leave Page" results in losing of unsaved changes (when you return).

#. Again, open saved figure and make some unsaved changes. Try to create new file: File > New.

   - |C| that you get a "Save", "Don't Save" or "Cancel" dialog.
   - |C| that "Cancel" returns you to the figure.
   - |C| that "Don't Save" continues with the New File without saving.
   - |C| that "Save" continues with the New File and the unsaved changes are saved.
   - |C| that saving the New figure creates a NEW figure and does not overwrite the previous figure.

#. Again, open saved figure and make some unsaved changes. Try to open figure: File > Open.

   - |C| that you get a "Save", "Don't Save" or "Cancel" dialog before the 'Open Figure' list.
   - |C| that these choices work as described above.

#. Open a saved figure, then open another saved figure and make some unsaved changes.

   - Now try hitting the browser 'Back' button.
   - |C| that the url reverts to the first figure and you get a "Save" or "Don't Save" dialog.
   - |C| that "Don't Save" results in the loss of your unsaved changes.
   - |C| that "Save" does save the changes, when you return to the figure (using Forward button).

**Test that unsaved changes on a NEW figure are not lost**

#. Open a new figure, make some changes without saving.

   - Try to refresh the browser, navigate to webclient or close browser window.
   - |C| that you get a "Leave Page" or "Stay on Page" alert (or equivalent).
   - |C| that choosing "Stay on page" cancels & returns to page, allowing Save.
   - |C| that choosing "Leave Page" results in losing of unsaved changes.

#. Again, open new figure and make some unsaved changes.

   - Try to create new file: File > New
   - |C| that you get a "Save", "Don't Save" or "Cancel" dialog.
   - |C| that "Cancel" returns you to the figure.
   - |C| that "Don't Save" continues with the New File without saving.
   - |C| that "Save" opens a 'Enter Figure Name' dialog.
   - |C| that a new figure is created with the chosen name and no changes are lost.

#. Again, open new figure and make some unsaved changes.

   - Try to open figure: File > Open
   - |C| that you get a "Save", "Don't Save" or "Cancel" dialog before the new figure is started.
   - |C| that these choices work as described above.

#. Open a saved figure, then open a new figure and make some unsaved changes. Now try hitting the browser 'Back' button.

   - |C| that the url reverts to the first figure and you get a "Save" or "Don't Save" dialog.
   - |C| that "Don't Save" results in the loss of your unsaved changes.
   - |C| that "Save" does save the changes, when you return to the new figure (using File > Open).

#. Test renaming figures in the top toolbar.

   - Open a new figure, add a panel and edit the figure name by clicking where name usually appears.
   - |C| that name is displayed when Enter is pressed or field loses focus.
   - |C| that when figure is saved, suggested name is already filled in "Enter Figure Name" dialog.
   - |C| that File > Open shows correct name in files list.
   - |C| that renaming figure again & Save updates the name in the File > Open list

**Additional tests below are for less critical features**

#. Select ``File > Delete a Figure``. 

   - |C| that when you try to delete couple of figures in a row, the workflow makes sense.

#. Select ``File > Open`` to open an existing figure.

   - |C| that you can sort the file list by name and date.
   - |C| that files can be filtered by name.
   - |C| that only files you own are shown by default.
   - |C| that you can choose to show other users' files or 'All files'.
   - |C| that clicking on a Figure name opens the figure.
   - |C| that there is a name of the Figure which is on display above the canvas.

#. Check that exported figures are linked to images they contain. Export a PDF or TIFF of a figure. Click image urls in the PDF to open in webclient.

   - |C| that these images are annotated with the PDF.
   - |C| that the PDF also contains a link to the figure url itself.
   - |C| that export to New OMERO Image creates a new image, and link appears when export is done.


Layout of image panels, paper setup
============================================================

#. Add several images (all same width & height) to a new Figure.

   - |C| that when you paste a non-existent ID or URL, you get a warning message
   - |C| that added panels are laid out as a grid that fills the width of the paper and all are selected.
   - |C| that delete key removes selected panels.
   - |C| that delete button in top toolbar removes selected panels.
   - |C| that delete button is only enabled when one or more panels are selected.

#. De-select panels by clicking on empty canvas space. Select by clicking/dragging on panels:

   - |C| that single click on a panel selects only that panel (other de-selected).
   - |C| that shift-click adds panel to selection (others not de-selected).
   - |C| that dragging-selection, starting on empty space, selects all panels covered by selection.
   - |C| that shift dragging adds selected panels to selection (others not de-selected).

#. Move & resize panels by dragging & keys:

   - |C| that click -> drag on unselected panel selects it and starts drag.
   - |C| that click -> drag on selected panel / panels moves them without changing selection.
   - |C| that up, down, left, right keys nudge all selected panels in the correct direction.
   - |C| that dragging on corner handles resizes all selected panels, maintaining width/height ratio.
   - |C| that dragging on side handle stretches width or height alone.

#. Align selected images with toolbar buttons:

   - |C| that alignment buttons are only enabled when more than one panel is selected.
   - |C| that 'align left' aligns all selected panels to the left-most selected panel.
   - |C| that 'align to grid' snaps all selected panels to grid, starting at top-left panel.
   - |C| that 'align top' aligns all selected panels to the top-most selected panel.

#. Resize selected images with toolbar buttons:

   - |C| that 'align sizes' (width, height and width & height) resize all panels to match the dimensions of top-left selected panel.
   - |C| that 'Align Magnification' resizes selected panels so that the scalebars in the all the selected panels have either equal, or proportional apparent length to the scalebar in the top-left panel. For example if top-left panel displays a scalebar representing 10 microns, all the selected images with scalebars representing 10 microns should have the same apparent length as the one in top-left panel after the alignment of magnification. The scalebars representing 100 microns in the other images should appear as being 10 times longer than the top-left image scalebar and so on.

#. Copy and Paste duplicate panels into grid layout:

   - |C| that copy & paste works with keyboard short-cuts.
   - |C| that copy & paste works with Menu items: Edit -> Copy/Paste.
   - |C| that copy & paste of a 'column' of panels duplicates it to the right.
   - |C| that copy & paste of a 'row' of panels duplicates it to the bottom.

#. Test paper setup. Click File -> Paper Setup:

   - |C| that Number of Pages, Size and Orientation are shown correctly.
   - |C| that changing the number of pages updates the figure.
   - |C| that changing the page size updates pages in the figure.
   - |C| that changing Orientation switches the width and height corretly.
   - |C| that choosing Size > crop page... crops page to fit panels and will reduce multi-page figures to single page. 
   - |C| that setting the page color works as expected.

#. Finally, export to PDF & TIFF
   - |C| that layout corresponds to web UI.
   - |C| that each page of multi-page figure has correct panels, page color, labels & scalebars.


Preview Tab - Z/T and rendering
============================================================

#. Add image with multiple Z sections. Select panel and 'Preview' tab:

   - |C| that Z slider is shown beside viewer in Preview tab.
   - |C| that current Z / total Z numbers are shown at bottom of slider.
   - |C| that sliding Z updates Z number while sliding.
   - |C| that when sliding stops, Preview viewer and selected panel update.
   - |C| that Undo/Redo toggles to the previous Z-section.
   - |C| that clicking the ^ and v buttons increment Z by 1, but stops at 1 or sizeZ.

#. Copy and paste to duplicate image with multiple Z sections. Adjust Z on ONE of them, then select both:

   - |C| that Z slider is shown and is enabled.
   - |C| that current Z is - / total Z at bottom of slider.
   - |C| that clicking the ^ and v buttons increment Z by 1 (Z still different between panels)
   - |C| that sliding Z updates Z number while sliding.
   - |C| that when sliding stops, Preview viewer and selected panel update.
   - |C| that current Z number is now shown (both panels same Z)

#. Check behaviour of T-slider is same as Z-slider for all tests above.

   - |C| that for images that have timestamp data, time in hrs:mins:secs is shown while sliding.

#. Select 2 images with different number of Z-sections.

   - |C| that Z-slider is disabled.

#. Select 2 images with different number of T-sections.

   - |C| that T-slider is not disabled, but T-section is restricted to smaller sizeT.

#. Select a panel with multiple Z, note Z-section, turn on Z-projection:

   - |C| that Z slider has 2 handles, +/- 2 from previous Z-section.
   - |C| that Preview viewer and selected panel show Z-projected images.
   - |C| that current Z-range is shown: start-end / total Z at bottom of slider.
   - |C| that clicking the ^ and v buttons increment Z-start and stop by 1.
   - |C| that dragging each slider updates start or end of Z-range.
   - |C| that turning Z-projection off returns to single Z-selection.
   - |C| that single Z-selection is mid-way between Z-start & end when projection is toggled.
   - |C| that range of Z-start to Z-end is maintained when projection is toggled.

#. Select a multi-channel image:

   - |C| that the channels are shown as 'toggle' buttons beside Preview viewer.
   - |C| that channels can be turned on and off by clicking toggle buttons.
   - |C| that Preview viewer and selected panel images are updated.
   - |C| that Channel color can be changed via drop-down button beside toggle buttons.
   - |C| that *Invert* option works in the channel color drop-down.
   - |C| that Color-picker option launches color-picker and this works OK.
   - |C| that Lookup tables work as expected.
   - |C| that Channel sliders behave as expected & update viewer and panel on stop.
   - |C| that you can enter numbers into the Channel start/end fields and slider updates accoringly.

#. Select multiple images with the same channel count.

   - |C| that channel ON/OFF & color changes are applied to all selected images.

#. Turn a channel ON in one panel and OFF in another. Select both.

   - |C| that if toggling the channel turns it ON in all selected panels.

#. Change channel color in one panel and select both.

   - |C| that a 'null' grey color is shown on the toggle button.
   - |C| that picking a new color is applied to all selected panels.

#. Change channel sliders start/end to different values in different panels. Select both.

   - |C| that start/end numbers are replaced by - where values are not same in all panels.
   - |C| that changing start/end values applies to all panels & value replaces -.

#. Select multiple images with different channel counts.

   - |C| that channel toggle buttons and channel sliders are not shown.

#. Finally, export to PDF & TIFF

   - |C| that layout corresponds to web UI, rendering settings, LUTs, Invert etc look right.
   - |C| that each page of multi-page figure has correct panels, labels & scalebars.


Preview Tab - Zoom, pan & rotation
============================================================

#. All behaviours below need to be tested on Big (tiled) images and small images.

#. Test behaviour of Zoom and Pan. Select a panel.

   - |C| that changing Zoom slider updates viewer while sliding.
   - |C| that stop of Zoom slider updates selected panel too.
   - |C| that dragging the viewer image pans the viewer.
   - |C| that when dragging ends, the selected panel updates too.
   - |C| that Zooming back out to 100% resets the panning to zero offset.
   - |C| that max zoom level is appropriate for images of different sizes.

#. Test cropping to region. Select one or more panels and click the crop button below zoom slider.

   - |C| that a dialog opens showing image at current Z/T with the current crop region shown.
   - |C| that a region can be drawn on the image by click & drag.
   - |C| that the region can be manipulated by dragging corner or side handles or the whole region.
   - |C| that clicking OK crops the selected panels to the chosen region, keeping within existing boundaries.
   - |C| that clicking Reset button restores the shape of the panel to the shape of the image and sets Zoom at 100%.

#. Test crop to ROI. Choose a timelapse image that has multiple Rectangular ROIs in OMERO. Select several panels from the same Timepoint. Click crop button.

   - |C| that the crop dialog loads and shows Rectangle ROIs from OMERO with Z & T indices.
   - |C| that clicking ROIs shows them in the dialog viewer, updating to the correct Z/T plane.
   - |C| that choosing a single-Rectangle ROI updates all seleced panels to the shape of the selected ROI
     and to the Z & T indices on which this ROI is drawn.
   - |C| that if panels with a range of Timepoints are selected, the T value is not changed.

#. Test rotation of panels.

   - |C| that rotation slider is shown when rotation icon clicked.
   - |C| that while sliding rotation, viewer is updated.
   - |C| that when rotation sliding stops, selected panel updates too.
   - |C| that rotation of the image is centered on the centre of the viewer.

#. Zoom and drag to pan the rotated image in the viewer.

   - |C| that the zooming and panning behaves correctly.
   - |C| that additional rotation is centered on the new centre.

#. Test rotation with multiple panels selected.

   - |C| that rotation and zoom sliders show average values.
   - |C| that update to zoom syncronises zoom but not panning in selected panels.
   - |C| that update to rotation syncronises rotation in selected panels.
   - |C| that dragging on viewer image pans to same spot for all selected panels.

#. Finally, export to PDF & TIFF to check that it looks same


Labels Tab
============================================================

#. Test adding a scalebar. Add an image that does NOT have pixel size metadata. Select the image and the Labels tab.

   - |C| that pixel size is 'NOT SET'.
   - |C| that pixel size can be edited by clicking on it, editing & 'Enter'.
   - |C| that selecting an image WITH pixel size metadata, it is shown correctly.
   - |C| that clicking 'Show' adds a scalebar to selected panel.
   - |C| that editing the length, position $ color of the scalebar update scalebar on selected panel.

#. Test scalebar label.

   - |C| that clicking 'Label' on the scalebar dialog adds a label above scalebar on the figure panel.
   - |C| that a font-size widget appears in the scalebar form.
   - |C| that choosing a different font-size for the label updates the label in the selected panel.
   - |C| that unchecking / rechecking 'Label' checkbox hides and shows the label.
   - |C| that moving scalebar to top left or right of panel shifts label below the scalebar.

#. Test units display & conversion. You need an image that has different units for pixel size. See https://www.openmicroscopy.org/site/support/omero5.1/developers/Python.html#create-image and look for "Set the pixel size using units" for how to edit this.

   - |C| that the unit of pixel size is shown in the scalebar dialog.
   - |C| that the unit is also shown on scalebar labels.
   - |C| that saving figure and refreshing the page preserves units display.
   - |C| that 'Align magnification' conversion works correctly when images with different units are chosen.

#. Select multiple panels, with some showing, some NOT showing scalebars.

   - |C| that clicking "Show" adds scalebar to all panels.

#. Select multiple panels, with scalebars of different lengths / location / color / label / font-size

   - |C| that editing scalebar length / location / color / label / font-size applies change to all selected panels.
   - |C| that zooming of the image (in Preview tab) updates scalebar size accoringly.

#. Test manual adding labels to one or more panels.

   - Select an image & enter some text in the 'Add Labels' form. Hit Enter.
   - |C| that label is added to the selected image with default parameters.
   - |C| that choosing different font-sizes / position are shown in new labels.
   - |C| that color-picker works for picking label color.
   - |C| that adding a white label outside the panel creates a Black label.
   - |C| that multiple labels added to a single position are stacked in rows.
   - |C| that markdown syntax works for italic and bold fonts in labels.

#. Test creating labels from metadata to one or more panels. Select 'Image Name' from the drop-down option under 'Label' field.

   - |C| that new label is created with Image name.
   - |C| that new label can also be created with 'Dataset Name'.
   - |C| that 'Tags' option creates new labels from Tags on each selected image.

#. Create new labels from 'Channels' option.

   - |C| that labels are only created from active channels.
   - |C| that labels are colored according to channel color.

#. Add a time-lapse image with time-stamp info, E.g. DV movie.

   - |C| that 'Time' drop-down options are only enabled if timestamp info exists.
   - |C| new labels created with 'Time' add correctly formatted time label to each panel.
   - |C| that scrolling through time (in Prevew tab) updates timestamp labels on each panel.

#. Test editing existing labels on multiple panels.

   - |C| that identical labels on multiple panels are combined under 'Edit Labels' (no duplicates).
   - |C| that editing all labels update labels on selected panels.
   - |C| that Time-stamp labels can be updated for Size, Color & Position without affecting time shown.

#. Finally, export to PDF & TIFF to check that all labels and scalebars looks same as in web.

   - |C| that the PDF includes a note about the length of scalebars in the figure.
   - |C| that scalebar labels appear the same in the PDF as in the web figure.


ROIs
============================================================

#. Test drawing of ROIs.

   - |C| that ROI viewer is launched when the 'Draw' button is clicked.
   - |C| that you can choose shape type with the toolbar buttons.
   - |C| that you can draw a Rectangle, Ellipse, Line & Arrow.
   - |C| that holding down Shift key while creating/updating shapes constrains shape to cicle, rectangle, or horizontal/vertical line.
   - |C| that you can tweak the last-drawn shape while still adding more shapes (without switching to select mode).
   - |C| that Select mode allows you to select single shapes with click, multiple shapes with drag.
   - |C| that currently selected shape(s) color and line width are shown in toolbar (or defaults are chosen if not the same in all shapes).
   - |C| that changing the color and line width updates the currently selected shapes.
   - |C| that selected shapes can be copied, pasted & deleted using Edit menu or keyboard shortcuts.
   - |C| that clicking OK closes the dialog and updates the figure with shapes.

#. Test loading ROIs from OMERO by clicking *Load ROIs* in ROIs dialog, using a multi-plane image with a number of different ROI shapes on it (Ellipse, Rectangle, Line, Arrow, Polyline, Polygon).

   - |C| that *Load ROIs* button is disabled if image has no ROIs in OMERO.
   - |C| that clicking buttong loads and displays ROIs from OMERO.
   - |C| that hovering over each Shape shows it temporarily on the image.
   - |C| that clicking on a Shape in the list moves the image to the corresponding Z/T index.
   - |C| that clicking Add adds the shape to the image and selects it.
   - |C| that added shapes can be edited (drag, resize, color, line-width) including Polyline & Polygon.
   - |C| that saving figure and refreshing correctly reloads all shapes.

#. Copy & Paste ROIs.

   - Draw some ROIs in the ROI dialog, OK to close.
   - |C| that the number of ROIs in selected panels is shown at top of Labels tab.
   - |C| that you can now copy all the ROIs on the panel with the Copy button.
   - |C| that you can paste ROIs onto another panel (or panels).
   - |C| that you can also Delete all ROIs on selected panels with the Delete button.
   - |C| that you can use the Colour and Line width choosers on the ROI controls on the Labels tab to apply chosen colour or line width to all shapes in selected panels.

#. Copy & Paste crop region.

   - |C| that the View x, y, width height update in the Preview tab when you zoom and pan the viewport.
   - |C| that you can copy the crop region and paste onto another panel / panels.
   - |C| that multiple selected panels with different view regions show '-' for x, y, width, height.
   - |C| that the "Crop" button launches the crop dialog and the "Reset" button reverts to uncropped panel.

#. Copy ROIs Rectangle -> Crop region.

   - Duplicate a panel by copying and pasting the panel
   - Copy a single Rectangle on the first panel by opening the ROI viewer, selecting/drawing a rectangle and 'Copy'.
   - |C| that clicking Paste in the Preview tab crops the other panel.
   - |C| that crop region matches the region highlighted by the rectangle in first panel.

#. Copy Crop region -> Rectangle.

   - Again, copy and paste a panel to duplicate and zoom and pan one panel to chosen viewport.
   - Copy the view region by clicking Copy in the View section of the Preview tab, select the other panel and click Paste under the ROI header of Labels tab.
   - |C| that a new Rectangle ROI is created and this corresponds to the viewport region of the other panel.
   - |C| that you can then update the colour / line width of this rectangle using the ROI color & line width controls.

#. Crop dialog using regions from Clipboard or ROIs on the image

   - Copy some ROIs (including Rectangle(s)) to the clipboard.
   - Open the Crop dialog (green button) on an image that has some Rectangular ROIs drawn on it.
   - |C| that you can pick regions from the clipboard or from ROIs on the image and use these to crop the image.
   - |C| that if you are cropping an image that has ROIs on it, you are asked if you want to remove these ROIs when you crop it.
   - |C| that clicking Yes, No or Cancel on this dialog has the expected effect.

#. Finally, export to PDF & TIFF to check that ROIs look same as in web UI.

   - |C| that rotated images have ROIs showing in correct location on export.
   - |C| that multi-page figures have ROIs in correct location on all pages.


Info Tab
============================================================

#. Test Info for a single panel. Select panel and click the 'Info' tab.

   - |C| that Image Name is shown at the top of Info tab.
   - |C| that other metadata (sizes & channels) are shown and correct.
   - |C| that clicking 'Show in webclient' shows image in new tab.
   - |C| that resizing or moving panel updates x, y, width, height while dragging.
   - |C| that DPI value is updated while resizing.

#. Test Info for a multiple panels.

   - |C| that number of panels selected is shown in place of Name.
   - |C| that clicking 'Show in webclient' shows images in new tab.
   - |C| that metadata is shown only if it is same in all panels.
   - |C| that x, y, width, height are shown only if same in all panels.
   - |C| that DPI is shown only if same in all panels.

#. Test Open-with with one or more images selected.

   - |C| that single image can be opened in Webclient and Image viewer (and iviewer if installed).
   - |C| that multiple selected images can be opened in Webclient (both selected if in same Dataset) and iviewer.

#. Test Editing the ID for multiple panels. Copy & paste panels to create multiple panels from the same Image.

   - |C| that 'Edit ID' button is only enabled if all selected panels are same ID.
   - Pick another similar image in webclient. Note ID. Select multiple panels with same ID and click 'Edit ID'. Enter new image ID.
   - |C| that 'Preview' is only enabled when valid ID is entered.
   - |C| that clicking 'Preview' displays new image thumbnail and other metadata.
   - |C| that Green/Red flags are shown where x, y, z, c, t matches.
   - |C| that warning are shown below in Red if new image has fewer timepoints / channels than selected panels.
   - |C| that other mismatches are shown as Green messages.
   - Click 'Update' to replace selected panels with new image.
   - |C| that Time-points and Channels are preserved but Z-indecies are not.

#. Test setting the panel x, y, width & height on a multi-page figure.

   - |C| that x and y coordinates apply to the page that the panel is on.
   - |C| that setting x & y for muliple panels on different pages works as expected.
   - |C| that setting width and height of panels works.
   - |C| that the aspect ratio can be preserved by clicking to link width & height.

#. Test the display and update of panel resolution (dpi).

   - |C| that the 'dpi' is displayed for each panel and updates when zoomed or resized.
   - |C| that the "Set dpi" button allows you to choose a min and max dpi for export in the pop-up.
   - |C| that you can change the max dpi (a valid number is required) but setting min dpi is optional.
   - |C| that if the export dpi is shown in the Info tab if different from the default dpi.
   - |C| that you can remove the minimum export dpi with the X button.
   - |C| that if the export dpi is expected to be > 300 that the image appears interpolated, not pixelated.

#. Finally, export to PDF & TIFF to check that it looks same as web UI.

   - |C| that dpi is as expected in exported PDFs using Adobe Illustrator and http://swainhart.org/how-to-check-the-dpi-of-an-image-in-adobe-illustrator-cs5/.
   - |C| that export 'with images' includes extra folders with images that have been interpolated (this will be all images for TIFF export)


Export Options
============================================================

#. There are 4 export options: PDF, PDF with Images, TIFF and TIFF with images. Choose each in turn and export:

   - |C| that the TIFFs or PDF figures look the same as they do in the web.
   - |C| that when 'with Images' option is chosen, the export should produce a zip containing 3 directories of images (original, pre-resampled and final). Images named the same in each directory should show progression of processing.
   - |C| that single page figures produce a single TIFF image download when 'TIFF' (no images) is chosen.
   - |C| that multi-page figures produce a zip of TIFFs (one per page) with a PDF 'info' page.

