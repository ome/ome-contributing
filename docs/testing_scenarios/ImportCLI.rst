Import CLI
===========



**To test in**: Command line interface / Insight

**Purpose of the test** is to check the import of single, multiple images and multi-images file from command line. Also, to test In-place import and the Background import functionalities.


**Find suitable images here** [:download:`TestingSet </downloads/ImportTestingSetTable.pdf>`] or here [:download:`TestingTemplate </downloads/ImportTestingTemplate.pdf>`]

**Note that you have to download the right .zip server file (with the correct Ice version) to have the correct CLI-client for testing. You can use omego for this purpose, or download the .zip manually.**

**Note that you do not have to do CLI import on the OMERO server system you are importing into (no need to ssh into the server), as long as you do not do In-place import (steps 10 - 13 below).**

**Section 1: CLI Import**

#. Open Insight (UI), create a Dataset, note the Dataset ID

#. Go to Terminal. cd into the directory where your server runs. From there:

#. Log in onto the server you chose in step 1 as the user you chose in step 1. Import a single image without a companion file [:download:`001 </downloads/CLI_001.txt>`]

   - |C| that the file was imported using Insight UI [:ref:`ImportCLI002`]

#. Import several images in one transaction (a whole folder).[:download:`003 </downloads/CLI_003.txt>`]

   - |C| that the files were imported using Insight UI [:ref:`ImportCLI004`]

#. Import an image with a companion file e.g. ``data_repo/test_images_good/dv/CFPNEAT01_R3D.dv``, or see "Extra information" in [:download:`here </downloads/ImportTestingSetTable.pdf>`]

   - |C| that the file was imported and you can see the companion file.- Acquisition tab, Companion files [:ref:`ImportCLI005`]
   - |C| that you can download the companion file

#. Select a folder with a multi-images file (like ``test_images_good/lei``) [:download:`007 </downloads/CLI_007.txt>`][:ref:`ImportCLI006`]

   - |C| that you can see the imported images within the file

#. Try import into an existing dataset (use -d <datasetID> - use the dataset you created in step 1) - e.g. ``import -d 101 ~/Desktop/dv/CFPNEAT01_R3D.dv``
   
   - |C| the image has been imported into the right dataset

#. Import a nested folder containing Screen/Plate/Well files

#. Execute each of these commands twice, once with an image and once with a plate, replacing the ``<image_or_plate>`` with the file name of a valid image or plate. 

  - ``bin/omero import <image_or_plate> -n cli_short_name -x "cli short description"``
  - ``bin/omero import <image_or_plate> --name cli_long_name --description "cli long description"``

  - |C| that all images & plates were imported.
  - |C| that the names of the imported images/plates are as expected in each case
  - |C| that the descriptions of the imported images/plates are as expected in each case

**Section 2: Import As**

#. Import As. Log in "as Administrator" but for another user, executing the following command and replacing ``<admin>`` with a valid Administrator name and ``<user>`` with a valid username (this will be the user for which the Administrator will be importing for).

   - ``bin/omero login --sudo=<admin> <user>@localhost``

   - |C| that you are really logged in as ``<user>`` by executing

     - ``cat `bin/omero sessions file```
     - |C| that the output is

       - ``...``
       - ``omero.user=<user>``
       - ``omero.host=localhost``
       - ``omero.sudo=<admin>``

#. Execute following lines to import images as the ``<user>`` several
   times, varying the ``<group_name>`` in such a manner that you will 
   import into all 4 types of groups (Private, Read-Only, Read-Annotate, 
   Read-Write). Note that the ``<user>`` has to be a member of all the 
   groups into which the import is attempted and you have to be using 
   the session you just created in previous step (if the session 
   expires, repeat the step 1 in Section 2).

  - ``bin/omero sessions group <group_name>`` - the output of which should be similar to:

  ::

      Using session 5d7d8cd2-13e7-4a1d-988b-e65b02cf7f2f (user-8@localhost:4064). Current group: private-1
      Group 'private-1' (id=7) switched to 'read-only-1' (id=8)

  - ``bin/omero import <path/to/images>``
  - |C| that the images are displayed as owned by ``<user>`` in both Insight and Web. 


**Section 3: In-place import**

#. **Note that the In-place import works only on the data which are local to the server (the imported files might be remote, but must be mounted on your file system, for example under Volumes).**

#. Perform ``ssh`` command into the server you are going to test the In-place import to or start up your local server. Import a multi z/t image and a plate In-place. To understand better, read the doc :doc:`/investigations/2014/01/InPlace`. Do the In-place import using

   - hard link = ``--transfer=ln``
   - soft link = ``--transfer=ln_s``
   - ``--transfer=ln_rm`` (NEVER use ``ln_rm`` on ``ome/data_repo`` !!!)
   - |C| that the plate and image imported well in Insight and Web
   - |C| that when you perform ``ln_rm`` option across file systems (of the same machine) the original file is NOT deleted and the import does not proceed (``ln_rm`` proceeds only when operating within one file system)

#. Find the original of the image/plate you imported In-place using soft link and remove it. Try also removing individual images in plates. 

   - |C| that when you open the image or image in a plate now in Insight & Web you get reasonable message from the UI that image is not available.
   - |C| that when you return the original file you have removed at the start of this step to its original place, both Insight & Web will open the In-place imported image/plate with no problem (|C| also images in a plate)



#. On an In-place imported image, perform following actions: 
   
   - Projection (in Insight)
   - Download the original file (Insight & Web)
   - Move it to another group (Insight & Web)
   - |C| that the actions proceed without error.


#. Background importing: read the doc :doc:`In-place import </investigations/2014/01/InPlace>`, section ``Background importing`` to understand better.

   - Perform background import with all options mentioned in the doc.
   - |C| that the importer disconnected as expected and the images were imported okay.



**Section 4: Bulk import**

#. Prepare a ``filePaths.tsv`` file. This should be at least two columns where the first column can be the name of the target Dataset and the second is the path to the file to import. The columns are separated by Tab. For example:

  ::

      Dataset:name:Dataset-1  /Users/pwalczysko/Desktop/image1.png
      Dataset:name:Dataset-1  /Users/pwalczysko/Desktop/iviewer.png
      Dataset:name:Dataset-2  /Users/pwalczysko/Desktop/old_Full_viewer.png
      Dataset:name:Dataset-2  /Users/pwalczysko/Desktop/image2.png

#. Prepare a ``bulk.yml`` file. This file should specify whether or not this is an in-place import, exclusion of already imported files, and the columns in the .tsv. The example can be

  ::

      ---
      continue: "true"
      transfer: "ln_s"
      exclude: "clientpath"
      path: "filePaths.tsv"
      checksum_algorithm: "File-Size-64"
      logprefix: "logs/"
      output: "yaml"
      columns:
          - target
          - path




#. Prepare the data on the server you are testing so that they can be imported in-place. The path to the data must correspond with the paths stated in the filePaths.tsv file.

#. Run bulk import ``bin/omero import --bulk bulk.yml``

#. |C| that the newly created Datasets in OMERO and their content correspond to the specification in the ``filePaths.tsv`` file.

#. |C| that the import finished successfully and the images are imported in-place. This means the images have the ``Imported with --transfer=ln_s`` remark under the ``Show file paths on server`` icon in the clients.

#. Comment out the ``transfer: "ln_s"`` line from your bulk.yml file and repeat the import.

#. |C| that this time the images are not imported in-place. This means the images do not have the ``Imported with --transfer=ln_s`` remark under the ``Show file paths on server`` icon in the clients.

#. In OMERO client, delete some (not all) of the imported images.

#. Repeat the last import again, and |C| that only the images which were deleted in OMERO in the previous step were imported. This means, you should have no duplicate imports in your datasets now. Also |C| that all the images specified in the ``filePaths.tsv`` are imported now.

#. Repeat the workflow for a .tsv specifying Plates, see such as in this IDR `example <https://github.com/IDR/idr-metadata/blob/master/idr0020-barr-chtog/screenA/idr0020-screenA-plates.tsv>`_

#. Repeat the workflow for a .tsv specifying whole folders, instead of pointing to single images or Plates.





	.. _ImportCLI002:
	.. figure:: /images/testing_scenarios/ImportCLI/002.png
	   :align: center

	   ImportCLI002: 


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportCLI004:
	.. figure:: /images/testing_scenarios/ImportCLI/004.png
	   :align: center

	   ImportCLI004:


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportCLI005:
	.. figure:: /images/testing_scenarios/ImportCLI/005.png
	   :align: center

	   ImportCLI005:


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _ImportCLI006:
	.. figure:: /images/testing_scenarios/ImportCLI/006.png
	   :align: center

	   ImportCLI006
	
	
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|

