Admin: Group/User Edit
======================



**To test in**: Web, Insight

**Purpose of the test** is to check the Editing and changing of Group/User as administrator or group owner

#. Edit group [:ref:`AdminGrUsEd001`][:ref:`AdminGrUsEd002`][:ref:`AdminGrUsEd003`]

#. Change name/description/permissions and Save

   - |C| the parameters have been changed correctly 
   - |C| that when you have a Read-Annotate or Read-Write group, you can change the permissions to Read-Only or Private group if there are no annotations of objects by other users
   - Have a Read-Annotate and Read-Write group. Make sure one user in these groups annotates objects of another user (none of the users is Admin or Group Owner). 
   - |C| that when you try to downgrade the permissions to Read-Only or Private, the action will not proceed, and in both Web and Insight you get a informative warning message

#. Add and remove users (=members)

   - using Edit group window (Web only) [:ref:`AdminGrUsEd003`]
   - using ``Edit group membership`` from right-click menu (Insight only) [:ref:`AdminGrUsEd004`]
   - |C| that you can see and filter the users in the dialog [:ref:`AdminGrUsCr004b`].  
   - using Copy/Cut and Paste from main menu (Insight only)
   - using Copy/Cut and Paste via icons & right-click (Insight only)
   - using Drag & Drop (Insight only)
   - |C| the users have been added/removed to/from the groups
   - |C| that when a user is a member of only one group, you cannot remove him/her from this group

#. Edit user [:ref:`AdminGrUsEd005`][:ref:`AdminGrUsEd006`][:ref:`AdminGrUsEd007`]

   - change Name/Password/Status (Insight)
   - change Names/e-mail/Institution/Status (Web - at present no Group Owner option)
   - |C| that you cannot change the login name (Insight - in Web you can)
   - Save changes
   - |C| the changes have been made appropriately

#. Login as group owner **without admin rights** (e.g. user-5 in read-annotate 
   or user-1 in private group, but NOT user-6) and in the group you are the  
   owner of only add and remove users:

   - using Edit group window (Web only - right-click onto your name in top right corner and go ``User settings > My Groups > Edit``) [:ref:`AdminGrUsEd003`]
   - using ``Edit group membership`` from right-click menu (Insight only) [:ref:`AdminGrUsEd004`]
   - using Copy/Cut and Paste from main menu (Insight only)
   - using Copy/Cut and Paste via icons & right-click (Insight only)
   - using Drag & Drop (Insight only)
   - |C| the users have been added/removed to/from the groups
   - |C| that you cannot Create new user in Insight (right-click menu item is greyed out)
   - |C| that when a user is a member of only one group, you cannot remove him/her from this group
   - (Insight only) |C| that you can Edit only the Default group of other users, but not their credentials, login names or anything else.

#. (Web only) Checking disk usage.

   - login as admin and go to the ``Admin`` tab.
   - Select the ``Statistics`` tab.
   - |C| that you can see a pie chart with the breakdown of the usage of the disk by groups and also the usage in tabular form below it [:ref:`AdminGrUsEd008`]
   - |C| that you can click onto the pie chart which brings you to a similar breakdown of usage for the particular entity you clicked onto.
   - logout
   - login as a group owner of multiple groups
   - click onto your name in top right corner of the Web UI and select ``User settings``
   - click onto the ``Statistics`` tab.
   - |C| that you can see a pie chart with the breakdown of the usage of the disk by groups and also the usage in tabular form below it [:ref:`AdminGrUsEd008`]
   - |C| that you can click onto the pie chart which brings you to a similar breakdown of usage for the particular entity you clicked onto.


	.. _AdminGrUsEd001:
	.. figure:: images/testing_scenarios/GroupUserEditAdmin/001Insight.png
	   :align: center

	   AdminGrUsEd001: 


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _AdminGrUsEd002:
	.. figure:: images/testing_scenarios/GroupUserEditAdmin/002Web.png
	   :align: center

	   AdminGrUsEd002:


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _AdminGrUsEd003:
	.. figure:: images/testing_scenarios/GroupUserEditAdmin/003Web.png
	   :align: center

	   AdminGrUsEd003


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _AdminGrUsEd004:
	.. figure:: images/testing_scenarios/GroupUserEditAdmin/004Insight.png
	   :align: center

	   AdminGrUsEd004


|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|


.. _AdminGrUsCr004b:
.. figure:: images/testing_scenarios/GroupUserEditAdmin/004b.png
   :align: center

   Edit Users dialog: 



|
|
|
|
|
|
|
|
|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _AdminGrUsEd005:
	.. figure:: images/testing_scenarios/GroupUserEditAdmin/005Insight.png
	   :align: center

	   AdminGrUsEd005


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _AdminGrUsEd006:
	.. figure:: images/testing_scenarios/GroupUserEditAdmin/002Web.png
	   :align: center

	   AdminGrUsEd006: 


	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _AdminGrUsEd007:
	.. figure:: images/testing_scenarios/GroupUserEditAdmin/006Web.png
	   :align: center

	   AdminGrUsEd007:
	
	
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|


	.. _AdminGrUsEd008:
	.. figure:: images/testing_scenarios/GroupUserEditAdmin/008Web.png
	   :align: center

	   AdminGrUsEd008:
	
	
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|
	|




