LDAP testing
=============

**To test in:** local ldap server, and on a local OMERO.server, using command line.

#. Go to terminal, into the ``/bin`` folder of your server installation and execute following commands 

   ``omero admin stop``
   ``omero config set omero.ldap.config true``
   ``omero config set omero.ldap.sync_on_login true ``
   ``omero config set omero.ldap.base ou=lifesci,o=dundee``
   ``omero config set omero.ldap.username cn=omero,ou=notedir,ou=people,ou=lifesci,o=dundee``
   ``omero config set omero.ldap.password "3CogNor;"``
   ``omero config set omero.ldap.urls ldap://ldap-dev.lifesci.dundee.ac.uk:389``
   ``omero config set omero.ldap.user_filter "(objectClass=person)"``
   ``omero config set omero.ldap.user_mapping omeName=cn,firstName=givenName,lastName=sn,email=mail``
   ``omero config set omero.ldap.group_filter "(objectClass=groupOfUniqueNames)"``
   ``omero config set omero.ldap.group_mapping name=cn``
   ``omero config set omero.ldap.new_user_group ":query:(memberUid=@{cn})"``
   ``omero admin start``

#. Try to login using the Insight UI with your LDAP username & password (or other people's LDAP username & psswd)

   - |C| that you have been added to omedev group in Insight (depends on the progress of Kenny's dealing with IT about the LDAP psswd situation)
   - If the above does not work, try to login as username: cblackburn, psswd: 1234Test#
   - |C| check that cblackburn was added to omedev group in Insight

For further details check:
the :omerodoc:`sysadmin documentation <sysadmins/server-ldap.html>`
and ``ldap-dev-configuration`` on ome-internal.
