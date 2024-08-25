FS Import (UI)
==============



``Test in``: Insight

``Purpose``: Check all the features of Importer UI as started from Insight


**Compare the speed of the workflow on the same images on FS-demo build vs non-FS build (the most recent non-FS release).** 

#. Select single image files

   - Add them to the queue by pressing the ">" control.
   - Select "New From Folder" option [:ref:`FSImportUI001`] when choosing where to import the images.
   - |C| that a new Dataset will be created with the name of the folder.
   - |C| that the icon of the Dataset (right-hand side of the Import window) is light blue, not plum color as for Project [:ref:`FSImportUI002`]
   - Click import.
   - Go to the DataManager.
 
     - |C| that the wheel in the toolbar is spinning while there are imports in progress [:ref:`FSImportUI004b`]
     - |C| that the number next to green tick is incremented when an import is finished successfully.

   - Still in Data Manager (left-hand side), hit the refresh button
     - |C| that only one dataset is created. [:ref:`FSImportUI003`]

#. Repeat (1) this time selecting a whole folder to import. [:ref:`FSImportUI004`].

   - |C| that the counter in toolbar of Data Manager (right-hand side) counts the imported files correctly [:ref:`FSImportUI004b`].

   - |C| that only one dataset was created for the imported folder.
   - Import again another folder and check that again just one dataset was created and no duplicate imports or re-imports of the previous folder occurred.

#. Repeat (1) this time not selecting "New From Folder" but creating a new Project and Dataset at import stage [:ref:`FSImportUI004c`, :ref:`FSImportUI004d`].

#. Duplicate and Companion File: Select a dv image and its log file

   - Add both files to the import queue
   - Click import
   - |C| that you get a message indicating that the log file is a duplicate, i.e. that this file has been already imported in this transaction
   - |C| that the import of the duplicate does not proceed (in this transaction)
   - |C| that the counter in the Toolbar of the Data Manager is not counting the skipped files as ``Imported``
   - |C| the Companion File:
      
     - Go to Data Manager, right-hand pane, Acquisition tab
     - |C| that the first harmonica tab is ``Companion file`` (NOT ``Original Metadata``)
     - Expand the ``Companion file`` harmonica tab and check the file is there

#. Upload.

   - import several images in one transaction, making sure you have images with long ``processing`` times, for example ``.lif`` files
   - |C| that the import of the files in the queue starts immediately after the upload of the previous file is finished
   - |C| that the size in the header of the importer window changes after each import

#. Cancelling: 
   
   - Cancel a single running import using ``Cancel`` button.
   - |C| that only this particular import has been cancelled
   - Cancel all imports using ``Cancel All`` button
   - |C| that you get warning popup.
   - Click ``Yes`` in the popup. 
   - |C| that all the imports where the upload did not start yet are cancelled
   - |C| that after everything is imported or cancelled the spinners stop both in Importer and Data Manager.
   - Repeat step 6 when importing a whole folder

#. Tag at import (for permissions testing, tag with tags belonging to other users)

   - Select at least 2 images.
   - Go to the "options" tab (the second tab when selecting the import location).[:ref:`FSImportUI005`]
   - Create a new tag
   - Import the images.
   - Go to the DataManager (left-hand side). Refresh
   - |C| that the images are tagged and the tag is shown on thumbnails [:ref:`FSImportUI006`][:ref:`FSImportUI007`]
   - |C| and the tag is created once. [:ref:`FSImportUI008`]

#. Repeat (3) and this time (for permissions testing, tag with tags belonging to other users)

   - Create a new tag and add an existing tag.[:ref:`FSImportUI009`]
   - Import the images
   - Go to the DataManager (left-hand side). Refresh,
   - |C| that the images are tagged and the tag is shown on thumbnails
   - |C| that the tag is created once
   - |C| that no new tag is created with the name of an existing tag.

#. In the Location dialog, press the Screen button [:ref:`FSImportUI011`]

#. Import a Plate

   - not Creating new Screen at import stage [:ref:`FSImportUI011b`]
   - Creating a new Screen to import the plate to at import stage [:ref:`FSImportUI011c`]



#. When the import is done, 

   |C|:
   
   - in the Importer window:

     - the thumbnail(s) have been created [:ref:`FSImportUI012`].
     - when you hover over thumbnail(s), a larger thumbnail view pops up [:ref:`FSImportUI012b`].
     - clicking on the thumbnail(s) opens the image in Viewer. In case of a multi-image file [:ref:`FSImportUI013b`], Click on every thumbnail in the row.

   - in the ``View`` menu in Importer window: [:ref:`FSImportUI013c`].

     - the ``In Full Viewer`` item opens the image in viewer
     - the ``In Data Browser`` item brings you to the image in data tree in Data Manager
     - the ``View Import Log`` item shows the Log file [:ref:`FSImportUI013d`, :ref:`FSImportUI013e`]
     - the ``Checksum`` item opens the checksum popup [:ref:`FSImportUI013f`]

#. Import a folder with an image which will fail into a non-default group (you have to switch the group actively) and after it failed

   |C|: 
     
     - the import log appears after you go ``Failed > View Import Log``.
     - the ``Checksum`` item opens the checksum popup [:ref:`FSImportUI013f`]







	.. _FSImportUI001:
	.. figure:: images/testing_scenarios/ImportUI/001.png
	   :align: center
	   :width: 100%

	   ImportUI001 




	.. _FSImportUI002:
	.. figure:: images/testing_scenarios/ImportUI/002.png
	   :align: center

	   ImportUI002




	.. _FSImportUI003:
	.. figure:: images/testing_scenarios/ImportUI/003.png
	   :align: center

	   ImportUI003




	.. _FSImportUI004:
	.. figure:: images/testing_scenarios/ImportUI/004.png
	   :align: center
	   :width: 100%

	   ImportUI004




	.. _FSImportUI004b:
	.. figure:: images/testing_scenarios/ImportUI/004b.png
	   :align: center
	   :width: 100%

	   ImportUI004b




	.. _FSImportUI004c:
	.. figure:: images/testing_scenarios/ImportUI/004c.png
	   :align: center
	   :width: 100%

	   ImportUI004c



	.. _FSImportUI004d:
	.. figure:: images/testing_scenarios/ImportUI/004d.png
	   :align: center
	   :width: 100%

	   ImportUI004d



	.. _FSImportUI005:
	.. figure:: images/testing_scenarios/ImportUI/005.png
	   :align: center

	   ImportUI005


	.. _FSImportUI006:
	.. figure:: images/testing_scenarios/ImportUI/006.png
	   :align: center

	   ImportUI006 


	.. _FSImportUI007:
	.. figure:: images/testing_scenarios/ImportUI/007.png
	   :align: center

	   ImportUI007



	.. _FSImportUI008:
	.. figure:: images/testing_scenarios/ImportUI/008.png
	   :align: center

	   ImportUI008



	.. _FSImportUI009:
	.. figure:: images/testing_scenarios/ImportUI/009.png
	   :align: center

	   ImportUI009 

	.. _FSImportUI011:
	.. figure:: images/testing_scenarios/ImportUI/011.png
	   :align: center

	   ImportUI011


	.. _FSImportUI011b:
	.. figure:: images/testing_scenarios/ImportUI/011b.png
	   :align: center

	   ImportUI011b



	.. _FSImportUI011c:
	.. figure:: images/testing_scenarios/ImportUI/011c.png
	   :align: center

	   ImportUI011c



	.. _FSImportUI012:
	.. figure:: images/testing_scenarios/ImportUI/012.png
	   :align: center

	   ImportUI012



	.. _FSImportUI012b:
	.. figure:: images/testing_scenarios/ImportUI/012b.png
	   :align: center

	   ImportUI012b


	.. _FSImportUI013:
	.. figure:: images/testing_scenarios/ImportUI/013.png
	   :align: center

	   ImportUI013


	.. _FSImportUI013b:
	.. figure:: images/testing_scenarios/ImportUI/013b.png
	   :align: center

	   ImportUI013b




	.. _FSImportUI013c:
	.. figure:: images/testing_scenarios/ImportUI/013c.png
	   :align: center

	   ImportUI013c


	 

	.. _FSImportUI013d:
	.. figure:: images/testing_scenarios/ImportUI/013d.png
	   :align: center

	   ImportUI013d



	.. _FSImportUI013e:
	.. figure:: images/testing_scenarios/ImportUI/013e.png
	   :align: center

	   ImportUI013e


	.. _FSImportUI013f:
	.. figure:: images/testing_scenarios/ImportUI/013f.png
	   :align: center

	   ImportUI013f


