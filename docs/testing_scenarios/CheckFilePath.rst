Check Filepath (FS)
===================



**To test in**: Web, Insight

**Purpose of the test** is to check the filepath to the image which is shown in clients in OMERO 5

#. Click on an image imported in OMERO 5. Go to the right-hand pane, tab ``General``, (see [:ref:`CheckFilePath002ina`, :ref:`CheckFilePath002wa`]). Click onto the filepath icon, see ([:ref:`filepath icon`][:ref:`filepath icon web`]). 


   - |C| that in Insight, a new window pops up with the paths of the files associated with the chosen image will appear under the icon [:ref:`CheckFilePath004`].
   - |C| that in Web, a pane with the paths of the files associated with the chosen image appears under the icon [:ref:`CheckFilePath003w`].


#. Go to the server and find the file according to the given filepath.


   - Go to the server, directory `/OMERO/ManagedRepository/<filepath>` [:download:`Path example <downloads/check_path.txt>`].
   - |C| that the path shown in the clients and the filepath on the server match 


#. (Insight only) Select an in-place imported file and click on ``Show File paths...``. 

   - |C| that the path to the original file is shown and not the path inside the data repository [:ref:`CheckFilePath004`]. 
   - |C| that the file has an icon to the right of its ``Image ID`` number in the right-hand pane [:ref:`CheckFilePath004a`][:ref:`CheckFilePath005`].
   - Move the mouse over this in-place import icon and |C| that the tooltip stays open long enough for a comfortable read [:ref:`CheckFilePath006`]. 
   - |C| that clicking on ``Show file paths`` inside this tooltip will show the same as clicking on ``Show file paths...`` in the toolbar [:ref:`CheckFilePath004`].

#. Repeat steps 1, 2 and 3 with multi-image file, like `test_images_good/lei/leica-original/050118.lei`.



#. For the mixed OMERO 5-imported & OMERO 4-imported database:

   - Import an image in OMERO 5 and do steps 1, 2 and 3.
   - Click on an image imported in OMERO 4.
   - |C| that you cannot see the icon described in step 1



	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _CheckFilePath002ina:
	.. figure:: images/testing_scenarios/CheckFilePathFS/002ina.png
	   :align: center

	   top of General tab in Insight

	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _filepath icon:
	.. figure:: images/testing_scenarios/CheckFilePathFS/002in.png
	   :align: center

	   filepath icon Insight

	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _CheckFilePath002wa:
	.. figure:: images/testing_scenarios/CheckFilePathFS/002wa.png
	   :align: center

	   top of General tab in Web

	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _filepath icon web:
	.. figure:: images/testing_scenarios/CheckFilePathFS/002w.png
	   :align: center

	   filepath icon Web 

	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _CheckFilePath003w:
	.. figure:: images/testing_scenarios/CheckFilePathFS/003w.png
	   :align: center

	   Pane with path Web

	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _CheckFilePath004:
	.. figure:: images/testing_scenarios/CheckFilePathFS/004.png
	   :align: center

	   Popup window with path Insight

	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _CheckFilePath004a:
	.. figure:: images/testing_scenarios/CheckFilePathFS/004a.png
	   :align: center

	   In-place icon Insight large view

	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _CheckFilePath005:
	.. figure:: images/testing_scenarios/CheckFilePathFS/005.png
	   :align: center

	   In-place icon Insight

	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _CheckFilePath006:
	.. figure:: images/testing_scenarios/CheckFilePathFS/006.png
	   :align: center

	   Tooltip of In-place icon Insight

	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|



