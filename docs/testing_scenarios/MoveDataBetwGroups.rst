Move Data between Groups
========================



**To test in**: Web, Insight

**Purpose of the test** is to check the feature of moving the entities between groups

#. Move Dataset/Image between groups.[:ref:`MoveData001`][:ref:`MoveData002`][:ref:`MoveData003`][:ref:`MoveData004`]

   - |C| that the Project/Dataset/Image Screen/Plate is no longer in the source group and has been moved to the target group. Put group to display if necessary-Insight [:ref:`MoveData005`]

#. Move a Project with Datasets and images

   - |C| that the Project / Dataset and images are in the target group.

#. Move Screen/Plate

   - Move a Screen with Plate
   - Move an orphaned Plate
   - |C| that the Screen/Plates are at the destination with all the ROIs/annotations as allowed by permissions, see the setup table for expected results

#. Move an Image (see here for choice of images [:download:`Images <downloads/ImportTestingSetTable.pdf>`])

   - rich in metadata 
   - with a ROI
   - with an annotation
   - large image
   - |C| that the image is at the destination with all the ROIs/annotations as allowed by permissions, see the setup table for expected results

#. Targeted / non-targeted Move:

   - Move a Dataset / image / plate and
 
     - target the Move into a Project / Dataset / Screen
 
       - |C| that the data are in the intended location

     - do not target the Move into a P/D/S

       - |C| that the data are in the target group as orphaned Datasets / Images / plates


 
#. (Insight only) Move via D&D 

   - Put at least 2 groups to display
   - Repeat steps 1, 2, 3 using Drag & Drop
   - |C| that you get the Move warning [:ref:`MoveData006`]
   - Click Yes in the warning window
   - |C| that the objects are in their destination group



#. Find a multi-image fileset (= MIF, should be imported for you, but if not, for example ``test_images_good/lei/leica-original/050118.lei`` or ``data_repo/test_images_metadata/leica-lif/Rosier.lif``). Choose one image of the MIF only and try to Move it.

   - NB: You cannot Move just a part of a MIF, you have to select the whole MIF or use "Move All" buton in order for the action to go through.
   - |C| that the action does not proceed and a warning popup appears [:ref:`MoveData007`, :ref:`MoveData008`]
   - Click Move All button in the warning popup
   - Select a Project and Dataset in the destination group to Move the Dataset to 
   - |C| that the action proceeds now and the images are Moved to the target group
   - |C| that in case the MIF was split between several Datasets in the original group, then 

     - in Web, all the images of the MIF end up in the selected Dataset in target group 
     - in Insight, the images of the MIF which were originally in the Dataset are in the selected Dataset, the other images are in Orphaned images [:ref:`MoveData009`]

#. Repeat previous step, this time not choosing any Project and Dataset to Move the MIF to

   - |C| that the MIF ends up in Orphaned folder in the target group


#. Choose all the images in the MIF and try to Move them.

   - |C| that this time the Move action proceeds successfully [:ref:`MoveData010`, :ref:`MoveData011`].
   - |C| that the MIF is in the destination group.


#. Create a new dataset (or use an existing one if available). Cut one of the images of the MIF and paste it into the newly created (or another existing) dataset. Select the original dataset (with all the MIF images minus one). Try to Move it.

   - |C| that the action does not proceed [:ref:`MoveData007`, :ref:`MoveData008`]
   - Click "Move All" button and 
   - choose a Project in the destination group to Move the Dataset to
   - |C| that the Dataset is in the destination group and

     - in Web, all the images of the MIF end up in the moved Dataset
     - in Insight, the images of the MIF which were originally in the Dataset are in the moved Dataset, the other images are in Orphaned images folder in the target group [:ref:`MoveData009`]

#. Repeat previous step, this time not choosing any Project to Move the Dataset to

   - |C| that the Dataset ends up as orphaned in the target group, with the images arranged as described in previous step

#. Cut and paste the image you manipulated in the step 10 back into the original dataset -> the MIF should now be complete. Select the dataset with the complete MIF and try to Move it.

   - |C| that this time the Move action proceeds successfully [:ref:`MoveData010`, :ref:`MoveData011`].





.. _MoveData001:
.. figure:: images/testing_scenarios/MoveData/001.png
   :align: center

   MoveData001: 


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _MoveData002:
.. figure:: images/testing_scenarios/MoveData/002.png
   :align: center

   MoveData002:


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _MoveData003:
.. figure:: images/testing_scenarios/MoveData/003.png
   :align: center

   MoveData003


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _MoveData004:
.. figure:: images/testing_scenarios/MoveData/004.png
   :align: center

   MoveData004


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _MoveData005:
.. figure:: images/testing_scenarios/MoveData/005.png
   :align: center

   MoveData005


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _MoveData006:
.. figure:: images/testing_scenarios/MoveData/006.png
   :align: center

   MoveData006: 


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _MoveData007:
.. figure:: images/testing_scenarios/MoveData/007.png
   :align: center

   MoveData007: 


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _MoveData008:
.. figure:: images/testing_scenarios/MoveData/008.png
   :align: center

   MoveData008: 


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _MoveData009:
.. figure:: images/testing_scenarios/MoveData/009.png
   :align: center

   MoveData009: 


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _MoveData010:
.. figure:: images/testing_scenarios/MoveData/010.png
   :align: center

   MoveData010: 


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _MoveData011:
.. figure:: images/testing_scenarios/MoveData/011.png
   :align: center

   MoveData011: 


|
|
|
|
|
|
|
|
|

