Delete
======



**To test in**: Web, Insight

**Purpose of the test** is to check the Delete function on all entities (except ROI)


If you test work on others' data (permissions) go first to :ref:`Section 2: Work on others' data <label-Delete>`

**Section 1: Work on your own data**

.. _delete-work-own:

#. In the DataManager:

   - Delete Ratings, Delete Comments (right-hand pane)
   - Delete attachments [:ref:`Delete001`] in left-hand pane in Insight (``Attachments`` tab)
   - Delete attachments in right hand pane in Insight and Web (``General`` pane). In Insight, click ``Remove`` on a file attachment which is not linked to anything else and |C| that a warning popup appears. The deletion will be executed only in case the attachment is not linked to anything else. For Web, use the cross symbol [:ref:`Delete002`] to Delete.
   - Delete tags [:ref:`Delete003`, :ref:`Delete004`] (left-hand pane)

#. Delete P/D/I/Screen/Plate. [:ref:`Delete005`, :ref:`Delete006`, :ref:`Delete007`, :ref:`Delete008`]

#. Find or import an image rich in metadata e.g. ``data_repo/test_images_metadata/zeiss-zvi/6ch-Z-stack_deconvolved.zvi`` and delete it.

#. Find or import a multi-image fileset (= MIF, for example ``test_images_good/lei/leica-original/050118.lei`` or ``data_repo/test_images_metadata/leica-lif/Rosier.lif``). Choose one image of the MIF only and press Delete.
   
   - |C| that the action does not proceed [:ref:`Delete009`, :ref:`Delete010`].
   - NB: You cannot delete just a part of a MIF, you have to select the whole MIF in order for the action to go through.

#. Choose all the images in the MIF and try to Delete them.

   - |C| that this time the Delete action proceeds successfully [:ref:`Delete011`, :ref:`Delete012`].

#. Create a new dataset or use an existing one, cut one of the images of the MIF and paste it into the newly created (or existing old) dataset. Select the original dataset (with all the MIF images minus one). Try to delete it.

   - |C| that the action does not proceed [:ref:`Delete013`, :ref:`Delete014`].

#. Cut and paste the image you manipulated in the last step back into the original dataset -> the MIF should now be complete. Select the dataset with the complete MIF and try to delete it.
   
   - |C| that this time the Delete action proceeds successfully [:ref:`Delete015`, :ref:`Delete016`].


**End of Section 1: Work on your own data**

---------------------------------------------------------------------------------------------------------------------------------

.. _label-Delete:

**Section 2: Work on other users' data**

- |C| whether you CAN (=Y) or CANNOT (=N) delete others' data in the testing spreadsheet or if not present there, then in the table below (alternatively see all permissions :omerodoc:`here <sysadmins/server-permissions.html>`)



.. tabularcolumns:: |l|c|c|c|

==================== ======= ========== ================
CAN DELETE ?         Private Read-only  Read-annotate
==================== ======= ========== ================
Group Administrator    Y        Y           Y
-------------------- ------- ---------- ----------------
   Group Owner         Y        Y           Y
-------------------- ------- ---------- ----------------
   Group Member        N        N           N
==================== ======= ========== ================

|

#. Follow the instruction in the testing sheet for the actions in permissions testing.
  

|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _Delete001:
.. figure:: images/testing_scenarios/Delete/001.png
   :align: center

   Delete001 


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _Delete002:
.. figure:: images/testing_scenarios/Delete/002.png
   :align: center

   Delete002


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _Delete003:
.. figure:: images/testing_scenarios/Delete/003.png
   :align: center

   Delete003


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _Delete004:
.. figure:: images/testing_scenarios/Delete/004.png
   :align: center

   Delete004


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _Delete005:
.. figure:: images/testing_scenarios/Delete/005.png
   :align: center

   Delete005


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _Delete006:
.. figure:: images/testing_scenarios/Delete/006.png
   :align: center

   Delete006 


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _Delete007:
.. figure:: images/testing_scenarios/Delete/007.png
   :align: center

   Delete007


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _Delete008:
.. figure:: images/testing_scenarios/Delete/008.png
   :align: center

   Delete008


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _Delete009:
.. figure:: images/testing_scenarios/Delete/009.png
   :align: center

   Delete009


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|




.. _Delete010:
.. figure:: images/testing_scenarios/Delete/010.png
   :align: center

   Delete010


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|



.. _Delete011:
.. figure:: images/testing_scenarios/Delete/011.png
   :align: center

   Delete011


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _Delete012:
.. figure:: images/testing_scenarios/Delete/012.png
   :align: center

   Delete012


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _Delete013:
.. figure:: images/testing_scenarios/Delete/013.png
   :align: center

   Delete013


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _Delete014:
.. figure:: images/testing_scenarios/Delete/014.png
   :align: center

   Delete014

|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _Delete015:
.. figure:: images/testing_scenarios/Delete/015.png
   :align: center

   Delete015

|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _Delete016:
.. figure:: images/testing_scenarios/Delete/016.png
   :align: center

   Delete016



