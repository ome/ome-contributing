ROI Folders
===========



**To test in**: Insight

**Purpose of the test** is to check the ROI folders functionality in the Measurement Tool of Insight

#. Open an image in Full Viewer and open the Measurement Tool.
#. |C| that the Manager tab in the Measurement Tool shows only folders containing ROIs by default.

   - if there are no folders containing ROIs on the image, draw some ROIs and right-click [:ref:`ROIFolders005`] to add them to existing folders,
   - right-click [:ref:`ROIFolders000`] and create some empty folders,
   - close and reopen the image,
   - |C| the default loading of the folders i.e. only the folders containing ROIs on this particular image are loaded.

#. |C| that you can show or hide Folders in the Manager table using the dropdown menu ``Display ROI folders`` in top left corner (see screenshot [:ref:`ROIFolders001`]).

#. |C| the filtering typing in the text box to the right of the ``Display ROI folders`` menu (see screenshot [:ref:`ROIFolders002`]).

   - Where filtering query matches a child folder, its parent folder should be still visible, although the query might not match the parent. Sibling folders should be invisible if not matching the query.
   - Where filtering query matches a parent folder, all child folders should be visible too even if they do not match the query.

#. |C| the ``Show all ROI folders`` checkbox next to the filtering line (see screenshot [:ref:`ROIFolders002`]).

   - Type a string into the ``Filter ROI folders…`` text box that will give you some hits but also filter out some folders
   - Select the ``Show all ROI folders`` checkbox
   - The filtering will be disabled
   - |C| that all the folders which you have on display (i.e. all folders shown by default, if not hidden by you explicitly in step 3., and all folders you have added in step 3.) are visible in the table
   - Deselect the checkbox, the filtering should return to the state before the checkbox was selected

#. |C| that you can Create, Delete, Edit and Move folder (right-click menu)(see screenshot [:ref:`ROIFolders003`]).
#. |C| multiselection and right-click (i.e. that you can multiselect and get the right-click context menu to display with the multiselection still respected). 
#. |C| Drag and Drop of Folders and ROIs into and out of other folders works.
#. |C| the number in the bracket after the folder name shows the total number of children, both Folders and ROIs (see screenshot [:ref:`ROIFolders004`]).
#. |C| that you can add ROIs to folders imported in an xml header of an ome-tiff.
#. |C| visibility/non-visiblity behaviour for the folders:

   - have some ROIs in one folder only
   - deselect the checkbox ``Visible`` next to the folder (right hand side of the table) and |C| that the ROIs disappear from the image
   - have some ROIs in two or more folders (i.e. some ROIs having 2 or more parents)
   - deselect the checkbox ``Visible`` on only one parent folder and |C| that the ROIs are still visible in the image
   - deselect the checkbox on all the parent folders and |C| that the contained ROIs become invisible.


#. Delete a folder with subfolders and ROIs. |C| that the subfolders and the ROIs are orphaned, not deleted.
#. Using newly drawn or existing orphaned ROIs |C| all available right-click menu options work correctly: Add to Folder, Delete, Propagate, Duplicate, Merge, Split, Tag and Create Folder (see screenshot [:ref:`ROIFolders005`]).
#. Using ROIs which are in one or more folders |C| that the available right-click options work correctly: Remove from Folder, Add to Folder, Delete, Propagate, Duplicate, Merge, Split, Tag and Create Folder  (see screenshot [:ref:`ROIFolders006`]).
#. |C| that the selected ROI(s) are added in the new folder in case ``Create folder`` was executed.
#. |C| that a folder created by ``Create folder`` command is a child of the folder which was selected when the command was executed.
#. |C| the ``Create folder`` command is disabled when multiple folders are selected.
#. Select a Shape in a folder and |C| that the Inspector tab displays the name of its containing folder.


|
|
|


.. _ROIFolders000:
.. figure:: images/testing_scenarios/ROIFolders/000.png
   :align: center

   ROIFolders000: 


|
|
|
|
|


.. _ROIFolders001:
.. figure:: images/testing_scenarios/ROIFolders/001.png
   :align: center

   ROIFolders001: 


|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _ROIFolders002:
.. figure:: images/testing_scenarios/ROIFolders/002.png
   :align: center

   ROIFolders002: 


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _ROIFolders003:
.. figure:: images/testing_scenarios/ROIFolders/003.png
   :align: center

   ROIFolders003: 


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _ROIFolders004:
.. figure:: images/testing_scenarios/ROIFolders/004.png
   :align: center

   ROIFolders004: 


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _ROIFolders005:
.. figure:: images/testing_scenarios/ROIFolders/005.png
   :align: center

   ROIFolders005: 


|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _ROIFolders006:
.. figure:: images/testing_scenarios/ROIFolders/006.png
   :align: center

   ROIFolders006: 


|
|
|
|
|
|

