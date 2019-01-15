OMERO.iviewer
=============

**To test in**: OMERO.iviewer

#. In the left hand column, note the images thumbnails.

    - |C| that clicking on the arrows on the bottom of the column loads more images from the same dataset
    - |C| that the thumbs refresh correctly when changes to the dataset have been made

#. In the settings pane, adjust the rendering settings and save them. Use histogram and LUTs. Scroll through Z or T on the image.

#. |C| the scalebar in the bottom left of the image, try to move it.

#. |C| the full-screen button on the very top right of the central pane.

#. Click the Crosshairs icon  at the top-right of the viewer to enable the pixel intensity display for the mouse pointer. Then mouse over the Image to see the pixel intensities for the channels turned on. 

#. |C| that the X, Y position of the mouse is indicated in the top right corner. Select the arrow tool in the right-hand pane  and draw an arrow on the Image, using Click-Move-Click (not drag), pointing to a feature in the Image and save it using the Save button located in the upper part of the right-hand pane. Draw also a couple of other ROIs on different Z planes.

#. Draw ROIs which are associated with a concrete z,t as well as ROIs which are "floating". To draw "floating" ROIs, unlock the lock to the right of the "Z" and "T" boxes above the toolbar of the ROI tab.

#. |C| that the ROIs drawn with the "Z" and "T" boxes unlocked are do not have any values in the Z and T columns of the ROI table.

#. Drag on the Image to pan.

#. Zoom in and out by

    - scrolling the mousewheel
    - using the controls on the top left of central pane

#. |C| the "fit to size" and "1:1" resizing buttons on the top left of central pane.

#. Open a large image and |C| the birds eye view functionality.

#. Using Shift-drag, rotate the image (using selection tool) or draw “freehand” (polygon, polyline, rectangle and ellipse).

    - |C| that after rotating the image, the arrow icon on top right of the central pane resets the image back to the 0 degree rotation

#. Click on a ROI in the right-hand pane table. This should bring the viewport to the position where the selected ROI is in the middle of it and navigates the viewport to the timepoint and z section the ROI is associated with.

#. Select several ROIs from different Z planes. You can select in the table (Shift-click to select a range) but also in the image itself using Cmd-drag to select multiple ROIs.

#. Save the ROIs. Export the Intensities, areas and line lengths into Excel. Select, in the top-left corner ROIs > Export (Excel). This will export the values from the selected ROIs.

#. Delete some ROIs. Note that the deletion of saved ROIs just highlights these as red in the ROI table. The deletion is executed only after the Save button has been clicked. The unsaved ROIs should disappear immediately from image and table after deletion. Try deleting using

   - Delete key on keyboard
   - Delete button in iviewer
   - Main menu (ROIs > Delete)

#. Save the viewport by selecting in the top-left corner File > Save Viewport as PNG.

#. Compare the two channels of one of the Images in multi-image view:

   - Double-click on the thumbnail of the already opened Image in the left-hand pane of the viewer. This will open the Image again in a new window.
   - Select sequentially both of the windows and in the right-hand pane in the Settings tab switch all channels except one (e.g. the green for one window, blue for the other window) off.

#. Synchronize the viewport windows by adding them both to the same sync Group. Select one window, click the sync icon in the top-left corner and select the first option (lock with number 1) in the dropdown menu. Repeat for the other window.

    - |C| that both Images have the Z/T and View (zoom and position of viewport) synchronized. Note that you have to first drag or zoom in or change Z/T in one of the windows to see this synchronization.
    - |C| that a single click on a thumbnail of another image in the left-hand column of iviewer displays that image in the active window, but does not open a new viewport.

#. Find in the Info tab the link to Dataset.

    - |C| that clicking on the link brings you to the Dataset.

#. Make a projection on a multi-z image. Save projection as a new image. File > Save projection as a new image

#. Copy ROIs

    - from one image to another and |C| that the ROIs are pasted on the same position if the other image is equal in size
    - onto the same image
    - using the keyboard shortcuts
    - using main menu (ROIs > Copy and ROIs > Paste)
    - using the Edit menu in the right-hand pane above the ROI table

#. Check the tooltip on the ROI table - each tooltip should have

    - ID of ROI
    - ID of Shape
    - owner (first and last name)
