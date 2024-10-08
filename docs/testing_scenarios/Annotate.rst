Annotate
========



**To test in**: Web, Insight

**Purpose of the test** is to check the Annotate ability (creating as well as viewing) for P/D/I/S/Plates/Plate Acquisitions

**Section 1: General Annotations**

#. Annotate different type of objects i.e. Projects/Datasets/Images/Screens/Plates/Plate Acquisitions (=Plate Run)

   - Comments (right-hand pane [:ref:`Annotate001`])

   - Rating (right-hand pane)

   - Attachments (right-hand pane)

     - Attach local documents
     - Attach uploaded documents. 
      
       - (Insight only) |C| that you can filter the ``Available`` documents [:ref:`Annotate021`]. 





#. Create a file of size 0 and add it as an attachment to P/D/I/S/P/PR.

#. Repeat step 1., selecting each time more than 2 objects for annotation at one go [:ref:`AnnotateM001`].

   - |C| that each of the selected object has been annotated, and you still see the annotation when selecting them one-by-one
   - |C| that when you select the annotated objects together with non-annotated objects, the annotation is still visible in right-hand pane [:ref:`AnnotateM002`]
   
#. Select more than 2 objects and attach an existing Tag. 

#. Select again more than 2 objects, this time choose objects tagged in step 3. as well as untagged objects and try to add the Tag from step 3
   
   - |C| that the Tag is still available for further tagging as long as untagged objects are within your selection [:ref:`AnnotateM007`,  :ref:`AnnotateM008`]

#. Mouse over the annotation name (right-hand pane)

   - Selecting a SINGLE annotated object

        - |C| that the owner of the annotation is indicated, who annotated etc.[:ref:`Annotate002`, :ref:`Annotate003`]

   - Selecting 2 or more objects which you annotated yourself

        - |C| that you can see the annotations [:ref:`AnnotateM003`, :ref:`AnnotateM004`]

   - Selecting 2 or more objects annotated by another user

        - |C| that the link owner is indicated in brackets [:ref:`AnnotateM005`, :ref:`AnnotateM006`]


**Section 2: Tagging**

#. Prepare (if not prepared for you already) by creating around 10 Tags belonging to you as well as to other users and at least 2 Tag Sets with Tags in them. 

#. Bring up the Tagging dialog by clicking on  ``+`` button or (Insight only) by selecting ``Tag`` in the right-click menu [:ref:`Annotate009`, :ref:`Annotate010`].

#. Select a Tag and click add (``>``)

   - |C| that the Tag is added to the ``Selected`` list.

   - |C| that when you select a Tag Set and click add (``>``), all the Tags in the Tag Set move to the ``Selected`` list.

#. (Web and Insight) Make sure you have tagged Project/Dataset/Image/Screen/Plate/Plate Run/Well with at least 1 tag on each of them.

   - Bring up the tagging dialog by clicking on ``+``
   - |C| that the tags available for further tagging in the left-hand pane load as expected.
   - |C| that when you select a tag, transfer it into the right-hand pane and click ``Save``, the tag you selected is added to the existing ones.

#. (Insight only) Add/Remove All 

   - Go to the ``Selected`` list. Select a Tag (contained in a Tag Set) and click remove (<). The Tag should be displayed under the Tag Set in the ``Available`` list.

   - Click on Add All button (``>>``). |C| that only Tags are added to the ``Selected`` list, not any empty Tag Set.

   - Click into the filter box above ``Selected`` list and type - |C| that no Tags are appearing in ``Available`` list after this.

   - Click on Remove All Button (``<<``). |C| that all Tags are moved back.

#. Make sure there are some Tags owned by other users in Read-Only and Private groups. If there are no such Tags there, Log out and Log in as another user in Read-Only group (and/or Private group as necessary) and create two or more Tags. 

   - Log in as a member (not Owner) of Read-Only group (a member not owning the Tags you have just checked/prepared) and |C| that the ``Available`` list does NOT show the Tags of other users (only YOUR tags should be displayed).

   - Log in as an Owner of Private group (e.g. user-1) and |C| that the ``Available`` list  does NOT show the Tags of other users (only YOUR tags should be displayed).


#. Add new

   - Create a new Tag (with new name). Click add. 

     - |C| that the new Tag is added to the ``Selected`` list.

   - Create a new Tag (with new name). Hit Enter. 

     - |C| that the Tag is added to the ``Selected`` list.

   - Create a new Tag whilst highlighting a Tag Set or a Tag in a Tag Set.

     - |C| that the new Tag has been created as a part of this Tag Set.

   - Create a new Tag, using an existing Tag name, or an existing Tag name and description from the ``Available`` list. 

     - |C| that a warning dialog pops up [:ref:`Annotate011`, :ref:`Annotate012`].

     - Click ``Yes``. |C| that the existing Tag will be moved to the ``Selected`` list.

     - Click ``No``. |C| that no Tag was added to the ``Selected`` list.

   - Try to create new Tags which match the names of existing Tags within Tag Sets in ``Available`` list. 

     - |C| that the Tag from the Tag Set was added after you clicked ``Yes`` and no Tag was added after you clicked ``No``.

   - Hide some Tags in the ``Available`` list by filtering these Tags out (i.e. type into the Filtering box above ``Available`` list a character NOT contained within the name of some Tags.) Now, go to the new Tag box under the ``Available`` list enter the name of a Tag no longer displayed in the ``Available`` list (i.e. one of those which you just filtered out). Hit ``Enter`` or ``Add`` Button. The dialog indicating that the Tag exists should pop up. Click ``Yes``. The Tag should be added to the ``Selected`` list.

   - Create a new Tag, using an existing Tag name, or an existing Tag name and description from the ``Selected`` list.
 
     - |C| that a warning dialog pops up [:ref:`Annotate013`, :ref:`Annotate014`] . 
     - |C| that after you confirmed the warning dialog, no new Tag was added to the ``Selected`` list.

#. Filtering:

   - Start typing into the filtering box above the ``Available`` list [:ref:`Annotate015`, :ref:`Annotate016`]. 

     - |C| that only Tags are filtered, this means Tag Set values should not be taken into account. 
     - |C| that the default option is ``anywhere in Tag name`` i.e. any character in the Tag is used [:ref:`Annotate017`, :ref:`Annotate018`].

   - Switch to ``start of Tag name``. 

     - |C| that filtering works taking in account only the start of the Tag name (similar to code completion).

   - Enter some text you can find in the middle of Tags e.g. ph in filtering box, with ``anywhere in Tag name`` selected. Now switch to ``start of Tag name`` and |C| that the list is updated.

   - |C| that in ``Filter by owner`` menu the default is ``All`` [:ref:`Annotate019`, :ref:`Annotate020`].

   - Select ``Owned by me``, the list should be updated even if there is no text in filter box.
   - Select ``Owned by others``, the list should be updated even if there is no text in filter box.
   - Write into filtering box name of existing Tag. 

     - |C| that the existing Tag gets selected as you write. Hit Enter and |C| that it gets added to ``Selected`` list.


#. Both in the ``Available`` as well as in the ``Selected`` lists hover with the mouse over the Tags.

   - |C| that tooltip shows 

     - Owner of the Tag (in all cases)
     - Description (in case the Tag has a Description)
     - Tag Set (in case the Tag is in a Tag Set)

   - |C| that the tooltip is displayed in ``Selected`` list also in cases when the Tag is 

     - newly added (i.e. addition of an existing Tag)
     - newly created and added



#. Click the ``Reset`` button and |C| that everything was reset into the state which it was in when you started the Tagging dialog. 



|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|





.. _Annotate001:
.. figure:: images/testing_scenarios/Annotate/001.png
   :align: center

   Annotate001: Comments in Insight

|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _AnnotateM001:
.. figure:: images/testing_scenarios/Annotate/multiple001.png
   :align: center

   AnnotateM001

|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _AnnotateM002:
.. figure:: images/testing_scenarios/Annotate/multiple002.png
   :align: center

   AnnotateM002

|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _Annotate002:
.. figure:: images/testing_scenarios/Annotate/002.png
   :align: center

   Annotate002: Check in Insight


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|






.. _Annotate003:
.. figure:: images/testing_scenarios/Annotate/003.png
   :align: center

   Annotate003: Check in Web


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _AnnotateM003:
.. figure:: images/testing_scenarios/Annotate/multiple003.png
   :align: center

   AnnotateM003

|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _AnnotateM004:
.. figure:: images/testing_scenarios/Annotate/multiple004.png
   :align: center

   AnnotateM004

|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _AnnotateM005:
.. figure:: images/testing_scenarios/Annotate/multiple005.png
   :align: center

   AnnotateM005

|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _AnnotateM006:
.. figure:: images/testing_scenarios/Annotate/multiple006.png
   :align: center

   AnnotateM006

|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _AnnotateM007:
.. figure:: images/testing_scenarios/Annotate/multiple007.png
   :align: center

   AnnotateM007

|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _AnnotateM008:
.. figure:: images/testing_scenarios/Annotate/multiple008.png
   :align: center

   AnnotateM008


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _Annotate009:
.. figure:: images/testing_scenarios/Annotate/009.png
   :align: center

   Annotate009



|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _Annotate010:
.. figure:: images/testing_scenarios/Annotate/010.png
   :align: center

   Annotate010

|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _Annotate011:
.. figure:: images/testing_scenarios/Annotate/011.png
   :align: center

   Annotate011


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _Annotate012:
.. figure:: images/testing_scenarios/Annotate/012.png
   :align: center

   Annotate012

|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _Annotate013:
.. figure:: images/testing_scenarios/Annotate/013.png
   :align: center

   Annotate013


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _Annotate014:
.. figure:: images/testing_scenarios/Annotate/014.png
   :align: center

   Annotate014

|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _Annotate015:
.. figure:: images/testing_scenarios/Annotate/015.png
   :align: center

   Annotate015

|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _Annotate016:
.. figure:: images/testing_scenarios/Annotate/016.png
   :align: center

   Annotate016

|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _Annotate017:
.. figure:: images/testing_scenarios/Annotate/017.png
   :align: center

   Annotate017

|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _Annotate018:
.. figure:: images/testing_scenarios/Annotate/018.png
   :align: center

   Annotate018

|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _Annotate019:
.. figure:: images/testing_scenarios/Annotate/019.png
   :align: center

   Annotate019

|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _Annotate020:
.. figure:: images/testing_scenarios/Annotate/020.png
   :align: center

   Annotate020



|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _Annotate021:
.. figure:: images/testing_scenarios/Annotate/021.png
   :align: center

   Annotate021

























