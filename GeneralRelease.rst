.. contents::
   :depth: 2


##############################################
General Release
##############################################


**Purpose of the test** is to make sure the particular application on the release day is built correctly, starts, connects and opens an image as expected (when applicable).

**Click onto the application you are assigned to test in the Contents above**



OMERO.clients
============================================================

#. Download and open the application and login as any user

   - (all platforms) |C| a version with nice icon from the front Downloads page.
   - (all platforms) |C| other Ice versions of OMERO.insight*.zip files on artifacts page.
   - (all platforms) |C| one of the OMERO.importer*.zip files on artifacts page
   - (Windows only) |C| that there is no "exe4j" popup prior to Insight splashscreen.
   - (all platforms) |C| that the application starts and you can log in.
   - (all platforms, Insight only) |C| that you can expand a dataset and open an image with multi-z (Choose one of the ``.dv`` images in datasets named like ``archived dv`` or ``non-archived dv`` - present in almost every user/group.)
   - (all platforms, Insight only) |C| that you can click onto the Projection tab in the opened image.
   - (all platforms) |C| that you can execute any script.
   - (all platforms) |C| that you can delete the image.
   


IJ/Fiji Plugin
============================================================

#. Follow :doc:`InsightasPluginImageJFiji` 


OMERO.server
============================================================

#. Download the appropriate OMERO.server*.zip and unzip the downloaded file. 
#. Configure the server.
#. Start the server and the web server.

   - |C| that the server starts as expected.

#. Download and open OMERO.insight and go to the appropriate port address in your web browser to login to OMERO.web.
#. Login in OMERO.insight and OMERO.web connecting to the server you just started.

   - |C| that the clients connect to the server and login is successful.
   - |C| that DropBox imports a file successfully
   - |C| that you can execute (any) script using (any) client


Webstart
============================================================

#. This section is only valid for 5.1.x testing.

#. Upgrade your Java to at least "1.7.0_51" - this is important for the security problems appearing in new Java versions!

#. Download and deploy the release server or use one which was deployed for you and start OMERO.web. **Note that the setups of servers for this purpose is under construction, you have to check what is deployed for you on the day of testing.**

  
   - Choice of browser is prescribed in the Trello card, but be sure to have checked Firefox on Windows on the client side (once for any server is enough).
   - |C| that Webstart works from url (replace .../webclient/xxx with .../webstart once you navigate to the right server)
   - |C| that Webstart works from webclient (login to OMERO.web). 
   - |C| that Webstart performs autologin when started from the icon inside webclient, logging in with the same credentials as you were logged into web (at the time of this correction of the scenario, the autologin feature works only on default port, 4064, it fails for example on 14064 port)
   - |C| that the application starts (see examples below).
   - |C| that you can connect and expand a dataset and open an image.

Examples of expected events:

**Win 7**

IE 9.0, Java "1.7.0_45" through to "1.8.0_51"

   - OMERO webstart window appears: click on Webstart logo.
   - Security Warning popup appears: popup: click ``I accept...`` and then click ``Run``.
   - Webstart splashscreen appears.

Firefox 26.0, Java "1.7.0_45" through to "1.8.0_51"

   - OMERO webstart window appears: click on Webstart logo, although note that you might have in this window a warning about an unsafe plugin: ``This plugin has security vulnerabilities. Activate Java Deployment Toolkit``. Activate the Toolkit as indicated. The window with Webstart logo appears. Click on the logo. Choose ``Open`` in following dialog.
   - Webstart splashscreen appears after a while.

Chrome 31.0, Java "1.7.0_45"

   - OMERO webstart window appears: click on Webstart logo.
   - An arrow indicating Download of the ``.jnlp`` file appears shortly, then click ``Show all downloads`` link which appears in the bottom-left corner of the OMERO webstart window.
   - Select the ``.jnlp`` file from the appearing list and confirm that you want to ``Keep`` and ``Keep anyway`` in two consecutive popups.
   - After this, you can click on the ``.jnlp`` file.
   - Downloading window appears shortly.
   - Security Warning popup appears: popup: click ``I accept...`` and then click ``Run``.
   - Webstart splashscreen appears.

**Mac OS X**

Any browser on any Mac OS X system with any Java:

   - If under ``Preferences > Security and Privacy > General (tab)``
     the option ``App store and identified developers`` is selected, you 
     will not be able to start webstart because of security blockage by 
     Mac OS X. In order to perform the tests, you have to select 
     ``Anywhere``. Alternatively, you can launch the ``.jnlp`` file from your Downloads folder using right-click. (This alternative does not work for Firefox.)

Safari 6.0.5 and 6.1.1, OS X 10.8.5, Java "1.7.0_21" and "1.7.0_45"

   - OMERO webstart window appears: click on Webstart logo.
   - no window or popup appears: go to Downloads (top-right corner of your browser, icon with downward arrow in a circle) and double-click onto the ``.jnlp`` file. 
   - intermittent Java 7 popup appears followed by Download popup and a Security Warning popup: click ``I accept...`` and then click ``Run``.
   - Download popup appears again shortly and then Webstart splashscreen appears.

Safari 5.1.1, OS X 10.6.8, Java "1.6.0_26"

   - OMERO webstart window appears: click on Webstart logo.
   - Webstart splashscreen appears immediately.

Firefox 21.0, OS X 10.8.5, Java "1.7.0_21" and "1.7.0_51":

   - OMERO webstart window appears - click on Webstart logo.
   - "Opening Insight.jnlp" window appears - keep the default and click OK.
   - First popup from the OS X - select ``Open``.
   - Security warning saying that ``Insightxxx.jnlp`` is downloaded from Internet. Click Open.
   - Short flash of "Java 7" window starting.
   - Second security warning: click ``Run``.
   - **Note** that the icon in your dock is just a Java icon, not Insight.
   - OMERO webstart splashscreen opens.

Firefox 27.0, OS X 10.6.8, Java "1.6.0_26"

   - Webstart does not work: redirection to a Java update information website with info about updates happens instead. When these updates are applied, it does not help.

Chrome 31.0.1650.63, OS X 10.8.5, Java "1.7.0_21" through to "1.8.0_51"

   - Webstart does not work unless a trick is applied (see below): redirection to a Java update information website with info about updates happens instead. There is a mention about the fact that 32-bit Chrome browser does not support Java 7. Java runs only on 64-bit browsers on Mac OS. When the updates are applied, it does not help. Following trick can be applied (but it will not work after version 45 of Chrome).  
   - Make sure you have Chrome Version 39 or newer. A 64-bit browser is required to run Oracle Java on Mac OS X
   - Enable NPAPI chrome://flags/#enable-npapi, click Enable and Relaunch Now (more details in https://support.google.com/chrome/answer/6213033)
   - You can test the effectiveness of your fix by going to https://java.com/en/download/installed.jsp?detect=jre and right click on puzzle Run Plugin to give permissions 



OMERO.matlab toolbox
============================================================

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
============================================================

#. This section is only valid for testing versions prior to 5.2.2.

#. Follow the `Virtual Appliance docs <https://www.openmicroscopy.org/site/support/omero5.2/users/virtual-appliance.html>`_ to get the Virtual Appliance started - skip the steps as appropriate in case you have already installed Virtual Box.

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

Bio-Formats: bioformats_package.jar and loci_tools.jar
============================================================

**bioformats_package.jar testing**

#. Use ImageJ for this ``bioformats_package.jar testing`` section, not Fiji.

#. Remove any previous ``bioformats_package.jar`` or ``loci_tools.jar`` files from your ImageJ Plugins folder. Put the freshly downloaded ``bioformats_package.jar`` into the Plugins folder of ImageJ and start ImageJ.

   - |C| that there is a ``LOCI`` menu item under the ``Plugins`` menu and when you select it, the submenu asks you to use ``Bio-Formats`` menu.
   - |C| that there is a ``Bio-Formats`` menu item under the ``Plugins`` menu.

#. Select ``Plugins`` > ``Bio-Formats`` > ``Bio-Formats Importer`` and import a small image (any small image will do).

   - |C| that the image imports successfully.

#. Leave the imported image open in ImageJ and Select ``Plugins`` > ``Bio-Formats`` > ``Bio-Formats Exporter`` and export this image.

   - |C| that the image exports successfully.

#. Select ``Plugins`` > ``Bio-Formats`` > ``Bio-Formats Remote Importer`` and paste the URL ``http://downloads.openmicroscopy.org/images/DV/U2OS/U2OS_Eg5_PH3_001_R3D.dv`` into the first dialog that pops up.

   - |C| that the image imports successfully.

#. Select ``Help`` > ``About Plugins`` > ``Bio-Formats Plugins...``

   - |C| that the URLs shown in the popup link to existing and sensible pages.

#. Select ``Plugins`` > ``Bio-Formats`` > ``Update Bio-Formats Plugins`` and go to the ``Stable build (*.*.*)`` item in the ``Release`` dropdown menu.

   - |C| that the version number in the brackets shows the most recent stable release number.

#. (**post-release step**) |C| that you can execute the updates (Note that the release page has not been made public prior to the later release steps. This is why this step would cause an error when executed prior to Release Acceptance.)

**loci_tools.jar testing**

#. Use Fiji for this ``loci_tools.jar testing`` section, not ImageJ.

#. Go to the ``jars`` folder of your Fiji and delete ``jars/bio-formats/*`` (all jars under the ``bio-formats`` subfolder of the ``jars`` folder).

#. Go to the ``plugins`` folder of your Fiji and delete ``bio-formats_plugins*.jar``. 

#. Put the freshly downloaded ``loci_tools.jar`` into the plugins folder of Fiji and start Fiji.

   - |C| that there is a ``LOCI`` menu item under the ``Plugins`` menu and when you select it, the submenu asks you to use the ``Bio-Formats`` menu
   - |C| that there is a ``Bio-Formats`` menu item under the ``Plugins`` menu

#. Select ``Plugins`` > ``Bio-Formats`` > ``Bio-Formats Importer`` and import a small image (any small image will do).

   - |C| that the image imports successfully.

#. Leave the imported image open in ImageJ and select ``Plugins`` > ``Bio-Formats`` > ``Bio-Formats Exporter`` and export this image.

   - |C| that the image exports successfully.

#. Select ``Plugins`` > ``Bio-Formats`` > ``Bio-Formats Remote Importer`` and  paste the URL ``http://downloads.openmicroscopy.org/images/DV/U2OS/U2OS_Eg5_PH3_001_R3D.dv`` into the first dialog that pops up

   - |C| that the image imports successfully.

#. Select ``Help`` > ``About Plugins`` > ``Bio-Formats Plugins...``

   - |C| that the URLs shown in the popup link to existing and sensible pages.

#. Select ``Plugins`` > ``Bio-Formats`` > ``Update Bio-Formats Plugins`` and go to the ``Stable build (*.*.*)`` item in the ``Release`` dropdown menu.

   - |C| that the version number in the brackets shows the most recent stable release number.
  
#. (**post-release step**) |C| that you can execute the updates (Note that the release page has not been made public prior to the later release steps. This is why this step would cause an error when executed prior to Release Acceptance.)

   - |C| that after you have updated, the ``loci_tools.jar`` in your Plugins folder vanished, and ``bioformats_package.jar`` appeared instead.




Bio-Formats command-line tools
============================================================

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


