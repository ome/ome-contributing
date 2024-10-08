FS Delete
=========



``Test in``: Web, Insight

``Purpose``: Check the Delete function on all entities (except ROI).

.. only:: html

      **Download both Gretzky and Howe builds and compare the speed of the workflow on the same images on Gretzky vs Howe. Test ALL images and plates pre-loaded on Gretzky and Howe, see:**
      `FS testing table <https://docs.google.com/spreadsheet/ccc?key=0AoMHD4RIe-94dHJabm9UWVo0VzRqVnhBalk1eEJKZlE#gid=4>`_ 

.. only:: latex

      **Compare the speed of the workflow on the same images on FS-demo build vs non-FS build (the most recent non-FS release).** 

#. In the DataManager:

   - Delete Ratings (Insight only) 
   - Delete Comments (right-hand pane).
   - Delete Attachments [:ref:`FSdelete001`][:ref:`FSdelete002`] (left-hand pane in Insight, right-hand pane in Web).
   - Delete Tags [:ref:`FSdelete003`][:ref:`FSdelete004`] (left-hand pane).

#. Delete P/D/I/Screen/Plate [:ref:`FSdelete005`][:ref:`FSdelete006`][:ref:`FSdelete007`][:ref:`FSdelete008`].

#. Import an image rich in metadata (e.g. ``zvi``) and delete it.

#. Import a multi-image fileset (= MIF, for example `lei` or ``lif`` = ``Leica`` and ``Leica Image File Format``). Choose one image of the MIF only and press Delete. 
   
   - |C| that the action does not proceed [:ref:`FSdelete009`, :ref:`FSdelete010`].
   - NB: You cannot delete just a part of a MIF, you have to select the whole MIF in order for the action to go through.

#. Choose all the images in the MIF and try to Delete them.

   - |C| that this time the Delete action proceeds successfully [:ref:`FSdelete011`, :ref:`FSdelete012`].

#. Create a new dataset, cut one of the images of the MIF and paste it into the newly created dataset. Select the original dataset (with all the MIF images minus one). Try to delete it.

   - |C| that the action does not proceed [:ref:`FSdelete013`, :ref:`FSdelete014`].

#. Cut and paste the image you manipulated in the last step back into the original dataset -> the MIF should now be complete. Select the dataset with the complete MIF and try to delete it.
   
   - |C| that this time the Delete action proceeds successfully [:ref:`FSdelete015`, :ref:`FSdelete016`].

.. _FSdelete001:
.. figure:: images/testing_scenarios/Delete/001.png
   :align: center

   FSdelete001 


.. _FSdelete002:
.. figure:: images/testing_scenarios/Delete/002.png
   :align: center

   FSdelete002


.. _FSdelete003:
.. figure:: images/testing_scenarios/Delete/003.png
   :align: center

   FSdelete003


.. _FSdelete004:
.. figure:: images/testing_scenarios/Delete/004.png
   :align: center

   FSdelete004


.. _FSdelete005:
.. figure:: images/testing_scenarios/Delete/005.png
   :align: center

   FSdelete005


.. _FSdelete006:
.. figure:: images/testing_scenarios/Delete/006.png
   :align: center

   FSdelete006 


.. _FSdelete007:
.. figure:: images/testing_scenarios/Delete/007.png
   :align: center

   FSdelete007


.. _FSdelete008:
.. figure:: images/testing_scenarios/Delete/008.png
   :align: center

   FSdelete008

.. _FSdelete009:
.. figure:: images/testing_scenarios/Delete/009.png
   :align: center

   FSdelete009

.. _FSdelete010:
.. figure:: images/testing_scenarios/Delete/010.png
   :align: center

   FSdelete010


.. _FSdelete011:
.. figure:: images/testing_scenarios/Delete/011.png
   :align: center

   FSdelete011


.. _FSdelete012:
.. figure:: images/testing_scenarios/Delete/012.png
   :align: center

   FSdelete012


.. _FSdelete013:
.. figure:: images/testing_scenarios/Delete/013.png
   :align: center

   FSdelete013


.. _FSdelete014:
.. figure:: images/testing_scenarios/Delete/014.png
   :align: center

   FSdelete014


.. _FSdelete015:
.. figure:: images/testing_scenarios/Delete/015.png
   :align: center

   FSdelete015


.. _FSdelete016:
.. figure:: images/testing_scenarios/Delete/016.png
   :align: center

   FSdelete016

