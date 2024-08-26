.. contents::
   :depth: 2


###############
General Release
###############


**Purpose of the test** is to make sure the particular application on the release day is built correctly, starts, connects and opens an image as expected (when applicable).

**Click onto the application you are assigned to test in the Contents above**



OMERO.clients
=============

#. Download and open the application and login as any user

   - (all platforms) |C| other Ice versions of OMERO.insight*.zip files on artifacts page.
   - (all platforms) |C| one of the OMERO.importer*.zip files on artifacts page
   - (Windows only) |C| that there is no "exe4j" popup prior to Insight splashscreen.
   - (all platforms) |C| that the application starts and you can log in.
   - (all platforms, Insight only) |C| that you can expand a dataset and open an image with multi-z (Choose one of the ``.dv`` images in datasets named like ``archived dv`` or ``non-archived dv`` - present in almost every user/group.)
   - (all platforms, Insight only) |C| that you can click onto the Projection tab in the opened image.
   - (all platforms) |C| that you can execute any script.
   - (all platforms) |C| that you can delete the image.
   


IJ/Fiji Plugin
==============

#. Follow :doc:`InsightasPluginImageJFiji` 


OMERO.server
============

#. Download the appropriate OMERO.server*.zip and unzip the downloaded file. 
#. Configure the server.
#. Start the server and the web server.

   - |C| that the server starts as expected.

#. Download and open OMERO.insight and go to the appropriate port address in your web browser to login to OMERO.web.
#. Login in OMERO.insight and OMERO.web connecting to the server you just started.

   - |C| that the clients connect to the server and login is successful.
   - |C| that DropBox imports a file successfully
   - |C| that you can execute (any) script using (any) client


OMERO.matlab toolbox
====================

#. Install Matlab (development).

#. In order to be able to execute the testing commands in Matlab, perform the necessary steps in the workflow described in  :omerodoc:`Matlab docs <developers/Matlab.html>` using the build indicated in the Standup Notes. Then, execute in Matlab (``hostname``, ``username``, ``password`` and ``imageID`` needs to be substituted by valid values)::

    client = loadOmero(hostname);
    % to use a different port than the default one.
    % client = loadOmero(hostname, port);
    session = client.createSession(username, password);
    image = getImages(session, imageID);
    plane = getPlane(session, image, 0, 0, 0);
    datasets  = getDatasets(session);
    figure; imshow(plane, []);
    client.closeSession();

#. After you have executed the above commands, 

   - |C| that all 7 commands executed without errors.
   - |C| that after ``figure; imshow(plane, []);`` the image is displayed in Matlab.

#. Go to :omerodoc:`Matlab docs <developers/Matlab.html>` and find the paragraph ``Create a Dataset...`` under ``Writing`` section. Follow the commands to create a Dataset and link it to a Project.

   - |C| that a Dataset was created.

#. Go to :omerodoc:`Matlab docs <developers/Matlab.html>` and find the paragraph ``Creating ROI`` under ``ROIs`` section. Follow the commands to create a ROI and link it to an Image.

   - |C| that a ROI was created.

#. Go to :omerodoc:`Matlab docs <developers/Matlab.html>` and find the section ``Deleting data``. Follow the commands to Delete an Image, a Dataset and a Project.

   - |C| that the I/D/P was deleted.


OMERO Virtual Appliance
=======================

#. This section is only valid for testing versions prior to 5.2.2.

#. Follow the `Virtual Appliance docs <https://docs.openmicroscopy.org/latest/omero5.2/users/virtual-appliance.html>`_ to get the Virtual Appliance started - skip the steps as appropriate in case you have already installed Virtual Box.

#. Start OMERO.insight and OMERO.web as described in the docs and try to login.

   - |C| that Insight and Web start okay and you can login successfully.
   - |C| that you can import and then open a small image (any small image will do).

Bio-Formats MATLAB/Octave
=========================

.. warning::
  Milestone or SNAPSHOT versions cannot be tested using the version of GNU
  Octave installed by the Ubuntu 16.04 package manager (4.0.x) as only versions
  of the format x.y.z are accepted by the implementation
  (https://wiki.octave.org/OEP:pkg#version_definition).

**System installation**

#. Install MATLAB or GNU Octave on your operating system using the appropriate
   downloads or package manager.

#. Install the :bf_doc:`Bio-Formats MATLAB toolbox <users/matlab>` or the
   :bf_doc:`Bio-Formats Octave package <users/octave>`.

#. Download one of our :modeldoc:`sample images <ome-tiff/data.html>`.
   Alternatively, use any small image on your local disk or on squig.

#. Follow the instructions :bf_doc:`here <developers/matlab-dev.html>` up to
   and including the section ``Displaying images``.

   - |C| that the image opens as expected.

#. Set the root logger to `DEBUG` level::

    loci.common.DebugTools.setRootLevel('DEBUG');
   
#. Reopen the image using the same commands as previously.

   - |C| that the amount of logging increases in the MATLAB command prompt.

**Docker (GNU Octave only)**

#. Clone https://github.com/openmicroscopy/bio-formats-octave-docker, update
   the ``VERSION`` argument and build the Docker image::

     $ docker build -t bio-formats-octave  .

#. Download one of our :modeldoc:`sample images <ome-tiff/data.html>`.
   Alternatively, use any small image on your local disk or on squig.

#. Run the :file:`travis_test.m` on the image e.g.::

     $ docker run -ti -v /data/:/data/ bio-formats-octave travis_test.m /data/tubhiswt-2D/tubhiswt_C0.ome.tif

   - |C| that the image opens as expected.
   - |C| that the amount of logging increases in the second execution.

Bio-Formats: ImageJ/Fiji testing
================================

ImageJ
------

#. Use ImageJ for this section, not Fiji.

#. Remove any previous ``bioformats_package.jar`` or ``loci_tools.jar`` files from your ImageJ Plugins folder. Put the freshly downloaded ``bioformats_package.jar`` into the Plugins folder of ImageJ and start ImageJ.

   - |C| that there is a ``LOCI`` menu item under the ``Plugins`` menu and when you select it, the submenu asks you to use ``Bio-Formats`` menu.
   - |C| that there is a ``Bio-Formats`` menu item under the ``Plugins`` menu.

#. Select ``Plugins`` > ``Bio-Formats`` > ``Bio-Formats Importer`` and import a small image (any small image will do).

   - |C| that the image imports successfully.

#. Leave the imported image open in ImageJ and Select ``Plugins`` > ``Bio-Formats`` > ``Bio-Formats Exporter`` and export this image.

   - |C| that the image exports successfully.

#. Select ``Plugins`` > ``Bio-Formats`` > ``Bio-Formats Remote Importer`` and paste the URL ``https://downloads.openmicroscopy.org/images/DV/U2OS/U2OS_Eg5_PH3_001_R3D.dv`` into the first dialog that pops up.

   - |C| that the image imports successfully.

#. Select ``Help`` > ``About Plugins`` > ``Bio-Formats Plugins...``

   - |C| that the URLs shown in the popup link to existing and sensible pages.
   - |C| that the release version and date are correct.
Fiji
----

This testing assumes the release artifacts have been deployed to the
`Bio-Formats update site <https://sites.imagej.net/Bio-Formats/>`_.


#. Use Fiji for this section, not ImageJ.

#. Activate the Bio-Formats update site :menuselection:`Help -> Update... -> Manage update sites` in addition to the Java-8 update site.

#. In the ImageJ Updater Window ensure that the ``plugins/bio-formats_plugins.jar`` file and jars in the ``jars/bio-formats`` folder are listed for update.

   - |C| check that the ``Update Site`` for each is listed as the ``Bio-Formats`` update site.
   - |C| the ``Status/Action`` field for each should be set to ``Install it`` or ``Update it``.
   - |C| click on ``Advanced Mode``, then select each file and ensure the date and version in the ``Details`` panel is correct.

#. Select ``Help`` > ``About Plugins`` > ``Bio-Formats Plugins...``

   - |C| that the URLs shown in the popup link to existing and sensible pages.
   - |C| that the release version and date are correct.

#. In the ImageJ Updater Window select ``Apply Changes`` to run the update and restart FIJI

#. Select ``Plugins`` > ``Bio-Formats`` > ``Bio-Formats Importer`` and import a small image (any small image will do).

   - |C| that the image imports successfully.

#. Leave the imported image open in ImageJ and select ``Plugins`` > ``Bio-Formats`` > ``Bio-Formats Exporter`` and export this image.

   - |C| that the image exports successfully.

#. Select ``Plugins`` > ``Bio-Formats`` > ``Bio-Formats Remote Importer`` and  paste the URL ``https://downloads.openmicroscopy.org/images/DV/U2OS/U2OS_Eg5_PH3_001_R3D.dv`` into the first dialog that pops up

   - |C| that the image imports successfully.

#. Select ``Help`` > ``About Plugins`` > ``Bio-Formats Plugins...``

   - |C| that the URLs shown in the popup link to existing and sensible pages.

#. Select ``Plugins`` > ``Bio-Formats`` > ``Update Bio-Formats Plugins`` and go to the ``Stable build (*.*.*)`` item in the ``Release`` dropdown menu.

   - |C| that the version number in the brackets shows the most recent stable release number.
  
#. (**post-release step**) |C| that you can execute the updates (Note that the release page has not been made public prior to the later release steps. This is why this step would cause an error when executed prior to Release Acceptance.)

   - |C| that after you have updated, the ``loci_tools.jar`` in your Plugins folder vanished, and ``bioformats_package.jar`` appeared instead.




Bio-Formats command-line tools
==============================

#. Download and unzip the bftools.zip. 

#. Move into this folder.


#. Execute the ``bfconvert`` command on the cmd line, for example::

    $ touch test.fake
    $ ./bfconvert test.fake test.ome.tiff
   
   - |C| that a new image with the name you chose and the chosen extension (for example ``.ome.tiff``) was created.

#. Execute the ``showinf`` command on the cmd line, using the ``.ome.tiff`` image created in previous step ::

    $ ./showinf -version

   - |C| that the correct version, revision and build date are returned after the first command.

   ::

    $ ./showinf <image_path>

   - |C| that the image in the <image_path> in the second command opens.

   ::

    $ ./showinf -omexml <image_path>

   - |C| that the image in the <image_path> in the second command opens, the
     OME-XML is validated and displayed






Downloads page
==============

#. Go to the downloads page and 

   - |C| the general layout (no gross misformattings or similar)
   - |C| that clicking on all links in the text everywhere (e.g. like to the docs in the first paragraph, in the explanatory texts under the download blocks) will bring you to the advertised place.
   - NO NEED to download the clients or servers
   - |C| that you can download the ``Source code``, ``OMERO API documentation``, ``OMERO Java Downloads``, ``OMERO Python Downloads``
   - |C| ``Source code links``


