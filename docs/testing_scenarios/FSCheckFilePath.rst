FS Check Filepath
=================



``To test in``: Web, Insight

``Purpose``: Check the filepath to the image which is shown in clients in FS.

#. Click on an image imported in FS. Go to the right-hand pane, tab "General". Click onto the filepath icon [:ref:`FSCheckFilePath001in`, :ref:`FSCheckFilePath002in`, :ref:`FSCheckFilePath002w`]. A table with the paths of the files associated with the chosen image will appear under the icon [:ref:`FSCheckFilePath003in`, :ref:`FSCheckFilePath003w`].

#. Go to the server and find the file according to the given filepath.


   - Go to the server, directory `/OMERO/ManagedRepository/<filepath>` :ref:`Example <label-name2>`.
   - |C| that the path displayed in the clients and the filepath on the server match. 

#. Repeat steps 1 and 2 with multi-image file, like `lei`.


	.. _FSCheckFilePath001in:
	.. figure:: images/testing_scenarios/CheckFilePathFS/001in.png
	   :align: center

	   CheckFilePath001Insight


	.. _FSCheckFilePath002in:
	.. figure:: images/testing_scenarios/CheckFilePathFS/002in.png
	   :align: center

	   CheckFilePath002Insight


	.. _FSCheckFilePath002w:
	.. figure:: images/testing_scenarios/CheckFilePathFS/002w.png
	   :align: center

	   CheckFilePath002Web


	.. _FSCheckFilePath003in:
	.. figure:: images/testing_scenarios/CheckFilePathFS/003in.png
	   :align: center

	   CheckFilePath003Insight


	.. _FSCheckFilePath003w:
	.. figure:: images/testing_scenarios/CheckFilePathFS/003w.png
	   :align: center

	   CheckFilePath003Web


.. _label-name2:

	::

		omero@gretzky:~$ cd /OMERO/ManagedRepository/
		omero@gretzky:/OMERO/ManagedRepository$ cd user-4_5/2013-04/10/05-29-24.598
		omero@gretzky:/OMERO/ManagedRepository/user-4_5/2013-04/10/05-29-24.598$ ls -al
		total 162732
		drwxr-xr-x  2 omero omero      4096 2013-04-10 05:29 .
		drwxr-xr-x 17 omero omero      4096 2013-04-10 05:55 ..
		-rw-r--r--  1 omero omero     53420 2013-04-10 05:29 CMU-1.centerFocusObj
		-rw-r--r--  1 omero omero     53432 2013-04-10 05:29 CMU-1.centerScanObj
		-rw-r--r--  1 omero omero     43836 2013-04-10 05:29 CMU-1.FocalPlane
		-rw-r--r--  1 omero omero    126503 2013-04-10 05:29 CMU-1.FocalPlane-0
		-rw-r--r--  1 omero omero    117871 2013-04-10 05:29 CMU-1.FocalPlane-1
		-rw-r--r--  1 omero omero    125735 2013-04-10 05:29 CMU-1.FocalPlane-2
		-rw-r--r--  1 omero omero    121178 2013-04-10 05:29 CMU-1.FocalPlane-3
		-rw-r--r--  1 omero omero    136720 2013-04-10 05:29 CMU-1.FocalPlane-4
		-rw-r--r--  1 omero omero     83714 2013-04-10 05:29 CMU-1.FocalPlane-5
		-rw-r--r--  1 omero omero       153 2013-04-10 05:29 CMU-1.FocalPlane-draw
		-rw-r--r--  1 omero omero    355290 2013-04-10 05:29 CMU-1.Full
		-rw-r--r--  1 omero omero     13657 2013-04-10 05:29 CMU-1.hist
		-rw-r--r--  1 omero omero    949624 2013-04-10 05:29 CMU-1.ROI
		-rw-r--r--  1 omero omero        27 2013-04-10 05:29 CMU-1.ROI-draw
		-rw-r--r--  1 omero omero    328487 2013-04-10 05:29 CMU-1.Safe
		-rw-r--r--  1 omero omero        14 2013-04-10 05:29 CMU-1.sld
		-rw-r--r--  1 omero omero      1793 2013-04-10 05:29 CMU-1.slt
		-rw-r--r--  1 omero omero        35 2013-04-10 05:29 CMU-1.slx
		-rw-r--r--  1 omero omero 163649046 2013-04-10 05:29 CMU-1.tif
		-rw-r--r--  1 omero omero    319488 2013-04-10 05:29 CMU-1.tif-0b
		-rw-r--r--  1 omero omero     79872 2013-04-10 05:29 CMU-1.tif-1b
		-rw-r--r--  1 omero omero     19968 2013-04-10 05:29 CMU-1.tif-2b
		

        Example of a filepath - command line output
