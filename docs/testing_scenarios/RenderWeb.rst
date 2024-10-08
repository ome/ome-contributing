.. contents::
   :depth: 2


############
Render - Web
############




**To test in**: Web

**Purpose of the test** is to make sure rendering is smooth and changes are applied consistently to all visualisations of the images and all the options of rendering are functional.

**Note**: For all copy and paste tests, the copied settings must be pasted to a Dataset of Images/Image or Plate/Well that has the same pixel type and number of channels as the image the settings were copied from. It is suggested that changes made to settings for test purposes are obvious and easily recognisable.

Render - basic
==============

#. Use right-click to copy settings from an image.

   - |C| that the right-click menu comes up only when selecting in the left-hand pane tree, not in central pane [:ref:`RenderWeb003`].
  


#. Select a collection of images and use right-click to Paste and Save the settings. 

   - |C| that the thumbnails in the centre pane and the Preview viewer and User Settings thumbnail update. 

#. Select a well in a plate and change the settings then use right-click to ``Copy`` and then ``Paste and Save`` the settings to the whole plate using right-click.

   - |C| that the images in the wells in the centre pane and the Preview viewer and User Settings thumbnail update.


#. In Preview [:ref:`RenderWeb004`], change the settings using 

   - Sliders.
   - Color picker [:ref:`RenderWeb004b`].
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
     - in tree, using right-click menu [:ref:`RenderWeb003`].
     - in Preview pane of another image.
     - do all 3 Paste actions also on Plate (in tree) and on single Wells in Plate (Full Viewer & Preview). **Note** that the ``Save to All`` button is disabled for Plates when single wells are selected.
     - |C| that the Rendering settings were updated after Paste in all cases.

#. In context (right-click) menu, execute the ``Set Imported and Save`` on a Plate Run and |C| that this does revert the Rendering settings to its original state at import.


#. Min Max.

   - Import a few images. Go to Preview.
   - |C| that for each channel the start-end is set to the min-max.
   - Select images imported previously (not the newly imported ones).
   - Click ``Imported``  button.
   - |C| that for each channel start-end = min-max.

#. Repeat steps 1. - 6. working on orphaned images. 

#. Repeat the steps 1. - 6. with Big Images (Find suitable images here [:download:`TestingSet <downloads/ImportTestingSetTable.pdf>`] or here [:download:`TestingTemplate <downloads/ImportTestingTemplate.pdf>`]).




Render - copying / resetting
============================

#. Copy settings in the Full Viewer [:ref:`RenderWeb002`] ) and paste them. 

   - in the Full Viewer of another image. 
   - in tree, using right-click menu [:ref:`RenderWeb003`].
   - in Preview pane of another image.
   - do all 3 Paste actions also on Plate (in tree) and on single Wells in Plate (Full Viewer & Preview).
   - |C| that the Rendering settings were updated after Paste in all cases.

#. Reset imported settings - use the ``Set Imported and Save`` button in the right-clcik context menu, Full Viewer (click on ``Edit`` link first) and Preview.

   - |C| that thumbnail(s) in the central pane is (are) updated.
   - |C| that when you select Plate Run and in context menu select ``Set Imported and Save``, no error occurs.

#. Set min/max settings in Preview and Full Viewer. Press ``Save`` in both cases and

   - |C| that thumbnails in the central pane are updated.

#. Set owner's settings [:ref:`RenderWeb005`] in right-click menu. Perform also on whole Dataset.

   - |C| that thumbnails in the central pane are updated.

#. Make sure you have images in "Orphaned Images" folder (get them via CLI import or do Cut command).


 
 
Other users' data
=================

#. Other users' data - basic.

   - Open an image belonging to another user.
   - Modify the settings in the “Preview” pane or click ``Edit`` in the Full Viewer to modify settings. Save your own setting using the ``Save`` button [:ref:`Render007`].
   - |C| that thumbnails in the central pane are updated.
   - Use ``Save to all`` button.
   - |C| that all thumbnails in a Dataset or all wells in a Plate Run are updated.



#. Other users' data - Owner's settings.

   - Import at least 2 multi-t and multi-z images as a user (e.g. user-4) in Read-Only group.
   - Go to the imported images and modify the Rendering settings in such a way that you can recognize these settings easily later.
   - Log out and Log in as an Owner of Read-Only group (e.g. user-3). 
   - View the images you just imported as another user (e.g. user-3 viewing user-4's images).

     - |C| that, still as a default you can see the Rendering settings you just saved as the owner of the image (for example user-4).
     - |C| that when you change Rendering settings and click ``Save`` in Preview pane, your own settings appear in the list under ``User Settings``.
     - Change Rendering settings and click ``Save to All`` in Preview pane, followed by clicking ``Imported`` in Preview pane and again ``Save to All``.
     - |C| that the thumbnail in the centre pane, the viewer in Preview, the thumbnail in User Settings and the image in the Full Viewer still match. 
     - |C| that under ``Preview > User Settings`` the settings of the owner are hightlighted blue. 

#. Repeat step 2, this time in Read-Annotate and Read-Write groups (note that you do not have to be Owner in these groups to save your own settings on other's images). 

#. Import images as a user (e.g. user-4) in Read-Only group and modify Rendering settings in easily recognizable manner. Log out, Log in to Web as an Administrator (e.g. user-6), which is **NOT** an Owner of Read-Only group and view the images you just imported. 

   - |C| that you can see the Rendering settings you just saved as the owner of the image as a default.
   - |C| that when you can change the settings (still in Web) and Save the new settings, the thumbnail, the Preview and the Full Viewer match and they have the newly created and saved settings. 
   - Click ``Set Imported and Save`` in Web and go to Insight, logging in as the owner of the image - |C| that you have your settings as well as the Admins settings (= the Rendering settings of the image owner have not been deleted or overwritten by the actions of the Admin in Web.
   - |C| that under ``Preview > User Settings`` the settings of the owner are hightlighted blue. 
    




|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _RenderWeb002:
.. figure:: images/testing_scenarios/Render/Web002.png
   :align: center

   RenderWeb002:


|
|
|
|

|
|
|
|
|

|
|
|
|
|
|
|
|
|
|
|


.. _RenderWeb003:
.. figure:: images/testing_scenarios/Render/Web003.png
   :align: center

   RenderWeb003:


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _RenderWeb004:
.. figure:: images/testing_scenarios/Render/Web004.png
   :align: center

   RenderWeb004


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _RenderWeb004b:
.. figure:: images/testing_scenarios/Render/Web004b.png
   :align: center

   RenderWeb004b


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _Render005:
.. figure:: images/testing_scenarios/Render/005.png
   :align: center

   Render005


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _RenderWeb005:
.. figure:: images/testing_scenarios/Render/Web005.png
   :align: center

   RenderWeb005


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _Render007:
.. figure:: images/testing_scenarios/Render/007.png
   :align: center

   Render007: 


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


