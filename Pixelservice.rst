Pixelservice
======================



**To test in**: Web, Insight

**Purpose of the test** is to check the pyramid generation logic on the server.

#. Download and start OMERO.server
#. Disable the PixelData-0 service 

   - run ``bin/omero admin diagnostics`` and |C| that the PixelData-0 server is ``active`` and ``enabled``
   - run 

::

   bin/omero admin ice server disable PixelData-0
   bin/omero admin ice server stop PixelData-0

#. Run again ``bin/omero admin diagnostics`` and |C| that the PixelData-0 server is ``inactive`` and ``disabled``

#. Upload a number of large images as user-1 (10 images, gatan for 
   example)
#. Upload one big image as user-2
#. Upload one big image as user-3
#. Re-enable the PixelData-0 service. Run ``bin/omero admin ice server   
   enable PixelData-0``.
#. Wait until the service is finished processing. Execute ``tail -f 
   PixelData.log`` and wait till the output stops.
#. |C| that viewing the related dataset (or "Orphaned") shows all the 
   objects without the clock icon in Insight and Web WITHOUT having to 
   refresh the UI manually.


