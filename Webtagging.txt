Webtagging
==========



**To test in**: Web

**Purpose of the test** is to check the Auto Tag and Tag Search Web applications.

**Section 1: Auto Tag**

#. Have some images imported to a Dataset. The names of the images should contain spaces and/or underscores such as ``my_file_foo_numberx.dv`` where x is 1, 2 and 3 consecutively. Note that for the purposes of this test you cannot perform renaming of the images in OMERO, you have to have the images either pre-imported or rename them locally, then import. Backslash, forward slash, period and underscore are the characters on which the tokenizing of the names in Auto Tag happens. 

#. Select the Dataset or any image inside the Dataset and

   - Select one of the images you just imported/found and
   - On the right-hand side above the central pane, find the Dropdown menu saying ``Thumbnails`` 

#. Change the selection in this menu to ``Auto Tag``

   - You can see either:

     - no columns with tag suggestions in the central pane [:ref:`Screenshot001`]
     - or any combination of:

       - columns headed by pink buttons for tokens not mapped to any existing tags, and thus Autotag suggests new tags for these tokens, or for tokens which match more than one existing tag (i.e. Autotag does not know which of the existing tags to pick)
       - columns headed by blue buttons for tokens mapped to tags that already exist on the server (Note: the suggestion of an existing tag can be created also manually, by expanding the menu under a pink button and selecting an existing tag -> the button becomes blue)
       - columns headed by a green, existing Tags buttons that indicate tags already attached to an image (but not matched by any token in this dataset)
       - and a column of image names on the right [:ref:`Screenshot002`] 

   - If you see no columns in the central pane, then select the ``Show unmapped`` checkbox.

   - |C| that you can now see a slider which is by default at the value ``2`` (or ``1`` in case there is just one image in the Dataset) in the top right corner of the central pane.

   - |C| that when you slide the slider to the right, the number of columns in the central pane decreases, if you slide to the left, it increases. If you for example used the image names as suggested above, you should see the ``numberx`` columns only when you slide the slider to position ``1`` (i.e. to the extreme left).

#. If no columns headed by pink buttons are visible, make sure ``Show unmapped`` is checked, move the slider to position ``1`` . Select the arrow on the right-hand side of the pink button above a column and from the menu select ``New/Existing Tag``

   - In the dialog [:ref:`Screenshot003`], leave the default values and click ``Map``
   - |C| the button has changed from pink to blue and is labelled with the suggested tag name.
   - |C| the checkboxes in the appropriate rows are checked (i.e. images which have the corresponding token in their name).
   - |C| that when you now click the Apply button, the cells with selected checkboxes become green  [:ref:`Screenshot004`]
 
#. Repeat step 4 for at least 2 or 3 columns.

   - |C| that when you select an image in left-hand pane, for each green cell located next to its name in the central pane there is a corresponding tag (displayed in right-hand pane).

#. Import images again, with similar but different names, such as ``my_file_foo_numberx.dv`` where x is bigger than 3 into another Dataset and select one of the images.
   
   - Change selection in the central pane to ``Auto Tag``
   - |C| that now you can see the tag suggestions which you created previously on the first batch of images [:ref:`Screenshot005`]. Click on Apply and |C| that the cells with selected checkboxes in the sheet turn green and the tags are applied to the images accordingly.

**Section 2: Tag Search**

#. On the left-hand side of the main toolbar [:ref:`Screenshot006`] select the Tag Search tab. 

#. In the left-hand pane, select the ``Preview`` checkbox.

#. Click into the ``Selected Tags`` field and |C| that you can see the list of available tags [:ref:`Screenshot007`].

   - Select one of the tags, and |C| that at least one item appears in the central pane.
   - |C| that the selected tag appears in the ``Selected Tags`` field.
   - Click again into the Selected Tags field (next to the displayed tag) and select a tag from the menu again.
   - |C| that this new tag appears in the field ``Selected Tags`` next to the previously selected one.
   - |C| that when you select an item (e.g. Image/Dataset...) in the central pane and expand the ``Tags`` harmonica in the right-hand pane, you can see that the item is tagged with both the tags highlighted in the ``Selected Tags`` field. 

|
|
|

.. _Screenshot001:
.. figure:: /images/testing_scenarios/Webtagging/001.png
   :align: center

   Screenshot001: 


|
|
|
|
|
|
|
|

.. _Screenshot002:
.. figure:: /images/testing_scenarios/Webtagging/002.png
   :align: center

   Screenshot002: 


|
|
|
|
|
|
|
|
|

.. _Screenshot003:
.. figure:: /images/testing_scenarios/Webtagging/003.png
   :align: center

   Screenshot003: 


|
|
|
|
|
|
|
|

.. _Screenshot004:
.. figure:: /images/testing_scenarios/Webtagging/004.png
   :align: center

   Screenshot004: 


|
|
|
|
|
|
|
|

.. _Screenshot005:
.. figure:: /images/testing_scenarios/Webtagging/005.png
   :align: center

   Screenshot005: 


|
|
|
|
|
|
|

.. _Screenshot006:
.. figure:: /images/testing_scenarios/Webtagging/006.png
   :align: center

   Screenshot006: 

|
|
|
|
|
|
|
|
|

.. _Screenshot007:
.. figure:: /images/testing_scenarios/Webtagging/007.png
   :align: center

   Screenshot007: 

|
|
|
