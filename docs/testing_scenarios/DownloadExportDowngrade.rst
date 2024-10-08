.. contents::
   :depth: 2


#########################
Download/Export/Downgrade
#########################



**To test in**: Web, Insight

**Purpose of the test** is to check the Download, Export and Downgrade features and the downloaded files - depending on whether archived image was created at import and whether this was an OMERO 5 import or OMERO 4 import.

Note: if several images have to be downloaded a zip will be created (Web and Insight) - this might take couple of seconds with no warning.



Download non-image files (both in OMERO 5 and OMERO 4)
======================================================

**To test in**: Web, Insight

    - Import an image with a companion file e.g. ``data_repo/test_images_good/dv/CFPNEAT01_R3D.dv`` (or see column "Extra information" in [:download:`here <downloads/ImportTestingSetTable.pdf>`])

    - Select the image, go to the right-hand panel, Acquisition tab, Companion files, and (Insight only) left-click on icon to the right of the filename to see a menu.

    - |C| that you can see Info [:ref:`DownloadED001`][:ref:`DownloadED002`]and View the file 

    - Download the Companion file [:ref:`DownloadED003`][:ref:`DownloadED004`] - open downloaded file in text editor,
    - |C| that the size is not zero.[:ref:`DownloadED005`]

    - Download the metadata file created by OMERO i.e. ``original_metadata.txt`` [:download:`original_metadata.txt <downloads/Export_Downgrade_original_metadata.txt>`] (Web only - Acquisition tab) [:ref:`DownloadED007`].

    - Download the original metadata file using the menu item under the icon above right-hand pane (Insight only) [:ref:`DownloadED007b`].

    - |C| the downloaded file [:download:`008 <downloads/Export_Downgrade_008.txt>`].

    - Download the companion files as well as original metadata both into your home directory as well as to your Desktop.


OMERO 4 Download/Export images
==============================

**To test in**: Web, Insight

    - Import an image - tick the "Archive" option after putting it into the Queue [:ref:`DownloadED009`] (Insight only)

    - When the import is finished, select the image

    - Go to the right-hand panel General tab,

         - |C| that you see the image is shown as ``Archived`` in Insight [:ref:`DownloadED010a`].
         - in Insight, press the Saving icon (2nd from right) and choose Download.[:ref:`DownloadED010b`].
         - in Web click on the arrow in General tab [:ref:`DownloadED011`].
         - Download both into your home directory as well as to your Desktop.
         - |C| that the image has correctly been downloaded [:ref:`DownloadED012`].
         - Re-import the image: import in Insight, but check in Web as well.
         - |C| Compare the image originally imported and the re-imported image (check also the metadata) [:ref:`DownloadED013`].

    - Import an image composed of several files, e.g. `test_images_good/lei/leica-original/050118.lei` - tick the "Archive" option after putting it into the Queue [:ref:`DownloadED009`] (Insight only).

         - Select the download option on the right-hand side.
         - Download the image - a zip will be created [:ref:`DownloadED013b`].
         - Download both into your home directory as well as to your Desktop.
         - |C| that the image has been downloaded correctly [:ref:`DownloadED013c`].
         - Re-import the image: import in Insight, but check in Web as well.
         - Compare the image originally imported and the re-imported image (check also the metadata).


    - Now Select an image which had the "Archive" option off at import. If not sure, re-import an image with the "Archive" option off.
         - |C| that you see the image is not shown as ``Archived`` in Insight [:ref:`DownloadED013d`].
         - |C| that the Download option is not available neither in Insight (greyed out) [:ref:`DownloadED013e`] nor Web (menu item missing) [:ref:`DownloadED013f`].


OMERO 5 Download/Export images (perform on OMERO 5 server with OMERO 5 imported data only database)
===================================================================================================

**To test in**: Web, Insight

    - OMERO 5-Single image

         - Import an image
         - Select the download option on the right-hand side [:ref:`DownloadED010b`, :ref:`FSDownloadED011`]
         - Download the image both into your home directory as well as to your Desktop.
         - |C| that the image has been correctly downloaded [:ref:`DownloadED012`]
         - Re-import the image.(import in Insight, but check in Web as well)
         - Compare the image originally imported and the re-imported image (check also the metadata) [:ref:`DownloadED013`].

    - OMERO 5-multi-image - repeat the "OMERO 5-Single image" step importing a multi-image file (e.g. `test_images_good/lei/leica-original/050118.lei`).
        
         - |C| that the whole multi-image fileset (MIF) has been downloaded. See [:ref:`DownloadED013p`]. 



Mixed OMERO 5 imported & OMERO 4 imported images Download/Export (this is to be performed on OMERO 5 server with a database consisting of OMERO 5 as well as OMERO 4 imported images)
===============================================================================================================================================================================================================

**To test in**: Web, Insight

         - Choosing images imported using OMERO 4 and skipping importing, go through
           the "18.2 OMERO 4 Download/Export images:" step. The images have to have
           been Archived during OMERO 4 import, look for example for Datasets like
           ``archivedv``.
         - Go through the "18.3 OMERO 5 Download/Export images" step.



Downgrade
=========

**To test in**: Web, Insight

When performing the following steps, export both into your home directory as well as to your Desktop.

    - Select an image and go to the right-hand panel.
    - Export the image as JPEG (Web & Insight) [:ref:`DownloadED016`, :ref:`DownloadED017`], PNG (Insight only), TIFF (Insight only) 

         - |C| the result

    - Export the image as OME-TIFF [:ref:`DownloadED017b`, :ref:`DownloadED017c`]

         - for Web, just export and check the file - for Insight, see below
         - (Insight only) |C| that when you select a single big image or select couple of images which consist of big and small images, the ``Export as OME-TIFF`` option is greyed out
         - Export using the current schema:[:ref:`DownloadED018`] (Insight only)

         - |C| the exported file,
         - |C| Open the file
         - |C| the XML section the schema version should indicate the latest version e.g. 2012..[:ref:`DownloadED019`].-Do it from command line [tiffinfo command from libtiff library - download tiffinfo using Homebrew][:ref:`DownloadED020`]

    - Export using an older schema:(Insight only)

         - |C| the exported file
         - |C| Open the file
         - |C| the XML section, the schema version should match the selected schema.[:ref:`DownloadED021`] - Check from command line using tiffinfo
    - Re-Import the exported files
    - (OME-TIFF only) |C| that the re-import does not take longer than the import of the original file from which the ome-tiff was generated.



Command line download
=====================

#. Go to the command line, ``cd`` to your downloaded server and connect to the testing server (e.g. gretzky). and try to download files using following commands.

    - ``bin/omero download file_id target``
    - ``bin/omero download OriginalFile:file_id target``
    - ``bin/omero download FileAnnotation:fa_id target``
    - ``bin/omero download Image:image_id target``

  - Using these commands, download

    - Multi-image filesets (MIFs), for example ``lei``
    - Archived pre-OMERO 5 images (look for example for Datasets like ``archivedv``).
    - OMERO 5 imported images
    - Original files/Companion files (of for example ``.dv`` files)
    - File annotations 
    - |C| that the files are downloaded in the ``target`` file after each command.



	.. _DownloadED001:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/001.png
	   :align: center

	   DownloadED001: 


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _DownloadED002:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/002.png
	   :align: center

	   DownloadED002:


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _DownloadED003:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/003.png
	   :align: center
	   :width: 100%

	   DownloadED003


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _DownloadED004:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/004.png
	   :align: center

	   DownloadED004


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _DownloadED005:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/005.png
	   :align: center

	   DownloadED005


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _DownloadED007:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/007.png
	   :align: center

	   DownloadED007:


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _DownloadED007b:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/007b.png
	   :align: center

	   DownloadED007b:


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _DownloadED009:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/009.png
	   :align: center

	   DownloadED009: 


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _DownloadED010:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/010.png
	   :align: center

	   DownloadED010:


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _DownloadED010a:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/010a.png
	   :align: center

	   DownloadED010a:


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _DownloadED010b:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/010b.png
	   :align: center

	   DownloadED010b:


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _DownloadED011:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/011.png
	   :align: center

	   DownloadED011


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _FSDownloadED011:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/FS011.png
	   :align: center

	   FSDownloadED011


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _DownloadED012:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/012.png
	   :align: center

	   DownloadED012


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _DownloadED013:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/013.png
	   :align: center

	   DownloadED013


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _DownloadED013b:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/013b.png
	   :align: center

	   DownloadED013b


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _DownloadED013c:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/013c.png
	   :align: center

	   the screenshot shows the expected situation after 1st image of the 56 images of the ``050118.lei`` set was selected & downloaded


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _DownloadED013d:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/013d.png
	   :align: center

	   DownloadED013d


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _DownloadED013e:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/013e.png
	   :align: center

	   DownloadED013e


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|	
	|


	.. _DownloadED013f:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/013f.png
	   :align: center

	   DownloadED013f


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|	
	|


	.. _DownloadED013p:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/013p.png
	   :align: center

	   example of `test_images_good/lei/leica-original/050118.lei` when 1st image only was selected.


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _DownloadED014:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/014.png
	   :align: center

	   DownloadED014: 


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _DownloadED015:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/015.png
	   :align: center

	   DownloadED015:


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _DownloadED016:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/016.png
	   :align: center

	   DownloadED016


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _DownloadED017:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/017.png
	   :align: center

	   DownloadED017: 


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _DownloadED017b:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/017b.png
	   :align: center

	   DownloadED017b: 


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _DownloadED017c:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/017c.png
	   :align: center

	   DownloadED017c: 


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|

	.. _DownloadED018:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/018.png
	   :align: center

	   DownloadED018:


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _DownloadED019:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/019.png
	   :align: center
	   :width: 100%

	   DownloadED019


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _DownloadED020:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/020.png
	   :align: center

	   DownloadED020


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _DownloadED021:
	.. figure:: images/testing_scenarios/DownloadExportDowngrade/021.png
	   :align: center
	   :width: 110%

	   DownloadED021
	
	
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|

