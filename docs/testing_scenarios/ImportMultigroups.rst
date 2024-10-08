Import and Multigroups
======================



**To test in**: Insight

**Purpose of the test** is to test the import of images into multiple groups and check the Import Queue behaviour in this case

#. Import the same image in 2 different groups. Find suitable images here [:download:`TestingSet <downloads/ImportTestingSetTable.pdf>`] or here [:download:`TestingTemplate <downloads/ImportTestingTemplate.pdf>`]

   - Open Importer window, select an image, click onto ">" to bring up the "Import Location" window 
   - Choose where to import the image in the first group [:ref:`ImportMultiGr000a`]
   - Do not change the selection of images, switch group and select where to import the image in the second group [:ref:`ImportMultiGr000b`].
   - Import the images
   - Go back to the Data Manager and add the 2 groups to the display if not already added. [:ref:`ImportMultiGr001`]
   - |C| Make sure that the image is in the correct location (in both groups). [:ref:`ImportMultiGr002`]
   - Go to Screens harmonica tab in the left-hand pane and repeat step 1 with plates (e.g. `test_images_good/flex/`).

#. "Import Location" window - group update

   - Open Importer window, select an image, click onto ">" to bring up the "Import Location" window 
   - Choose where to import the image in the first group [:ref:`ImportMultiGr000a`].
   - Close the "Import Location" window, leave the importer open and go to Data Manager, into the tree (left-hand pane) [:ref:`ImportMultiGr002`]
   - Expand a group (NOT the one you have previously selected in the "Import Location" window)
   - Select a user
   - Go back to the importer, click onto ">" and |C| that the group display matches your choice in Data Manager


#. Import queue

   - Select files to import and select the "New From folder" option[default option] in the location dialog.
   - Start the import
   - Start immediately (while the previous import is still not finished !) a new import with the same selected files .
   - In the location dialog, switch group and select "New From Folder", then add images to the queue and click "Import".
   - Go back to the Data Manager and add the 2 groups to the display if not already added.
   - |C| that the image is in the correct locations.


#. Remove group from display during import

   - Add few groups to the display.
   - Open the importer.
   - Import data in one of the groups displayed.
   - During the on-going import, remove the group you are importing to from the display.

     - |C| that the data are imported successfully and import finishes 
       without error. The only known limitation here is that 
       ocassionally (but not necessarily) there are black thumbnails in 
       the Importer after this workflow, see [:ref:`ImportMultiGr003`].

#. Double import


   - Import a plate (for example ``curated/mias/frans/siRNA...``, but it could be any other plate type, too)
   - While the previous import is still running, import another plate (for the same user, to the same group).
   - Test this double import several times, as the relevant bug here occurred randomly.

     - |C| that each plate in each import has been imported exactly once and each import ends successfully, with no unexpected plate duplications.



.. _ImportMultiGr000a:
.. figure:: images/testing_scenarios/ImportMultigroups/000a.png
   :align: center

   ImportMultiGr000a 


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _ImportMultiGr000b:
.. figure:: images/testing_scenarios/ImportMultigroups/000b.png
   :align: center

   ImportMultiGr000b 


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _ImportMultiGr001:
.. figure:: images/testing_scenarios/ImportMultigroups/001.png
   :align: center

   ImportMultiGr001: 


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _ImportMultiGr002:
.. figure:: images/testing_scenarios/ImportMultigroups/002.png
   :align: center

   Tree in left-hand pane:


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _ImportMultiGr003:
.. figure:: images/testing_scenarios/ImportMultigroups/003.png
   :align: center

   Known limitation - black thumbnails:


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


