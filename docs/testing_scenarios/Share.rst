Share
=====


.. warning::

  Shares is a discontinued feature since OMERO.web 5.9.0. In particular, share creation is no longer
  supported in OMERO.web. However, previously created shares can still be viewed.

  See https://omero-guides.readthedocs.io/projects/introduction/en/latest/data-management.html#shares-discontinued-feature

.. _Noteshare:

.. note::

  In case OMERO.iviewer is installed on the server, opening of the image in full viewer steps will fail. Instead, iviewer opens a dialog saing ``Image not found``.

**To test in**: Web

**Purpose of the test** is to check the Share feature in Web, visibility, and annotation possibility

#. Make sure you have 2 users, in two different groups, e.g. user ``user-1`` and user ``user-3`` in groups
   ``private-1`` and ``read-annotate-1`` as described in :doc:`TablePermissionsUsers`

   - User ``user-3`` has images in ``read-annotate-1``.
   - User ``user-1`` is not a member of ``read-annotate-1`` and cannot see the images of ``user-3`` in ``read-annotate-1``.

#. Log in as ``user-3`` and in ``read-annotate-1``, select an image and click on the “Globe” icon in the top icon bar [:ref:`Share001`]

   - |C| that a pop-up dialog is displaying indicating that Shares are not supported.

#. Select 3 or more images in the left-hand pane, note their IDs and use the :download:`create_share.py </downloads/create_share.py>`
   script to create a share of these images with `user-1`::

       python create_share.py user-1 image_id_1 image_id_2 image_id_3

   - go to the Shares tab
   - |C| that the share has been created with the correct number of images

#. Try to edit (pencil symbol - General tab, right pane).[:ref:`Share004`][:ref:`Share005`]

   - |C| that you can edit the share and save the changes.
   - |C| that you can disable the Share by ticking off the ``Enable`` box and that after this the share is listed in the tree as light grey.
   - |C| that you can change the expiry date. [:ref:`Share003`]
   - |C| that when you edit one Share, save the changes and immediately try to edit another share, the changes get updated immediately and the share dialogs change the share you ARE just editing, not the one you HAVE just edited.

#. Remove one image from the share using the scissors icon above left-hand pane

   - |C| that the tree and the middle pane updates

#. Delete one of the images in the share going back to Data pane and using the Delete icon

   - Reload the share in ``Shares`` tab
   - |C| that an ``Object deleted`` item is displayed in the tree.
   - |C| that Delete Key on keyboard has no effect neither on selected images in Share nor on the Share itself in the tree.

#. Log out and log in as user ``user-1``. Go to ``Shares`` tab (left-hand Panel). Select the share.

   - |C| that you CANNOT edit the share - the pencil symbol is not present.
   - |C| that you cannot remove images from the Share.
   - |C| that the number of images in the share [right-hand panel] is correct i.e. Share Count [:ref:`Share006`]
   - |C| that all the panes are available (Preview with all Rnd settings except Save, Acquisition, General with the info, but no Annotations).
   - |C| that you cannot run any scripts on the images (scripts menu is disabled)
   - Note :ref:`limitation of Full viewer <Noteshare>`. Double-click on an image in tree and |C| that Full viewer opens.[:ref:`Share007`].
   - Note :ref:`limitation of Full viewer <Noteshare>`. Double-click on a thumbnail in central pane and |C| that Full viewer (the old, inbuilt viewer of OMERO.web) opens.  [:ref:`Share007`].
   - Note :ref:`limitation of Full viewer <Noteshare>`. Click on the ``Full Viewer`` button in right-hand pane and |C| that Full Viewer opens [:ref:`Share007`]
   - Note :ref:`limitation of Full viewer <Noteshare>`. |C| that you can change rendering settings in Full Viewer, but cannot Save the changes.
   - |C| that images in the share cannot be annotated (i.e. rate, tags etc.) i.e. the General tab has no choices in its lower part.[:ref:`Share008`]
   - |C| that you can comment on the share (right-hand pane).





	.. _Share001:
	.. figure:: images/testing_scenarios/Share/001.png
	   :align: center

	   Share001: 


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Share003:
	.. figure:: images/testing_scenarios/Share/003.png
	   :align: center
	 

	   Share003


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	


	.. _Share004:
	.. figure:: images/testing_scenarios/Share/004.png
	   :align: center

	   Share004: 


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Share005:
	.. figure:: images/testing_scenarios/Share/005.png
	   :align: center

	   Share005:


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Share006:
	.. figure:: images/testing_scenarios/Share/006.png
	   :align: center

	   Share006


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Share007:
	.. figure:: images/testing_scenarios/Share/007.png
	   :align: center

	   Share007: 


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _Share008:
	.. figure:: images/testing_scenarios/Share/008.png
	   :align: center

	   Share008:
	
	
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|

