Insight as Plugin ImageJ/Fiji
==============================


**To test in**: ImageJ, Fiji

**Purpose of the test** is to check that the OMERO insight works as plugin for ImageJ/Fiji and the ``bioformats_package.jar`` or ``loci_tools.jar`` missing is not causing a crash.

**Test on Linux as well as Windows (XP and Win7 if possible)**

#. Download the ``OMERO.insight-ij*`` build and unzip it [or copy it into] in ImageJ/plugins folder [:ref:`InsightIJI001`]

**ImageJ and ImageJ2**

Note: You can download ImageJ2 from https://imagej.net/Downloads.

#. Add neither ``bioformats_package.jar`` nor ``loci_tools.jar`` to the Plugins folder of ImageJ (or ImageJ2). If it is there, remove it.


#. Start ImageJ (or ImageJ2) and go ``Plugins`` > ``OMERO`` > ``Connect to OMERO``

   - |C| that a popup appears indicating that ``bioformats_package.jar`` or ``loci_tools.jar`` is missing.[:ref:`InsightIJI002`]

#. (For the release-day testing only.) Click on the hyperlink in the popup and |C| it brings you to the last release version of Bio-formats. Download ``bioformats_package.jar`` [:ref:`InsightIJI005`] from this Bio-formats release Download page which is being coupled with the OMERO for the release, e.g. ``https://downloads.openmicroscopy.org/bio-formats/<version>`` . Note that this **does not have to be matching** version with the OMERO version, as Bio-formats is decoupled from OMERO. 

   

#. (For non-release-day testing only.) Download ``bioformats_package.jar`` from :mergecijob:`CI <BIOFORMATS-build>` in case you are testing a Bio-formats PR.

   

#. Quit ImageJ. Copy ``bioformats_package.jar`` into ``Plugins`` folder of ImageJ [:ref:`InsightIJI001`].



#. Restart ImageJ (or ImageJ2), and go ``Plugins`` > ``OMERO`` > ``Connect to OMERO``


   - |C| the ``bioformats_package.jar`` version. To check the ``bioformats_package.jar`` version, open ImageJ (or ImageJ2), go ``Help > About Plugins > Bio-Formats Plugins`` or ``Help > About Plugins > LOCI Plugins``  [:ref:`InsightIJI004`].
   - |C| that Insight splashscreen is displayed.
   - |C| that if you rename the ``bioformats_package.jar`` to ``bioformats_package<substitute-any-string>.jar`` and restart ImageJ, and ``Connnect to OMERO``` again, the Insight plugin still starts and no warning is being displayed.

#. Log in.

#. Go to the left-hand pane and select an image or import one if no images available.

#. Double-click on the image and then click ``OK`` in the ``Bio-Formats Import Options`` window [:ref:`InsightIJI006`].

   - |C| that the image opens in ImageJ [:ref:`InsightIJI007`].

#. Replace the ``bioformats_package.jar`` with ``loci_tools.jar`` and repeat the steps 3 (on release day only) or 4 (non-release day only) and 5, 6, 7, 8 and 9 (on both release and non-release days). 

#. Put both ``bioformats_package.jar`` and ``loci_tools.jar`` into Plugins folder and restart ImageJ (or ImageJ2). 

   - |C| that a duplication warning appears [:ref:`InsightIJI007b`].
   - |C| that you can still connect to OMERO and open an image.

#. Go through all steps using ImageJ64 and the platform independent version of ImageJ (download from `ImageJ homepage <http://rsbweb.nih.gov/ij/download.html>`_).


**ImageJ - ROI and OMERO upload**
(This section is just pre-release testing scenario (unless stated otherwise), do not do on release day, on release day go to section **Fiji**)

#. Open an image in ImageJ, draw regions using IJ toolbar on a particular z, t and c plane and click ``Analyze > Tools > ROI Manager``. Each time you draw a new region click ``Add`` in the ``ROI Manager`` (The key ``t`` can be used as keyboard shortcut).

   - export the image using ``Plugins > Bio-formats > Bio-formats Exporter`` to the local drive on your machine
   - make sure the ``Export ROIs`` tickbox in the second dialog (``Bio-Formats Exporter Options``) is ticked BY DEFAULT
   - close the image
   - close the ``ROI Manager``
   - reimport the saved image using ``Plugins > Bio-formats > Bio-formats Importer``, selecting the checkboxes ``Display ROIs``, ``Display OME-XML metadata`` and ``Display Metadata`` in the ``Bio-formats importer`` options)
   - |C| that the OME-XML has all the saved ROIs listed as shown in example below
   - |C| that also the Shape Properties are listed in the OME-XML, for example StrokeColor and StrokeWidth. (See example below. Note: Shape FillColor is not being saved.)
   - |C| that when you tick the ``Show all`` tickbox in ``ROI Manager`` you see the regions just as you saved them on the image

example of OME-XML with Shape Properties::

      <ROI ID="ROI:0:0" xmlns="http://www.openmicroscopy.org/Schemas/ROI/2015-01">
      <Union>
      <Shape FillColor="-16776961" ID="Shape:0:0" StrokeColor="65535" StrokeWidth="13.0" StrokeWidthUnit="pixel" Text="0001-0052-0076" TheC="0" TheT="0" TheZ="0">
      <Rectangle Height="49.0" Width="91.0" X="31.0" Y="28.0"/>

  


 
2. Import the image you created into OMERO (using OMERO.insight).
   - |C| that the image has regions as you have drawn them in ImageJ and the regions are correctly displayed in Insight and Web.

3. Repeat steps 1., 2. this time draw regions using IJ toolbar and ``Image > Overlay > Add selection`` or use the shortcut ``cmd B``. Note that any regions in ``ROI Manager`` will be ignored in case the image has an ``Overlay`` to it. Do this workflow also for a stack (not hyperstack) image, e.g. ``test_images_good/tiff/QA images/Artificial_xyt_8bit.tif`` and for a hyperstack image (e.g. a multi z, c, t ``dv``).

4. Open an image in ImageJ, create a rectangular region, and make a crop (``Image > Crop``). 
   
   - create a region in the cropped image and go ``Plugins > OMERO > Save Image(s) to OMERO``
   - |C| that the Data Manager of Insight opens followed immmediately by Importer  [:ref:`InsightIJI007c`]
   - Select in a row both the radio button options in the Importer ``Add image from current window`` and ``Add image from all image windows``
   - |C| that when you click ``Add to Queue`` the image(s) gets added to the right-hand pane of importer according to the option of the radio button which you selected.
   - Do not create a new project nor select an existing one, and |C| that after you imported, you have the image in Orphaned folder.
   - Now create a new Project or select an existing project and use the default ``New From Folder`` option for Dataset and 
   - |C| that after import, a new Dataset has been created under the Project you selected/created with the name identical to the folder containing the image opened in ImageJ (e.g. if you opened the image in ImageJ from ``users/your_name/localimages/`` on your machine, the name of the Dataset should be ``localimages``)

#. Open 2 images in ImageJ from your local drive and combine the 2 images (``Image > Stacks > Tools > Combine``).
   - go ``Plugins > OMERO > Save Image(s) to OMERO``
   - |C| that the generated image can be added to the queue and imported.


#. Testing ``Save ROIs to OMERO`` feature

   - open an image from OMERO in ImageJ and also
   - open another image, this time from your local disk (not from OMERO)
   - draw ROIs on both images, add them to Overlay and select ``Save ROIs to OMERO`` 
   - in the first dialog select ``Save image from all open windows`` option and click ``Save``
   - |C| that another dialog pops up  [:ref:`InsightIJI007e`] asking you whether you want to also upload images not yet stored in OMERO
   - select ``Yes`` and |C| that an ``Import Location...`` dialog  [:ref:`InsightIJI007f`] pops up for selection of P/D to import the image to
   - select an existing P/D or create a new P/D and click ``Add to the Queue``
   - |C| that import immediately starts. 
   - |C| that the ``Results saved`` item in Activities pops up
   - |C| that the new image(s) are imported with the associated regions to the chosen location.
   - |C| that also the other image which was already stored in OMERO has the new regions now associated to it in OMERO.
   - close all images and ROI Manager in ImageJ


#.  Recognizing the image which was freshly uploaded to OMERO.
 
    - Open an image from your local drive in imageJ
    - Use``Save Image(s) to OMERO``  to save the image into OMERO.
    - Draw a ROI on the image and add it to ROI Manager in ImageJ.
    - Click ``Save ROIs to OMERO``.
    - |C| that the dialog indicating that the image is not imported does not pop up. 
    - |C| that the ROI you just drawn is added to the previously imported image.

#. Using ``Save ROIs to OMERO`` to upload non-saved images as well.


   - Open at least two images stored in OMERO in ImageJ using the imageJ plugin
   - draw ROIs on both images and add them to Overlay (use ``Alt + B``)
   - select ``Plugins > Save ROIs to OMERO``
   - |C| that a dialog ``Save ImageJ Results`` pops up  [:ref:`InsightIJI007d`]
   - select in a row both ``Save image from current window`` and ``Save image from all open windows`` radio button options
   - select ``Save`` in the dialog and |C| that the regions are now saved in OMERO as chosen in the dialog
   - Draw a ROI and add it to the ROI Manager in ImageJ
   - crop the image (draw a rectangle encompassing the region you have just drawn and select ``Image > Crop``)
   - select "Save ROIs to OMERO" item in ``Plugins > OMERO``
   - |C| that the image is imported as ome-tiff WITH the region you have drawn on it.
   - close all images and ROI Manager in ImageJ



#. Draw a ROI specifically on a z or t plane.

   - open a multi-z and multi-t image stored in OMERO in ImageJ using the ImageJ plugin
   - draw several ROIs (including an ellipse) in ImageJ on a particular z/t plane(s) and add them to ROI Manager in ImageJ (**Note that Overlay in ImageJ does not support t information, but does support the z information.**)
   - also open ``test_images_good/tiff/QA images/Artificial_xyt_8bit.tif`` and draw several ROIs (including ellipse) in IJ on a particular plane and add them to Overlay (``Ctrl + B``)
   - save the ROI using ``Save ROIs to OMERO`` on both images
   - |C| that the ROI in OMERO is associated with the correct z/t plane(s)
   - in ImageJ, go to ``ROI Manager > More > Options`` and tick the ``Associate Show All...`` box
   - restart ImageJ
   - in OMERO, prepare another image with ROIs associated to different z/t planes 
   - open the image you prepared from OMERO in ImageJ using the plugin, ticking the options ``Display Metadata``, ``Display OME-XML Metadata`` and ``Display ROIs`` options in the ``Bio-formats import options`` dialog and 
   - |C| that now the ROI is associated to a particular z and t plane(s) in ImageJ and these plane(s) correspond with the plane(s) in OMERO
   - |C| the OME-XML to see if the newly added ROI's have the correct Z,C and T information.   

example of OME-XML with Z, C and T information::

      <ROI ID="ROI:0:0" xmlns="http://www.openmicroscopy.org/Schemas/ROI/2015-01">
      <Union>
      <Shape ID="Shape:0:0" StrokeColor="-1" Text="0611-0860" TheC="1" TheT="1" TheZ="1">
      <Rectangle Height="390.0" Width="780.0" X="470.0" Y="416.0"/>
      <ROI ID="ROI:1:0" xmlns="http://www.openmicroscopy.org/Schemas/ROI/2015-01">
      <Union>
      <Shape ID="Shape:1:0" Text="1162-2035" TheC="1" TheT="1" TheZ="1">
      <Rectangle Height="584.0" Width="250.0" X="1910.0" Y="870.0"/>


10. Testing ``Save Results to OMERO`` feature

    - open an image from OMERO in ImageJ, draw an ROI and add to ROI Manager of IJ
    - go to ``Analyze > Measure``
    - select ``Plugins > Save Results to OMERO``
    - |C| that a dialog ``Save ImageJ Results`` pops up  [:ref:`InsightIJI007d`]
    - input a ``<name>`` for the .csv file to save (do not use periods in the name)
    - |C| that the ``Results saved`` item in Activities pops up
    - |C| that the csv file with the name ``<name>.csv`` is attached to the image in OMERO
    - |C| that when you leave the box for the name empty, the file is named ``ImageJ-<NameOfImage>-Results-<Date>.csv``

11. Using ``Save Results to OMERO`` to upload non-saved images as well.

    - Repeat the steps above with an image opened from your local disk
    - |C| that the image is imported and the measurements saved as ``<name>.csv`` file.

12. Open and save workflows for images

    - open a z-stack image from OMERO in ImageJ
    - open another z-stack image from OMERO in ImageJ
    - go in IJ ``Image > Stacks > Tools > Concatenate...``
    - ``Upload and Save to OMERO`` the resulting image
    - |C| that the concatenated image has been imported successfully

13. MIF workflows

    - in ImageJ, using Bio-Formats Importer, open ``test_images_good/leica-liff/Beta Catenin.lif``
    - select ``Select All`` in the popup window and click OK
    - 5 images should be open
    - draw a region on 3 of the images, adding it to Overlay every time
    - use ``Save image(s) to OMERO`` to upload the MIF and ROIs to OMERO
    - select in a row ``Add images from current window`` and ``Add images from All open window`` to test both workflows
    - |C| that in both cases, you have the whole MIF imported 1x with each ROI associated with the image you have drawn it on in ImageJ

**Fiji**

#. Start Fiji

#. Go ``Help`` > ``Update Fiji`` -> the update process will start. Restart Fiji and

   - |C| that you have the last release version of Bio-formats. To check the Bio-Formats version, go ``Help > About Plugins > LOCI Plugins`` [:ref:`InsightIJI004`]. Note that this **does not have to be matching** version with the OMERO version, as Bio-formats are decoupled from OMERO. 


#. Add the ``OMERO.insight-ij*`` plugin to the ``Plugins`` folder of Fiji - on Mac, use rigth-click on Fiji icon & ``Show package content`` [:ref:`InsightIJI003`] to get to ``Plugins`` 

#. Restart Fiji

#. Go ``Plugins`` > ``OMERO`` > ``Connect to OMERO``

   - |C| that Insight splashscreen is displayed.

#. Log in.

#. Go to the left-hand pane and select an image or import one if no images available.


#. Double-click on the image and then click ``OK`` in the ``Bio-Formats Import Options`` window [:ref:`InsightIJI006`].

   - |C| that the image opens in Fiji.


**Note**  that during the update, there might be a problem with the class ``org.joda.time.Instant`` which can be found here:

::

    /Applications/Fiji.app/jars/jruby.jar
    /Applications/Fiji.app/jars/loci_tools.jar
    /Applications/Fiji.app/plugins/OMERO.insight-ij-5.0.0-rc1-ice35-b10/libs/joda-time.jar


The warning looks as follows:

::

    WARNING: multiple locations found! java.lang.NoSuchMethodError: org.joda.time.Instant.parse(Ljava/lang/String;Lorg/joda/time/format/DateTimeFormatter;)Lorg/joda/time/Instant;

**Solution**: Delete the ``jruby.jar``.







.. _InsightIJI001:
.. figure:: /images/testing_scenarios/InsightasPluginImageJFiji/001.png
   :align: center

   InsightIJI001 


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _InsightIJI002:
.. figure:: /images/testing_scenarios/InsightasPluginImageJFiji/002.png
   :align: center

   InsightIJI002


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _InsightIJI003:
.. figure:: /images/testing_scenarios/InsightasPluginImageJFiji/003.png
   :align: center

   InsightIJI003


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _InsightIJI004:
.. figure:: /images/testing_scenarios/InsightasPluginImageJFiji/004.png
   :align: center

   InsightIJI004


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _InsightIJI005:
.. figure:: /images/testing_scenarios/InsightasPluginImageJFiji/005.png
   :align: center

   InsightIJI005


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _InsightIJI006:
.. figure:: /images/testing_scenarios/InsightasPluginImageJFiji/006.png
   :align: center

   InsightIJI006


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _InsightIJI007:
.. figure:: /images/testing_scenarios/InsightasPluginImageJFiji/007.png
   :align: center

   InsightIJI007


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _InsightIJI007b:
.. figure:: /images/testing_scenarios/InsightasPluginImageJFiji/007b.png
   :align: center

   InsightIJI007b


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _InsightIJI007c:
.. figure:: /images/testing_scenarios/InsightasPluginImageJFiji/007c.png
   :align: center

   InsightIJI007c


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _InsightIJI007d:
.. figure:: /images/testing_scenarios/InsightasPluginImageJFiji/007d.png
   :align: center

   InsightIJI007d


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _InsightIJI007e:
.. figure:: /images/testing_scenarios/InsightasPluginImageJFiji/007e.png
   :align: center

   InsightIJI007e


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _InsightIJI007f:
.. figure:: /images/testing_scenarios/InsightasPluginImageJFiji/007f.png
   :align: center

   InsightIJI007f


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _InsightIJI008:
.. figure:: /images/testing_scenarios/InsightasPluginImageJFiji/008.png
   :align: center

   InsightIJI008


|
|
|
|
|
|
|
|
|

|
|
|
|
|
|
|
|


.. _InsightIJI008b:
.. figure:: /images/testing_scenarios/InsightasPluginImageJFiji/008b.png
   :align: center

   InsightIJI008b


|
|
|
|
|
|
|

|
|
|
|
|
|
|
|
|
|


.. _InsightIJI009:
.. figure:: /images/testing_scenarios/InsightasPluginImageJFiji/009.png
   :align: center

   InsightIJI009


|
|
|
|
|
|
|
|
|



