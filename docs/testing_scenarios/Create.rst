Create
======



**To test in**: Web, Insight

**Purpose of the test** is to check that the creation of new entities is smooth, valid and sensible and the appropriate menu commands work and correspond (right-click and main menu)

If you test work on others' data (permissions) go first to :ref:`Section 2: Work on others data <label-Create>`

**Section 1: Work on your own data**

#. Create new Project/Dataset/Screen* 

   - Create using right-click [:ref:`Create001`]
   - Create using the icon [:ref:`Create002`, :ref:`Create003`, :ref:`Create004`]
   - Create using the main menu (Insight only) [:ref:`Create005`]

#. Create new Tag Set/Tag (Menu:File>New, Insight only) [:ref:`Create005`]

#. Select **non-orphaned** images. Create New Dataset

   - |C| that a new empty dataset is created.

#. Select plates. Create New Screen

   - |C| that a new empty Screen is created.

#. Select **orphaned** images. Create New Dataset

   - |C| that a new dataset containing the selected images is created.



----------------------------------------------------------------------------------------------------------------------------------------------------------

.. _label-Create:

**Section 2: Work on other users' data**

|C| the permissions of the user you have been assigned to use here: :ref:`Table of permissions-users <Table-of-permissions-users>`
|C| whether you CAN (=Y) or CANNOT (=N) create objects under other users' data (= look for Mix data (formerly "Link") permissions) in the table `here <https://docs.google.com/spreadsheet/ccc?key=0AuqP9_Rq_HgldDNjT0ZIcHRSOUg1OFpjVUthdzM4cmc&usp=drive_web#gid=1>`_.

#. Switch to Group Display in Insight, put "All members" to display in Web.

#. In Insight and Web try to create new P/D/S being under other users' data (=selecting other users' P/D/S/I) 

   - Note that there is a known discrepancy in Web in icons enabling (not enabled when other user is on display) and right-click menu 
   - |C| that all the three icons for creating P/D/S in Web are enabled and working when you select the group name, Project(s), Dataset(s) or Image(s) in the tree
   - |C| in Web that the right-click contextual menu is enabled when you select the group name and Image(s) and disabled when you select Dataset. 
   - |C| in Web that the right-click contextual menu is enabled only for Dataset creation when you select a Project which is either yours or other users' but such that you have permissions for to create your Dataset under it, and that the resulting Dataset is linked to the selected Project
   - |C| in Insight that you can/cannot create the new entities as appropriate to your permissions (= menu items in contextual menu, icons and main menu are enabled/disabled as appropriate) 
   - |C| in Insight and Web that new Datasets are created under other users' Projects when these Projects are selected and creation is permitted.
 



#. Do step 5 in Section 1 selecting other users' images.

   - |C| that when creation permitted, the newly created Dataset belongs to you and contains the selected images of the other user(s)


#. Switch to User View in Insight, put a particular user to display in Web and

   - |C| in Insight that when you select other users' data, Projects and Screens are created under your name in the tree in Insight (when permitted). 
   - |C| in Web that the icons for creation are disabled in all cases
   - |C| in Web that when you select Project(s) of other users, ONLY Dataset creation is enabled in both icon and context menu (and this only if permmissions allow you to link your Datasets to this Project) , and the Datasets are created under the selected Project 
   - |C| in Web that when you select a Dataset of another user, no creation menu (both icons and context) is ever enabled.
   - |C| in Web that when you select other users' images P/D/S creation in context menu (but not icons) is enabled in read-annotate and read-write groups for the non-group-owner and non-admin member (Note that this is not considered a desired behaviour, but is status quo at the moment). Further if selected images of other user are in Orphaned folder and you have the permissions to link the images to your Dataset,the selected images are in the newly created dataset. Further |C| that after you put yourself to display in the tree, this newly created Dataset of yours appears under your tree, and is not available anymore under the tree of the user whose images you used to populate this Dataset from Orphaned folder.

|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _Create001:
.. figure:: images/testing_scenarios/Create/001.png
   :align: center

   Create001: 


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|





.. _Create002:
.. figure:: images/testing_scenarios/Create/002.png
   :align: center

   Create002:


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|





.. _Create003:
.. figure:: images/testing_scenarios/Create/003.png
   :align: center

   Create003


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|





.. _Create004:
.. figure:: images/testing_scenarios/Create/004.png
   :align: center

   Create004


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|





.. _Create005:
.. figure:: images/testing_scenarios/Create/005.png
   :align: center

   Create005


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
