View Image
==========



**To test in**: Web, Insight

**Purpose of the test** is to test the View feature on multiple z/t image and to check the z-Projection creation functionality

If you test work on other's data (permissions) go first to :ref:`Section 2: Work on others data <label-name>`

**Section 1:**

.. _view-work-own:

#. Import an image with several channels/timepoint/z-sections. [:ref:`View001`].

#. Turn on/off channels, use z-slider and t-slider and play channels movie and z/t movie.

#. Go to the split-view (=multi-channel in Web). Turn channels on/off, user z and t-sliders.

#. Find a ``FLIM-modulo-sample.ome.tiff`` image (either it was pre-imported for you under ``FLIM`` Project or Dataset or import it from `here <https://downloads.openmicroscopy.orgimages/OME-TIFF/2016-06/modulo/>`_.

   - |C| that when you move either the ``T`` or the ``t`` slider, the ``True-T`` (for ``T``) and ``Sub-T`` (for ``t``) changes accordingly (=the correct ``T`` and ``t`` planes are shown)
   - |C| that when you play ``T`` or ``t`` movie, again, the planes display changes accordingly and the movie stops as expected at the last plane.

#. Toggle back between views.

#. Turn on/off color/greyscale

#. Modify the rendering settings.

#. Click on Projection tab if enabled:[:ref:`FSView002`]  - in Web, click on "Max Intensity" instead

   - Preview the projection [:ref:`FSView002`] (Insight only)
   - Change the projection range (Insight only).
   - Change the projection type (Maximum or Mean - double arrow menu next to "Intensity") [:ref:`FSView003`] (Insight only).
   - Project the image.[:ref:`FSView004`][:ref:`FSView005`] (Insight only)
   - |C| the result [:ref:`FSView006`] (Insight; Web - the result will appear in the full viewer window after click on "Max Intensity")

#. Save as (Insight only):

   - JPEG, PNG - use the icon in the projection window, see [:ref:`View007`][:ref:`View008`]
   - Save split channels.[:ref:`View008`]
   - Save with all channels turned off.
   - |C| the saved files.

**End of Section 1: working on own data**

---------------------------------------------------------------------------------------------------------------------------------

.. _label-name:

**Section 2: Work on other users' data**

Note: Projection (step 7 in Section 1) has different permission levels than the View action. Projection has the same permissions as the "Link/Unlink" action. 

- |C| the permissions of the user you have been assigned to use here: :ref:`Table of permissions-users <Table-of-permissions-users>`
- |C| whether you CAN (=Y) or CANNOT (=N) view others' data in the table below.



.. tabularcolumns:: |l|c|c|c|

==================== ======= ========== ================ ================
   CAN VIEW?         Private Read-only  Read-annotate     Read-write
==================== ======= ========== ================ ================
Group Administrator    Y        Y           Y                  Y
-------------------- ------- ---------- ---------------- ----------------
   Group Owner         Y        Y           Y                  Y
-------------------- ------- ---------- ---------------- ----------------
   Group Member        N        Y           Y                  Y
==================== ======= ========== ================ ================

#. Switch to Group Display (Insight) or put "All members" to display (Web). Go through the steps 2.- 8. :ref:`above <view-work-own>` and

   - Start viewing the data in Web first, then Insight
   - |C| that you CAN/CANNOT (as appropriate) view others' images
   - |C| that you CAN/CANNOT (as appropriate) view others' plates
   - |C| that you CAN/CANNOT (as appropriate) make Projections of others' images and that the resulting projection is in the Dataset with the projected image


#. Switch to User Display (Insight) or put a single member to display (Web). o through the steps 2.- 8. :ref:`above <view-work-own>` and

   - Start viewing the data in Web first, then Insight
   - |C| that you CAN/CANNOT (as appropriate) view others' images
   - |C| that you CAN/CANNOT (as appropriate) view others' plates
   - |C| that you CAN/CANNOT (as appropriate) make Projections of others' images and that the resulting projection is in the Dataset with the projected image







	.. _View001:
	.. figure:: images/testing_scenarios/ViewImage/001.png
	   :align: center
	   :width: 100%

	   View001: 


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _View002:
	.. figure:: images/testing_scenarios/ViewImage/002.png
	   :align: center

	   View002:


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _View003:
	.. figure:: images/testing_scenarios/ViewImage/003.png
	   :align: center

	   View003


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _View004:
	.. figure:: images/testing_scenarios/ViewImage/004.png
	   :align: center

	   View004


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _View005:
	.. figure:: images/testing_scenarios/ViewImage/005.png
	   :align: center

	   View005


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _View006:
	.. figure:: images/testing_scenarios/ViewImage/006.png
	   :align: center
	 

	   View006: 


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _View007:
	.. figure:: images/testing_scenarios/ViewImage/007.png
	   :align: center

	   View007:


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _View008:
	.. figure:: images/testing_scenarios/ViewImage/008.png
	   :align: center
	 

	   View008



	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|

