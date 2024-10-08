Import DropBox
==============


**To test in**: Command line interface/DropBox/Insight

**Purpose of the test** is to check the import using DropBox

**Prerequisites:** local server - user creates a folder DropBox/username in local binary repository.

**Note:** For moving the scenario forward a remote server: a DropBox/username folder exists that the user has write access to will be
implemented.

**Note:** images are not imported into a dataset so the images will be orphaned.

**Find suitable images here** [:download:`TestingSet <downloads/ImportTestingSetTable.pdf>`] or here [:download:`TestingTemplate <downloads/ImportTestingTemplate.pdf>`]

#. Find the DropBox folder in your ``/omero`` folder e.g. ``Petr/var/omero/DropBox``.

#. Open it and create a new folder with a name matching the user ID which you are going to import images for (<somename>)

#. Open Terminal (command line)

#. Get a ``DropBox.log`` file output. Get into your home directory (e.g. petr), then into ``/Work/openmicroscopy/`` folder and then use a line like: ``tail -f dist/var/log/DropBox.log`` to see the log output.

#. Drag and Drop an image file which has a companion file (e.g. ``IAGFP-Noc01_R3D.dv``) into the DropBox subfolder you created in step 2 (e.g. ``Petr/var/omero/DropBox/petr``).

#. Observe the log info in your command line

   - |C| the file has been registered by DropBox [:download:`001 <downloads/DropBox_001.txt>`] and immediately

#. Drag and Drop a companion file to the DV file you put in in step 5 (e.g. ``IAGFP-Noc01_R3D.dv.log``)

   - |C| the companion file has been registered by DropBox [:download:`001 <downloads/DropBox_001.txt>`]
   - |C| that the import starts within ~60 sec (if you do not interrupt it by another file addition into DropBox) [:download:`001 <downloads/DropBox_001.txt>`]
   - |C| that the files have been correctly imported (using Insight UI)

#. Drag and Drop an image without companion file into the DropBox subfolder you created in step 2 (e.g. ``Petr/var/omero/DropBox/petr``)

   - Wait at least ~60sec - watch the progress of the import in the log
   - |C| they are all imported (using Insight UI)

#. Drag and Drop  a folder containing several images/companion files into the DropBox subfolder you created in step 2 (e.g. ``Petr/var/omero/DropBox/petr``)

   - Wait at least ~60sec - watch the progress of the import in the log
   - |C| they are all imported (using Insight UI)

#. Drag and Drop  a nested folder containing Screen/Plate/Well files into the DropBox subfolder you created in step 2 (e.g. ``Petr/var/omero/DropBox/petr``)

   - Wait at least ~60sec - watch the progress of the import in the log
   - |C| they are all imported (using Insight UI)

#. Select a folder with a multi-images file (like ``test_images_good/lei``), drag and drop it into the DropBox subfolder you created in step 2 (e.g. ``Petr/var/omero/DropBox/petr``)

   - Wait at least ~60sec - watch the progress of the import in the log
   - |C| they are all imported (using Insight UI)

#. Inplace import via DropBox. To understand better, read :omerodoc:`sysadmins/in-place-import.html#dropbox`.  Set the ``bin/omero config set -- omero.fs.importArgs`` variable in your local server to:

   - ``--transfer=ln_rm`` 
   - ``--transfer=ln_s`` 
   - ``--transfer=ln``

     and restart the server after each change to finalize the reset. 

#. Import a plate/image via DropBox after each of the 3 resets (and server restarts) above.

   - |C| that the plate/image has been imported successfully and the files stay in the DropBox folder (``ln`` and ``ln_s`` options) or are deleted from it (``ln_rm`` option)

