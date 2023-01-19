Share
======


.. warning::

  Shares is a discontinued feature since OMERO.web 5.9.0. In particular, share creation is no longer
  supported in OMERO.web. However, previously created shares can still be viewed.

  See https://omero-guides.readthedocs.io/projects/introduction/en/latest/data-management.html#shares-discontinued-feature

**To test in**: Web

**Purpose of the test** is to check the Share feature in Web, visibility, and annotation possibility

#. Make sure you have 2 users, in two different groups, e.g. user ``user-1`` and user ``user-4`` in groups
   ``Private`` and ``Read-only`` as described in :doc:`TablePermissionsUsers`.

   - User ``user-1`` has images in ``Private`.
   - User ``user-4`` is not a member of ``Private`` and cannot see the images of ``user-1`` in ``Private``.

#. Log in as ``user-1`` and in ``Private`` select 3 or more images in the left-hand pane, click on the "Globe" icon in the top icon bar to create a share [:ref:`Share001`].

#. |C| that a dialog appears [:ref:`Share002`]. Again, select some images in the tree and use the right-click context menu and choose the ``Create share`` menu item. |C| that the same dialog appears as when you used the "Globe" icon [:ref:`Share002`]. Enter the Message. Choose an expiry date one day after creation [:ref:`Share003`]. Start typing ``sha...`` into the "Members" box and |C| that the filter function offers you sub-selection of users starting with ``sha``. Create a share sharing your images with ``share-2``. 

   - |C| that users on the share (``user-4`` and any other users you have chosen as members of the share) get e-mail with the share Message and link bringing them to the ``Shares`` tab

#. Immediately after this, create another Share with different images with ``user-4``. |C| that the share creation dialog is behaving exactly as when creating the first share.


#. Try to edit (pencil symbol - General tab, right pane).[:ref:`Share004`][:ref:`Share005`]

   - |C| that you can edit the share and save the changes.
   - |C| that when you add a new member to the share, only this new member will get an email, not the other members.
   - |C| that you can disable a Share by ticking off the ``Enable`` box and that after this the share is listed in the tree as light grey.
   - |C| that you can change the expiry date.
   - |C| that when you edit one Share, save the changes and immediately try to edit another share, the changes get updated immediately and the share dialogs change the share you ARE just editing, not the one you HAVE just edited.

#. Remove one image from the share using the scissors icon above left-hand pane
   - |C| that the tree and the middle pane updates

#. Delete one of the images in the share (going back to Data pane and using Delete icon)
   - Load the share in ``Shares`` tab
   - |C| that an ``Object deleted`` item is displayed in the tree.
   - |C| that Delete Key on keyboard has no effect neither on selected images in Share nor on the Share itself in the tree.

#. Log out and log in as user ``user-4``. Go to ``Shares`` tab (left-hand Panel). Select the share.


   - |C| that you CANNOT edit the share - the pencil symbol is not present.
   - |C| that you cannot remove images from the Share.
   - |C| that the number of images in the share [right-hand panel] is correct i.e. Share Count [:ref:`Share006`]
   - |C| that all the panes are available (Preview with all Rnd settings except Save, Acquisition, General with the info, but no Annotations).
   - |C| that you cannot run any scripts on the images (scripts menu is disabled)
   - Double-click on an image in tree and |C| that Full viewer opens.[:ref:`Share007`].
   - Double-click on a thumbnail in central pane and |C| that Full viewer opens.[:ref:`Share007`].
   - Click on the ``Full Viewer`` button in right-hand pane and |C| that Full Viewer opens [:ref:`Share007`]
   - |C| that you can change rendering settings in Full Viewer, but cannot Save the changes.
   - |C| that images in the share cannot be annotated (i.e. rate, tags etc.) i.e. the General tab has no choices in its lower part.[:ref:`Share008`]
   - |C| that you can comment on the share (right-hand pane).
   - |C| that all members of the share get an email (you might need to wait for the incoming emails, they do not necessarily come all at one timepoint)





	.. _Share001:
	.. figure:: /images/testing_scenarios/Share/001.png
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


	.. _Share002:
	.. figure:: /images/testing_scenarios/Share/002.png
	   :align: center

	   Share002:


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
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
	.. figure:: /images/testing_scenarios/Share/003.png
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
	.. figure:: /images/testing_scenarios/Share/004.png
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
	.. figure:: /images/testing_scenarios/Share/005.png
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
	.. figure:: /images/testing_scenarios/Share/006.png
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
	.. figure:: /images/testing_scenarios/Share/007.png
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
	.. figure:: /images/testing_scenarios/Share/008.png
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

