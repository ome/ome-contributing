
.. contents::
   :depth: 2


################
Render - Insight
################



**To test in**: Insight

**Purpose of the test** is to make sure rendering is smooth and changes are applied consistently to all visualisations of the images and all the options of rendering are functional.

**Note**: For all copy and paste tests, the copied settings must be pasted to a Dataset of Images/Image or Plate/Well that has the same pixel type and number of channels as the image the settings were copied from. It is suggested that changes made to settings for test purposes are obvious and easily recognisable.

Render - basic
==============

#. Use right-click to copy settings from an image.

   
   - |C| that both left-hand pane tree and central pane have the appropriate right-click menu [:ref:`Render001`].


#. Select a collection of images and use right-click to Paste and Save the settings [:ref:`Render002`]. 

   - |C| that the thumbnails in the centre pane and the Preview viewer and User Settings thumbnail update. 

#. Select a well in a plate and change the settings then use right-click to ``Copy`` and then ``Paste and Save`` the settings to the whole plate using right-click.

   - |C| that the images in the wells in the centre pane and the Preview viewer and User Settings thumbnail update.


#. In Preview, change the settings using 

   - Sliders.
   - Color picker.
   - Toggling a channel on and off.
   - Copy settings which were not saved, do NOT paste, then
   - Navigate to another image, copy settings from it (settings which were saved, e.g. using right-click on the image in the tree) then
   - Paste in Preview of a third image and |C| that the second (most recently copied) settings were pasted.
   - Open the Full Viewer from the Preview tab using ``Launch Full Viewer`` button.
   - |C| that the Full Viewer shows the same Rendering settings as the Preview.
   - |C| that the size of the image in the Full Viewer is such that it fits into the window, not smaller.
   - Paste something into the Full Viewer and |C| that the Full Viewer updates.
   - Change the Rendering settings in the Full Viewer and press Save. |C| that Preview viewer and User Settings thumbnail updates.
   
   - Copy the unsaved Rendering settings from the Preview pane of an image and Paste them
     
     - in the Full Viewer of another image.
     - in tree, using right-click menu.
     - in Preview pane of another image.
     - do all 3 Paste actions also on Plate (in tree) and on single Wells in Plate (Full Viewer & Preview).
     - |C| that the Rendering settings were updated after Paste in all cases.

#. In context (right-click) menu, execute the ``Imported and Save`` on a Plate Run and |C| this does revert the Rendering settings to its original state at import.


#. Min Max.

   - Import a few images. Go to Preview.
   - |C| that for each channel the start-end is set to the min-max.
   - Select images imported previously (not the newly imported ones).
   - Click ``Imported`` (Insight) or 
   - |C| that for each channel start-end = min-max.

#. Make sure you have images in "Orphaned Images" folder (get them via CLI import or do Cut command).

#. Repeat steps 1. - 6. working on orphaned images. 

#. Repeat the steps 1. - 6. with Big Images (Find suitable images here [:download:`TestingSet <downloads/ImportTestingSetTable.pdf>`] or here [:download:`TestingTemplate <downloads/ImportTestingTemplate.pdf>`]). Preview is **NOT** available for Big images. 

Render - copying / resetting
============================


#. Paste settings with the Full viewer open.

   - Make sure you have 2 identical images next to each other (you can quickly import the ``test_images_good/dv/CFPNEAT01_R3D.dv`` image 2x).
   - Let us call the images ``image-1`` and ``image-2``.
   - Open ``image-1`` in the Full Viewer, switch off a channel and Save (icon in the top row in the Full Viewer ).
   - Do not close the Full Viewer of ``image-1``.
   - In the Data Manager (= the main pane of OMERO.insight) select the thumbnail of ``image-2`` and copy the rendering settings.
   - Select the thumbnail of ``image-1`` and paste the rendering settings.
   - |C| that both the thumbnail as well as the Full Viewer of ``image-1`` have the new settings now.
   - Close the Full Viewer of ``image-1``.
   - |C| that no ``Save`` dialog is displayed.
   - Re-open the ``image-1`` in the Full Viewer.
   - Select the thumbnail of ``image-1`` and paste the rendering settings.
   - In the Full Viewer, switch off a channel again and DO **NOT** save.
   - Close the Full Viewer of ``image-1``.
   - |C| that the ``Save`` dialog appears.
   - Select ``Yes`` to save the new rendering settings.
   - |C| that the thumbnail of image-1 has updated in the centre pane and in the viewer and User Settings in Preview.
   - Re-open ``image-1``.
   - |C| that the rendering settings are as saved last time and the Full Viewer and thumbnail in the centre pane and in the viewer and User Settings in Preview correspond.

#. Reset imported settings [:ref:`Render003`]. 

   - |C| that thumbnails in the central pane are updated.
   - |C| that when you select Plate Run in Web and ``Set Imported and Save``, no error occurs.

#. Set min/max settings. 

   - |C| that thumbnails in the central pane are updated.

#. Set owner's settings [:ref:`Render004`]. 

   - |C| that thumbnails in the central pane are updated.

 
Other users' data
=================

#. Other users' data - basic.

   - Open an image belonging to another user.
   - Modify the settings in the ``Preview`` pane on the right [:ref:`Render005`] or use the icon on the top left in the ``Full Viewer`` window (Insight). Save your own settings using the ``Save`` icon in Preview or ``Save`` icon in ``Full Viewer`` (top row of ``Full Viewer``).
   - |C| that thumbnails in the central pane are updated.
   - Use ``Save to all`` button.
   - |C| that all thumbnails in a Dataset or all wells in a Plate Run are updated.



#. Other users' data - Owner's settings.

   - Import at least 2 multi-t and multi-z images as a user (e.g. user-4) in Read-Only group.
   - Go to the imported images and modify the Rendering settings in such a way that you can recognize these settings easily later.
   - Log out and Log in as an Owner of Read-Only group (e.g. user-3). 
   - View the images you just imported as another user (e.g. user-3 viewing user-4's images).

     - |C| that, still as a default you can see the Rendering settings you just saved as the owner of the image (for example user-4).
     - |C| that when you change Rendering settings and click ``Save`` in Preview pane, your own settings appear in the list under ``User Srttings``.
     - Change Rendering settings and click ``Save to All`` in Preview pane, followed by clicking ``Imported`` in Preview pane and again ``Save to All``.
     - |C| that the thumbnail in the centre pane, the viewer in Preview, the thumbnail in User Settings and the image in the Full Viewer still match. 
     - |C| that under ``Preview > User Settings`` the settings of the owner are hightlighted blue. 

#. Repeat step 2 of the present section, this time in Read-Annotate and Read-Write groups (note that you do not have to be Group Owner in these groups to save your own settings on other's images). 


   
    





.. _Render001:
.. figure:: images/testing_scenarios/Render/001.png
   :align: center

   Render001: 


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


.. _Render002:
.. figure:: images/testing_scenarios/Render/002.png
   :align: center

   Render002:


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


.. _Render003:
.. figure:: images/testing_scenarios/Render/003.png
   :align: center

   Render003


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


.. _Render004:
.. figure:: images/testing_scenarios/Render/004.png
   :align: center

   Render004


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
