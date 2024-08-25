Edit
====




**To test in**: Web, Insight

**Purpose of the test** is to check that the entities are editable smoothly and that the edited/changed texts are being respected

#. Edit project [:ref:`Edit001`], dataset  [:ref:`Edit002`], image [:ref:`Edit003`], screen [:ref:`Edit004`], plate [:ref:`Edit005`], plate run [:ref:`Edit006`].

   - Edit name (right panel, use pencil icon) [:ref:`Edit008`]
   - Edit description
   - |C| in Web, that the text you put in is escaped properly, this means for example enter special html signs (e.g. <>), or scripts (e.g. '<script>alert('hello')</script>'). The Web application should not interpret them but take them as entered

#. Edit channels. 
   
   - Edit channels of an Image 

      Go to a dataset with images which have different number of channels (e.g. some images in the dataset will have 3 channels, some 5 channels). Select an image)
   
      - Edit a channel [:ref:`Edit001N`, :ref:`Edit001NWeb`, :ref:`Edit002N`, :ref:`Edit002NWeb`, :ref:`Edit002Nb`]
      - |C| that when you try to paste very long string into the name box, the string is truncated at 255 characters. 
      - Click Save
      - |C| that when doing this in Full Viewer in Insight, the channel name in the boxes to the left of the image [:ref:`Edit001NN`] are displayed in full when <7 characters. When >7 characters, the front of the name is truncated (the end is visible only in the box.)
      - In the same image, edit channels again, this time click "Apply to All"
      - |C| that the warning message is displayed [:ref:`Edit003N` :ref:`Edit003NWeb`].
      - Click Save (or "Continue" in Insight) and |C| that the changes were made only on images with the same number of channels, but NOT on images with different number of channels (e.g. only 3 channel images channel names are changed when a 3 channel image was selected, NO changes on 5 channel images in ANY of the channels)
      - Edit channels again, click "Apply to All", then click Cancel and |C| that the original channel names are reset
      - Open an image in Full Viewer, edit channels, make changes, click Save (Full Viewer is still open) [:ref:`Edit004N`, :ref:`Edit004NWeb`] and |C| that the changes are immediately displayed also in Full Viewer [:ref:`Edit005N`, :ref:`Edit005NWeb`]

   - Edit channels of a Plate

      Choose a plate, click on a well sample, edit the channels, make changes and click "Apply to All" [:ref:`Edit006N`, :ref:`Edit006NWeb`, :ref:`Edit006Nb`,  :ref:`Edit006NbWeb`]



#. Edit share (Web only) [:ref:`Edit009`][:ref:`Edit010`], 



	.. _Edit001:
	.. figure:: images/testing_scenarios/Edit/001.png
	   :align: center

	   Edit001  


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Edit002:
	.. figure:: images/testing_scenarios/Edit/002.png
	   :align: center

	   Edit002 


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Edit003:
	.. figure:: images/testing_scenarios/Edit/003.png
	   :align: center

	   Edit003


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Edit004:
	.. figure:: images/testing_scenarios/Edit/004.png
	   :align: center

	   Edit004


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Edit005:
	.. figure:: images/testing_scenarios/Edit/005.png
	   :align: center

	   Edit005


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Edit006:
	.. figure:: images/testing_scenarios/Edit/006.png
	   :align: center

	   Edit006  


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Edit008:
	.. figure:: images/testing_scenarios/Edit/008.png
	   :align: center

	   Edit008


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Edit009:
	.. figure:: images/testing_scenarios/Edit/009.png
	   :align: center

	   Edit009  


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Edit010:
	.. figure:: images/testing_scenarios/Edit/010.png
	   :align: center

	   Edit010  
	
	
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Edit001N:
	.. figure:: images/testing_scenarios/Edit/001N.png
	   :align: center

	   Edit001N  
	
	
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Edit001NN:
	.. figure:: images/testing_scenarios/Edit/001NN.png
	   :align: center

	   Edit001NN  
	
	
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Edit001NWeb:
	.. figure:: images/testing_scenarios/Edit/001NWeb.png
	   :align: center

	   Web client  
	
	
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Edit002N:
	.. figure:: images/testing_scenarios/Edit/002N.png
	   :align: center

	   Edit002N  
	
	
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Edit002NWeb:
	.. figure:: images/testing_scenarios/Edit/002NWeb.png
	   :align: center

	   Web Client  
	
	
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Edit002Nb:
	.. figure:: images/testing_scenarios/Edit/002Nb.png
	   :align: center

	   002Nb  
	
	
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Edit003N:
	.. figure:: images/testing_scenarios/Edit/003N.png
	   :align: center

	   Edit003N  
	
	
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Edit003NWeb:
	.. figure:: images/testing_scenarios/Edit/003NWeb.png
	   :align: center

	   Web Client  
	
	
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Edit004N:
	.. figure:: images/testing_scenarios/Edit/004N.png
	   :align: center

	   Edit004N  
	
	
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Edit004NWeb:
	.. figure:: images/testing_scenarios/Edit/004NWeb.png
	   :align: center

	   Web client  
	
	
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Edit005N:
	.. figure:: images/testing_scenarios/Edit/005N.png
	   :align: center

	   Edit005N  
	
	
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Edit005NWeb:
	.. figure:: images/testing_scenarios/Edit/005NWeb.png
	   :align: center

	   Web client  
	
	
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Edit006N:
	.. figure:: images/testing_scenarios/Edit/006N.png
	   :align: center

	   006N  
	
	
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Edit006NWeb:
	.. figure:: images/testing_scenarios/Edit/006NWeb.png
	   :align: center

	   Web Client  
	
	
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Edit006Nb:
	.. figure:: images/testing_scenarios/Edit/006Nb.png
	   :align: center

	   006Nb  
	
	
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Edit006NbWeb:
	.. figure:: images/testing_scenarios/Edit/006NbWeb.png
	   :align: center

	   Web Client b  
	
	
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
