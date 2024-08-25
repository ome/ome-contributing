Memo file
=========



**To test in**: Insight, Server logs

**Purpose of the test** is to check that the memo file has been created and revisited when images are imported/viewed.

#. Import a file, e.g ``.nd2``

   - |C| that in the ``Blitz-0.log`` 
     there is a line such as

     ``2014-08-01 15:32:49,004 DEBUG [loci.formats.Memoizer] (2-thread-3) saved memo file: /repositories/OMERO-5.0-merge-integration/BioFormatsCache/repositories/OMERO-5.0-merge-integration/ManagedRepository/root_0/2014-08/01/15-32-48.427/.test.fake.bfmemo (22873 bytes)`` 

     which appears the 
     first time the server calls the ``setID()`` method.

#. Try to open the file you imported in the viewer.

   - |C| that the ``Blitz-0.log`` 
     shows a line such as

     ``2014-08-01 15:32:49,888 DEBUG [loci.formats.Memoizer] (Server-155) loaded memo file: /repositories/OMERO-5.0-merge-integration/BioFormatsCache/repositories/OMERO-5.0-merge-integration/ManagedRepository/root_0/2014-08/01/15-32-48.427/.test.fake.bfmemo (22873 bytes)``

     for every time you open the image. 
