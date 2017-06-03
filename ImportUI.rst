Import (UI)
===========



**To test in**: Insight

**Purpose of the test** is to check all the features of Importer UI as started from Insight

Find suitable images here [:download:`TestingSet </downloads/ImportTestingSetTable.pdf>`] or here [:download:`TestingTemplate </downloads/ImportTestingTemplate.pdf>`]

NB: **Data Manager** == **The main window of Insight UI**

#. Select single image files

   - Add them to the queue by pressing the ">" control.
   - Select "New From Folder" option [:ref:`ImportUI001`] when choosing where to import the images.
   - |C| that a new Dataset will be created with the name of the folder.
   - |C| that the icon of the Dataset (right-hand side of the Import window) is light blue, not plum color as for Project [:ref:`ImportUI002`]
   - Click import.
   - Go to the Data Manager (=Main Insight UI window).
 
     - |C| that the wheel in the toolbar is spinning when import in progress [:ref:`ImportUI004b`]
     - |C| that the number next to green tick is incremented when an import is finished successfully.

   - Still in the Data Manager (left-hand side), hit the refresh button
     - |C| that only one dataset is created. [:ref:`ImportUI003`]


#. After any finished import in this scenario, in the Importer Window (perform these checks briefly for each import but for one import of your choice thoroughly):

   - |C| that thumbnail(s) is(are) created - should always be the case in OMERO 5. Note that in OMERO 4 the thumbs show in Importer only if the [:ref:`ImportUI012`] has been ticked.
   - (OMERO 4 only) |C| that when you hover over thumbnail(s), a larger thumbnail view pops up [:ref:`ImportUI012b`].
   - |C| that clicking on the thumbnail(s) opens the image in Viewer. In case of a multi-image file [:ref:`ImportUI013b`], click on every thumbnail in the row.
   - |C| the ``View`` menu: [:ref:`ImportUI013c`].

     - |C| that the ``In Full Viewer`` item opens the image in viewer
     - |C| that the ``In Data Browser`` item brings you to the image in data tree in Data Manager
     - |C| that the ``View Import Log`` item shows the Log file [:ref:`ImportUI013f`]
     
       - |C| that the Log file is not truncated, i.e. it ends with line like ``2014-05-05 08:55:07,349 INFO o.s.blitz.repo.ManagedImportRequestI Finalizing log file.``

     - (OMERO 5 only) |C| that the ``Checksum`` item opens the checksum popup [:ref:`ImportUI013d`, :ref:`ImportUI013e`] 

#. Import the folder 
   ``data_repo/test_images_broken/broken_images_scenario/`` into a non-
   default group (you have to switch the group actively) and after it 
   failed, go Failed > View Exception. |C| that the exception window 
   appears.


#. Repeat step 1 this time selecting a whole folder to import. [:ref:`ImportUI004`].

   - |C| that the counter in the toolbar of Data Manager (right-hand side) counts the imported files correctly [:ref:`ImportUI004b`].

   - |C| that only one dataset was created for the imported folder.
   - Import another folder and again check that just one dataset was created and no duplicate imports or re-imports of the previous folder occurred.

#. Repeat step 1 this time not selecting "New From Folder" but creating a new Project and Dataset at the import stage [:ref:`ImportUI004c`, :ref:`ImportUI004d`].


#. Import more than 2000 files (for example a whole folder containing 2001 files).

   - |C| that the import does not proceed.
   - |C| that you get a dialog [:ref:`ImportUI004e`]

#. Start several parallel image imports, then randomly switch between the import tabs.

   - |C| that imports proceed smoothly to the end.


#. De-duplication of import: Make sure you can import in two different groups. 
   Select any file, put it to the queue. 

   - |C| that if you select the same file again, and add it to the queue (in 
     **the same group**), the new addition **will be ignored**
   - |C| that when you select the same file again and select **another target   
     group** in the Import Location window, the file **will be added** to the queue.

#. De-duplication of import in case of a Companion File: Select a dv image like ``data_repo/test_images_good/dv/CFPNEAT01_R3D.dv`` and its log file, (``data_repo/test_images_good/dv/CFPNEAT01_R3D.dv.log``).

   - add both files to the import queue
   - click import
   - |C| that you get a message indicating that the log file is a duplicate,    
     meaning that this file has been already imported in this transaction
   - |C| that the import of the duplicate does not proceed (in this 
     transaction)
   - |C| that the counter in the Toolbar of the Data Manager is not 
     counting the skipped files as ``Imported``
   - |C| the Companion File:
      
     - Go to the Data Manager, right-hand pane, Acquisition tab
     - |C| that the first harmonica tab is ``Companion files`` (NOT ``Original Metadata``)
     - Expand the ``Companion file`` harmonica tab and check the file is there

#. (OMERO 5 only) Upload.

   - import several images in one transaction, making sure you have images with long ``processing`` times, for example ``data_repo/test_images_good/leica-lif/free edge 6.lif`` or other ``.lif`` files
   - |C| that the import of the files in the queue starts immediately after the upload of the previous file is finished
   - |C| that the size in the header of the importer window changes after each import

#. Cancelling: 
   
   - Cancel a single running import using the ``Cancel`` button.
   - |C| that only this particular import has been cancelled
   - (OMERO 5 only) Cancel all imports using the ``Cancel All`` button
   - |C| that all the imports where the upload did not start yet are cancelled
   - |C| that after everything is imported or cancelled the spinners stop both 
     in Importer and Data Manager.

#. Cancelling during scanning phase & large MIF import

   - |C| that after you Cancel and Cancel All successfully during ``scanning`` 
     phase when importing a whole folder (for example 
     ``data_repo/public/HCS/INCELL2000/``) spinners have stopped & 
     Insight can Quit normally.

   - |C| that when importing multi-images-fileset (MIF) 
     ``test_images_good/lei/050118.lei`` you can Cancel both during   
     ``scanning`` and ``preparing upload`` phases

#. Tag at import (for permissions testing, tag with tags belonging to other users)

   - One new tag addition:

     - Select at least two images.
     - Go to the "options" tab. The second tab when selecting the import location.[:ref:`ImportUI005`]
     - Create one new tag and add it 
     - Import images.

   - One existing tag addition

     - Select at least two images.
     - Go to the "options" tab. 
     - Add one existing tag.[:ref:`ImportUI009`]
     - Import images.

   - Two new tags addition:

     - Select at least two images.
     - Go to the "options" tab. 
     - Create two or more tags and add them
     - Import images.

   - Two existing tags addition:

     - Select at least two images.
     - Go to the "options" tab. 
     - Add two or more existing tags.
     - Import all the images you tagged.

   - Go to the DataManager (left-hand side). Refresh
   - |C| that the images are tagged and the tag is shown on thumbnails [:ref:`ImportUI006`][:ref:`ImportUI007`]
   - |C| and the tag is created once. [:ref:`ImportUI008`]
   - |C| that no new tag is created with the name of an existing tag.


#. In the Location dialog, press the Screen button [:ref:`ImportUI011`]

#. Import a Plate e.g. ``test_images_good/bd-pathway/2009-05-01_000/`` 

   - not creating new Screen at import stage [:ref:`ImportUI011b`]
   - creating a new Screen to import the plate to at import stage [:ref:`ImportUI011c`]




#. (OMERO 5 only) Error reporting in all import stages.

   - Failure at scanning stage: Import ``test_images_bad/Mike.dv`` and 

     - |C| that

       - you can submit the failure. There will be no log, but you should be able to submit the files (as .zip) and exceptions. The exception can also be viewed in a separate item under "Failed" menu.
       - you can Retry All (button at the bottom of the Importer)

   
   - Failure of checksums: Test on a dedicated server (e.g. a server with recompiled server code in a way which causes checksum failure).

     - |C| that

       - you can submit the failure. There will be no log, but you should be able to submit the files (as .zip) and exceptions.

   - Failure at processing stage: Import ``test_images_broken/volocity/3 Colour.acff`` and ``data_repo/test_images_broken/broken_images_scenario/``

     - |C| that

       - you can submit the .zip, consisting of the file AND log
       - you can submit the exceptions

     - Import the folder ``data_repo/test_images_broken/broken_images_scenario/`` into a non-default group (you have to switch the group actively) and after it failed, go Failed > View Exception 

       - |C| that the Exception appears.

#. Error submission process: Import an image that will fail to import e.g. ``data_repo/test_images_bad/mike1_R3D.dv`` [:ref:`ImportUI014`]

   - |C| that you can view the error.[:ref:`ImportUI015`]
   - Submit the error to the QA system using "Submit Failures" button in the right bottom corner [:ref:`ImportUI015b`]. 
   - Enter a valid e-mail address [:ref:`ImportUI016`]
   - |C| that you received a notification e-mail.
   - |C| that your email address, error message, and file links are all included on the QA webpage.
   - Send a reply comment to the QA webpage, include your email address and a message.
   - Log into the QA system as an administrator and confirm the comment was received.
   - Reply to the QA message, the message should appear in your email.
   - Finally, set the QA message status to "Closed" and save.


	.. _ImportUI001:
	.. figure:: /images/testing_scenarios/ImportUI/001.png
	   :align: center
	   :width: 100%

	   ImportUI001 


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportUI002:
	.. figure:: /images/testing_scenarios/ImportUI/002.png
	   :align: center

	   ImportUI002


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportUI003:
	.. figure:: /images/testing_scenarios/ImportUI/003.png
	   :align: center

	   ImportUI003


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportUI004:
	.. figure:: /images/testing_scenarios/ImportUI/004.png
	   :align: center
	   :width: 100%

	   ImportUI004


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportUI004b:
	.. figure:: /images/testing_scenarios/ImportUI/004b.png
	   :align: center
	   :width: 100%

	   ImportUI004b


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportUI004c:
	.. figure:: /images/testing_scenarios/ImportUI/004c.png
	   :align: center
	   :width: 100%

	   ImportUI004c


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportUI004d:
	.. figure:: /images/testing_scenarios/ImportUI/004d.png
	   :align: center
	   :width: 100%

	   ImportUI004d


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportUI004e:
	.. figure:: /images/testing_scenarios/ImportUI/004e.png
	   :align: center
	   :width: 100%

	   ImportUI004e


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportUI005:
	.. figure:: /images/testing_scenarios/ImportUI/005.png
	   :align: center

	   ImportUI005


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportUI006:
	.. figure:: /images/testing_scenarios/ImportUI/006.png
	   :align: center

	   ImportUI006 


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportUI007:
	.. figure:: /images/testing_scenarios/ImportUI/007.png
	   :align: center

	   ImportUI007


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportUI008:
	.. figure:: /images/testing_scenarios/ImportUI/008.png
	   :align: center

	   ImportUI008


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportUI009:
	.. figure:: /images/testing_scenarios/ImportUI/009.png
	   :align: center

	   ImportUI009 


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportUI011:
	.. figure:: /images/testing_scenarios/ImportUI/011.png
	   :align: center

	   ImportUI011


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportUI011b:
	.. figure:: /images/testing_scenarios/ImportUI/011b.png
	   :align: center

	   ImportUI011b


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportUI011c:
	.. figure:: /images/testing_scenarios/ImportUI/011c.png
	   :align: center

	   ImportUI011c


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportUI012:
	.. figure:: /images/testing_scenarios/ImportUI/012.png
	   :align: center

	   Tickbox for thumbs


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportUI012b:
	.. figure:: /images/testing_scenarios/ImportUI/012b.png
	   :align: center

	   ImportUI012b


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportUI013:
	.. figure:: /images/testing_scenarios/ImportUI/013.png
	   :align: center

	   ImportUI013


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportUI013b:
	.. figure:: /images/testing_scenarios/ImportUI/013b.png
	   :align: center

	   ImportUI013b


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportUI013c:
	.. figure:: /images/testing_scenarios/ImportUI/013c.png
	   :align: center

	   ImportUI013c


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportUI014:
	.. figure:: /images/testing_scenarios/ImportUI/014.png
	   :align: center

	   ImportUI014 


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportUI015:
	.. figure:: /images/testing_scenarios/ImportUI/015.png
	   :align: center

	   ImportUI015


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportUI015b:
	.. figure:: /images/testing_scenarios/ImportUI/015b.png
	   :align: center

	   ImportUI015b


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportUI016:
	.. figure:: /images/testing_scenarios/ImportUI/016.png
	   :align: center

	   ImportUI016
	
	
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportUI013d:
	.. figure:: /images/testing_scenarios/ImportUI/013d.png
	   :align: center

	   ImportUI013d

	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportUI013e:
	.. figure:: /images/testing_scenarios/ImportUI/013e.png
	   :align: center

	   ImportUI013e

	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportUI013f:
	.. figure:: /images/testing_scenarios/ImportUI/013f.png
	   :align: center

	   ImportUI013f

	|
	|
	|
	|


