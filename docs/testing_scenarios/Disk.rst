Disk usage report
=================



**To test in**: Command line interface

**Purpose of the test** is to check that the disk usage reporting on cmd line works as expected.

#. Download cmd line interface (for example a server from CI). Login and connect to the CI server mentioned in the testing setup (e.g. trout) as user prescribed for you in the testing setup (e.g. user-1). 

#. Execute following command: ``bin/omero fs usage --report`` which should deliver the report of your own disk usage.


   - |C| that in case your user has Big images without in-built pyramids, such as ``.jpg`` and/or OMERO 4 images, there is also the entry ``Pixels`` in the output table, e.g. user-1 (ID 13 on trout) will see.

::

   bin/omero fs usage --report
   Using session 652e449c-819a-425d-ac88-65e7ca5ebbb0 (user-1@trout.openmicroscopy.org:4064). Idle timeout: 10.0 min. Current group: private-1
   Total disk usage: 4526436430274 bytes in 26078 files
   component    | size (bytes)  | files 
   --------------+---------------+-------
   Pixels       | 14654902013   | 2961  
   FilesetEntry | 4510839804505 | 8820  
   Thumbnail    | 17337131      | 8110  
   Job          | 265665153     | 2792  
   OriginalFile | 1757277       | 109   
   Annotation   | 13167582976   | 3910  
   (6 rows)




3. Execute ``bin/omero user list`` to find out which ``Experimenter`` 
   corresponds to your username.

4. Execute the command ``bin/omero fs usage Experimenter:X --report`` 
   replacing the ``X`` accordingly so that it corresponds to a user ID 
   of a user which does not share any common group with ``you``, i.e. 
   the user logged in. This could be for example user-1 logged in, user-
   10 (ID 13, i.e. X = 13) on any CI server (please double check this is true if you did not get the expected result).

   - |C| that the output of the command is zero, similar to following

::

   [petr@LS25165 ~/Downloads/OMERO.server-5.1.0-m1-298-ef5ae95-ice35-b272]$ bin/omero fs usage Experimenter:13 --report
   Using session f0c8192d-d39c-47ed-8e2a-2e6a582b04ee (user-1@trout.openmicroscopy.org:4064). Idle timeout: 10.0 min. Current group: private-1
   Total disk usage: 0 bytes in 0 files
   component | size (bytes) | files 
   -----------+--------------+-------
   (0 rows)


5. Now login as the user you were getting the disk usage report of in the previous step (e.g. user-10) and |C| that this user does have some data in OMERO by running ``bin/omero fs usage --report``

   - |C| that the output of the command is non-zero, similar to following


::

   
   bin/omero fs usage --report
   Using session e28b7bb6-6e10-4b2c-b500-1cae8a080320 (user-10@trout.openmicroscopy.org:4064). Idle timeout: 10.0 min. Current group: read-only-1
   Total disk usage: 29005429940 bytes in 3793 files
   component    | size (bytes) | files 
   --------------+--------------+-------
   Pixels       | 22496654484  | 1221  
   FilesetEntry | 6470953311   | 947   
   Thumbnail    | 2839255      | 1246  
   Job          | 25343645     | 1     
   OriginalFile | 4353         | 11    
   Annotation   | 57811983     | 829   
   (6 rows)




