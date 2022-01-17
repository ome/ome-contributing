Reset password
==============================



**To test in**: Web 

**Purpose of the test** is to check that the ``Forgotten password`` functionality works fine.





#. Try to login as non-admin, non-group owner user, set a valid email address. 

   - log out and click ``Forgotten password``
   - Try not to put into the fields anything (test both fields)
   - |C| that a message ``This field is required`` appears.
   - Type in your username and email address
   - Click ``Submit``.
   - |C| that you receive an email with a new password.
   - |C| that you can log in using this new password.
   - reset the password once logged in back (using ``User settings``)
   - Log out and |C| that password was reset successfully.

#. Choose one of the fake usernames from the table of usernames at `team_plone <Password>`_  (at the bottom of the paragraph named LDAP-TEST server). Log in into one of our CI servers - |C| the testing setup for which server is deployed.
#. Go to the icon with your login name on it and expand the menu and choose ``User settings``.
#. |C| that the LDAP user has a valid email address set - take a note of it.
#. Use the ``Forgotten password`` link in Web and 
#. Try to insert the username of your LDAP-TEST user into the first line and a valid email address into the second line. 


   - |C| that the message will show ``User is authenticated by LDAP server you cannot reset this password.``
   - |C| that the password has not been changed.


  
