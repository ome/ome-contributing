Scripts Client
==============



**To test in**: Web, Insight


**Purpose of the test** is to test the scripting functionalities, mainly checking the script launching on various targets and reporting about the script run. Further, the most popular scripts (export scripts, publishing options) are being more thoroughly tested for output formats.

#. Select a dataset

#. Open list of available scripts.[:ref:`ScriptClient001`]

#. Select a script running on datasets.[:ref:`ScriptClient002`][:ref:`ScriptClient003`]

   - |C| that the data type is set to dataset and the id of the dataset is displayed in the id field.

   - Select other data type if applicable,

   - |C| that the id is removed.[:ref:`ScriptClient002`][:ref:`ScriptClient003`]

#. Select the initial data type and enter the initial id.

#. Run the script and

   - |C| that an entry is added to the activities section [:ref:`ScriptClient004`][:ref:`ScriptClient005`]

#. Click on the result link and 

   - |C| that script ran to completion w/o errors.[:ref:`ScriptClient006`][:ref:`ScriptClient007`]

   - |C| that you can view the results of the scripts

   - |C| that you can download the results of the scripts and view the downloaded results


#. Repeat all steps with another type e.g. Image

#. Select more than 3 images and run Batch image export script [:ref:`ScriptClient002`] from Export Scripts submenu
	
   - Choose other output formats than the default (=.jpeg) like .tiff, ome-tiff and .png [:ref:`ScriptClientN001`]

   - Download and unzip the resulting file

   - |C| that the correct format was indeed exported by the script

#. Select an image, create a rectangular ROI and repeat point 8. running Movie ROI Figure script from the Figure Scripts submenu

#. Select 2 or more multi-t images (choose examples from ``test_images_good/ome-tiff`` folder) and create a line ROI in each one and propagate it over t. Run Kymograph script on all images at once. 

    - |C| a new image named ...Kymograph was created for each of the multi-t images.
    - |C| that when you draw a line in each of the Kymographs and execute Kymograph Analysis script on all of the Kymographs at once, only one file will be created and attached to each of the ...Kymograph images.
    - open the attached file and |C| that it contains stats for each drawn line sorted according to the Kymograph images, see [:ref:`ScriptClient001b`]. 

#. Go to the right-hand pane in Insight and Web, General tab and run the following publishing options scripts [:ref:`ScriptClientN002`, :ref:`ScriptClient002b`]

   - Split View Figure

   - ROI Split Figure (create a rectangular ROI first, then run the script)

   - Thumbnail Figure

   - Movie Figure

   - Choose other output formats than the default (=.jpeg) like .tiff, ome-tiff and .png [:ref:`ScriptClientN001`]

   - |C| that the correct format was indeed exported by the script

#. |C| the consistency of script submenus, namely that scripts from the right-hand pane icon ("publishing options" [:ref:`ScriptClientN002`]) are not duplicated in the left-hand panel icon in Insight (the main Scripts menu [:ref:`ScriptClientN003`])

#. |C| the consistency between Insight and Web - are the scripts displayed logically in the corresponding submenus in both clients ?

.. seealso::

   :help:`User documentation for Running Export scripts <download/en/latest/download.html>`

   :help:`User documentation for Running utility scripts <scripts/en/latest/index.html>`

   :omerodoc:`Developer documentation for Scripts <developers/scripts/user-guide.html>`

   :omerodoc:`Developer documentation for MatLab Scripts <developers/scripts/matlab-scripts.html>`

   :omerodoc:`Developer documentation for Script style <developers/scripts/style-guide.html>`

   :omerodoc:`Developer documentation for Script API <developers/scripts/advanced.html>`



.. _ScriptClient001:
.. figure:: images/testing_scenarios/ScriptsClient/001.png
   :align: center

   ScriptClient001: 


|
|
|
|
|
|
|
|



.. _ScriptClient001b:
.. figure:: images/testing_scenarios/ScriptsClient/001b.png
   :align: center

   ScriptClient001b: 


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _ScriptClient002:
.. figure:: images/testing_scenarios/ScriptsClient/002.png
   :align: center

   ScriptClient002:


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _ScriptClient002b:
.. figure:: images/testing_scenarios/ScriptsClient/002b.png
   :align: center

   ScriptClient002b:


|
|
|
|
|
|
|
|
|
|
|


.. _ScriptClient003:
.. figure:: images/testing_scenarios/ScriptsClient/003.png
   :align: center

   ScriptClient003


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _ScriptClient004:
.. figure:: images/testing_scenarios/ScriptsClient/004.png
   :align: center

   ScriptClient004


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _ScriptClient005:
.. figure:: images/testing_scenarios/ScriptsClient/005.png
   :align: center

   ScriptClient005


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _ScriptClient006:
.. figure:: images/testing_scenarios/ScriptsClient/006.png
   :align: center

   ScriptClient006: 


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _ScriptClient007:
.. figure:: images/testing_scenarios/ScriptsClient/007.png
   :align: center

   ScriptClient007:


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _ScriptClientN001:
.. figure:: images/testing_scenarios/ScriptsClient/001N.png
   :align: center

   ScriptClientN001

|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _ScriptClientN002:
.. figure:: images/testing_scenarios/ScriptsClient/002N.png
   :align: center

   ScriptClientN002


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _ScriptClientN003:
.. figure:: images/testing_scenarios/ScriptsClient/003N.png
   :align: center

   ScriptClientN003


