Switch User
===========



**To test in**: Web

**Purpose of the test** is to check that admin user is able to change the current user account

#. Login as root or alternative administrator account

   - in the url in your browser, go to ``http://HOST_NAME/webgateway/su/USER_NAME/`` where USER_NAME is the username you want to switch to hit Enter
   - click on the link "Do you want to su to test"
   - you shoudl see "true"

#. Go back to webclient, i.e. ``http://HOST_NAME/webclient/``

   - |C| that you are logged in as USER_NAME
