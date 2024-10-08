OMERO.searcher
==============




**To test in**: Web

**Purpose of the test** is to check that the OMERO.searcher as an OMERO.Web application is functioning correctly.

NB: Because the image features are being stored in two different places, which may occasionally get out of sync, it is important to run the ``Omero searcher Rebuild Content DB`` script in following cases:
   - after you deleted features
   - after you got an error when calculating features normally (= as described in step 2 below)
   - after you disabled content DB update (by ticking a box in the feature calculation script, see step 4 below)


#. Login to the server mentioned in PR or testing setup.



#. Run the Feature Calculation script "normally"

   - Select an image and go Scripts > searcher > Omero searcher feature calculation [:ref:`OMERO.searcher001a`]
   - In the script dialog, make sure you tick ``Advanced Features`` and ``Recalculate Existing Features`` [:ref:`OMERO.searcher001b`]
   - Do not tick ``Disable ContentDB Update`` [:ref:`OMERO.searcher001b`]
   - |C| that an attachment was created with the calculated features (cannot be viewed atm)

#. Run 2 Feature Calculation scripts in parallel with an error

   - make sure you have 2 projects or datasets ready with many images in each of them
   - start the Feature Calculation script as in step 2 above on one of the 2 P/Ds
   - immediately (when the previous calculation is still in progress) start a second Feature Calculation script running on the other P/D
   - |C| that you get an error in the script run saying something like ``WARNING:omero.gateway:OptimisticLockException on <class 'omero.gateway.OmeroGatewaySafeCallWrapper'>``

#. Run 2 Feature Calculation scripts in parallel without any error

   - repeat step 3, this time checking the box ``Advanced Features``, ``Recalculate Existing Features`` AND ``Disable ContentDB Update`` in both script runs [:ref:`OMERO.searcher002`]
   - |C| that this time both scripts ended successfully and the attachments on images inside the datasets (not on the datasets themselves) were created

#. Run ``Rebuild Content DB`` script

   - Go Scripts > searcher > Rebuild Content DB 
   - |C| that the script ended up successfully  [:download:`002b <downloads/Output_rebuild_ContentDB.txt>`].

#. Search for images

   - Select an image which you have calculated the features for.    
   - Go to the ``searcher`` tab (right-hand pane).
   - Select the Featureset for which you Rebuilt Content DB [:ref:`OMERO.searcher003`]
   - Click ``Do Search``
   - |C| that a list of images was found in the middle panel

#. Refine search

   - In the list of images found in previous step, select the positive and negative examples to refine your search (click the radio button)
   - Click the ``Refine Search`` button in the left-hand pane
   - |C| that the search results match now better the original image
   - Change the Retrieved images number from 100 to 20
   - Click ``Refine Serach``
   - |C| that the results are now identical with the top 20 results of the previous search
   - Change the Retrieved images number back to 100
   - |C| that after click on "Refine Search" you get the same results as before
   - |C| that there are no duplicates in the search results
   - |C| that the images you deemed to be ``negative`` do not appear in the search results or appear near the end of the search results if there are not many images in the database.

#. Additional search filters

   - Click ``Enable additional search filters (may slow down queries).``
   - Deselect some of the Projects / Datasets
   - Click ``Refine Search``
   - |C| that the search results are filtered as intended

#. Change group in OMERO.web (from a default group to non-default group or the other way round) and start a new search

   - |C| that the search results are taken only from the group you have on display, not the other group.


	.. _OMERO.searcher001a:
	.. figure:: images/testing_scenarios/OMEROsearcher/001a.png
	   :align: center

	   OMERO.searcher001a: 


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _OMERO.searcher001b:
	.. figure:: images/testing_scenarios/OMEROsearcher/001b.png
	   :align: center

	   OMERO.searcher001b:


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _OMERO.searcher002:
	.. figure:: images/testing_scenarios/OMEROsearcher/002.png
	   :align: center

	   OMERO.searcher002


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _OMERO.searcher003:
	.. figure:: images/testing_scenarios/OMEROsearcher/003.png
	   :align: center

	   OMERO.searcher003
