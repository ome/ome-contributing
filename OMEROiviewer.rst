OMERO.iviewer
=============

**To test in**: OMERO.iviewer

#. With the OMERO.iviewer configured as the default viewer in webclient, adjust settings in Preview panel and then click "Full Viewer" to open iviewer.

    - |C| that the rendering settings are in the URL and are respected (channels on/off, levels etc.).
    - |C| that adding Zoom, X, Y, Z & T to URL are respected in big / multi-plane image as appropriate: e.g. ?zm=50&x=300&y=500&z=10&t=5

#. In webclient, select multiple Images or a Dataset or Well and test "Open with > OMERO.iviewer".

#. In the left hand column, note the images thumbnails.

    - |C| that scrolling to the bottom of the column loads more images from the same dataset or selection
    - |C| that the thumbs refresh correctly when changes to the dataset or selection have been made


#. In the settings pane, adjust the rendering settings and save them. Use histogram and LUTs. Scroll through Z or T on the image.

#. |C| that the scalebar is in the bottom left of the image, try to move it.

#. |C| that the full-screen button is on the very top right of the central pane.

#. Click the Crosshairs icon at the top right of the viewer to enable the pixel intensity display for the mouse pointer. Then mouse over the Image to see the pixel intensities for the channels turned on.

#. |C| that the X, Y position of the mouse is indicated in the top right corner.

#. Select sequentially all the ROI tools (Rectangle, Ellipse, Line, Arrow, Polygon, Polyline, Point, Label) in the right-hand pane and draw each ROI on the Image, using Click-Move-Click (not drag) and Save them using Save button.

#. Draw again all the ROI types but do not save them.

#. Go back to each ROI you have drawn (both saved and unsaved) and try to Edit them by

    - moving the ROI around
    - changing the shape of the ROI (re-shaping it)

#. Draw also a couple of other ROIs on different Z planes.

#. Draw ROIs which are associated with a concrete z,t as well as ROIs which are "floating". To draw "floating" ROIs, unlock the lock to the right of the "Z" and "T" boxes above the toolbar of the ROI tab.

#. |C| that the ROIs drawn with the "Z" and "T" boxes unlocked do not have any values in the Z and T columns of the ROI table.

#. Drag on the Image to pan.

#. Zoom in and out by

    - scrolling the mousewheel
    - using the controls on the top left of central pane
    - using trackpad

#. |C| the "fit to size" and "1:1" resizing buttons on the top left of central pane.

#. Test the birds eye view functionality and panning and zooming on. Find links to images in the testing sheet or import them or similar images from indicated locations.

    - Big, tiled image, e.g. the ``[Series 1]`` image of ``ome/data_repo/curated/alexandra/UMD001_ORO.svs`` (sizes over 4000 x 4000 pixels, but can be configured, so choose a much larger image than the limit)
    - Large image (tiled in iviewer, but not in OMERO) (between 4000 x 4000 and 2000 x 2000 pixel size, e.g. 2477 x 3498 pixels)
    - Small image (not tiled in iviewer), e.g. the ``[Series 2]`` image of ``ome/data_repo/curated/alexandra/UMD001_ORO.svs`` (less than 2000 x 2000 pixels). Note that you have to expand the birds eye first as it is collapsed by default for small images.

#. Using Shift-drag, rotate the image (using selection tool) or draw “freehand” (polygon, polyline, rectangle and ellipse).

    - |C| that after rotating the image, the arrow icon on top right of the central pane resets the image back to the 0 degree rotation.

#. Click on each type of ROI in the right-hand pane ROI table. This should bring the viewport to the position where the selected ROI is in the middle of it and navigates the viewport to the timepoint and z section the ROI is associated with.

#. Select several ROIs from different Z planes in the ROI table. Shift-click to select a range, Cmd-click to select several ROIs.

    - |C| that the selected ROIs are highlighted in blue in the image and the ROI table.
    - |C| that the table scrolls to show selected row.

#. Select multiple ROIs in the image using Cmd-drag.

    - |C| that the selected ROIs are highlighted in blue in the image and the ROI table.

#. Save the ROIs. Export the Intensities, areas and line lengths into Excel. Select, in the top-left corner ROIs > Export (CSV). This will export the values from the selected ROIs.

#. If possible, open a Big image and a multi-Z/T image with as many ROIs as possible.

    - |C| that ROIs are paginated if more than 500 on any plane.
    - |C| that ROIs are loaded for each plane viewed.
    - |C| that new or edited ROIs are not lost when moving between Z/T/page: "Save first" dialog is shown.

#. Delete some ROIs. Note that the deletion of saved ROIs just highlights these as red in the ROI table. The deletion is executed only after the Save button has been clicked. The unsaved ROIs should disappear immediately from image and table after deletion. Try deleting using

    - Delete key on keyboard
    - Backspace key on keyboard
    - Delete button in iviewer
    - Main menu (ROIs > Delete)

#. Save the viewport by selecting in the top left corner File > Save Viewport as PNG.

#. Use a multi-z image for the two following steps. Compare the two channels of one of the Images in multi-image view:

    - Double-click on the thumbnail of the already opened Image in the left-hand pane of the viewer. This will open the Image again in a new window.
    - Select sequentially both of the windows and in the right-hand pane in the Settings tab switch all channels except one off e.g. the green for one window, blue for the other window.

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

#. Masks can be created using `script <https://github.com/openmicroscopy/openmicroscopy/blob/142840f5e47720a7d46b84e5f06a5600496f5345/examples/Training/python/ROIs.py#L120>`_ or you can find a link to image with a mask in the testing sheet

    - Open an image with a mask in iviewer and
    - |C| that you can see the mask in the ROI table (cannot be edited)
    - |C| that you can see the mask in the viewer on the image as red object (hide and show it alternately in the ROI table to be sure that you are viewing the mask)
