Admin: Group/User Create
========================

**To test in**: Web, Insight

**Purpose of the test** is to check the creation of new groups/users functionality when logged in as administrator

#. Go to administration tab (left pane harmonica (Insight) or Admin tab (Web) [:ref:`AdminGrUsCr001`]) 

#. Create new group 

   - using the icon above the tree (Insight only) [:ref:`AdminGrUsCr002`] 
   - using the button "Add new..." (Web only) [:ref:`AdminGrUsCr003`][:ref:`AdminGrUsCr004`]  
   - Create private/read-only/read-annotate group
   - |C| that a new group was created with permissions as chosen at creation


#. (Insight only) - create a new user/group and 

   - |C| that when you try to delete the user/group immediately after creation via ``Delete`` key or via context menu, the action is not allowed/does not proceed.

#. Create new user [:ref:`AdminGrUsCr005`][:ref:`AdminGrUsCr006`][:ref:`AdminGrUsCr007`]

   - |C| that you can see the list of groups in the lower part of the [:ref:`AdminGrUsCr002b`]. 
   - |C| that you can filter the groups in [:ref:`AdminGrUsCr002b`].
   - Tick/do not tick the Administrator box in the creation window
   - |C| that when you use an existing login name for a new user, the action    
     does not proceed and a popup appears [:ref:`AdminGrUsCr010`]. The login  
     name must be unique for the whole database, not just for the group the 
     new user is a member of.
   - |C| in Insight - the pop-up warning refers to “User” not “Experimenter” and in Web - warning above Username label (in red) refers to “username”.
   - |C| that the new user is (or is not) an Administrator as appropriate
   - tick/do not tick the Group owner box (Insight only) [:ref:`AdminGrUsCr008`]
   - |C| that the new user is (or is not) Group owner as appropriate

#. (Web only) Add the new user to one or more existing groups [:ref:`AdminGrUsCr009`]. 



.. _AdminGrUsCr001:
.. figure:: images/testing_scenarios/GroupUserCreateAdmin/00Web.png
   :align: center

   AdminGrUsCr001: 


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _AdminGrUsCr002:
.. figure:: images/testing_scenarios/GroupUserCreateAdmin/001Insight.png
   :align: center

   AdminGrUsCr002:


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _AdminGrUsCr002b:
.. figure:: images/testing_scenarios/GroupUserCreateAdmin/002b.png
   :align: center

   New User dialog:


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _AdminGrUsCr003:
.. figure:: images/testing_scenarios/GroupUserCreateAdmin/001Web.png
   :align: center

   AdminGrUsCr003


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _AdminGrUsCr004:
.. figure:: images/testing_scenarios/GroupUserCreateAdmin/002Web.png
   :align: center

   AdminGrUsCr004


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _AdminGrUsCr005:
.. figure:: images/testing_scenarios/GroupUserCreateAdmin/001Insight.png
   :align: center

   AdminGrUsCr005


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _AdminGrUsCr006:
.. figure:: images/testing_scenarios/GroupUserCreateAdmin/003Web.png
   :align: center
   :width: 100%

   AdminGrUsCr006: 


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _AdminGrUsCr007:
.. figure:: images/testing_scenarios/GroupUserCreateAdmin/004Web.png
   :align: center

   AdminGrUsCr007:


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _AdminGrUsCr008:
.. figure:: images/testing_scenarios/GroupUserCreateAdmin/005Insight.png
   :align: center

   AdminGrUsCr008


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _AdminGrUsCr009:
.. figure:: images/testing_scenarios/GroupUserCreateAdmin/006Web.png
   :align: center

   AdminGrUsCr009: 



|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _AdminGrUsCr010:
.. figure:: images/testing_scenarios/GroupUserCreateAdmin/010.png
   :align: center

   AdminGrUsCr010: 



|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _AdminGrUsCr011:
.. figure:: images/testing_scenarios/GroupUserCreateAdmin/011Insight.png
   :align: center

   AdminGrUsCr011: 



|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _AdminGrUsCr012:
.. figure:: images/testing_scenarios/GroupUserCreateAdmin/012Insight.png
   :align: center

   AdminGrUsCr012: 



|
|
|
|
|
|
|
|
|


