Big Image Upgrade Testing Server
================================

[**UPDATED for 4.3.2**\ ]

**To test in**: Mac and Windows servers

**Purpose of the test** is to check the behaviour of Big images when server is upgraded.

**Prerequisites: Images to use for the test from squig in the folder
test images good :**

**Images to use for the test:**

   .BMP

-  /bmp/6kx6k-grey.bmp
-  /bmp/6kx6k.bmp
-  /bmp/8kx8k-grey.bmp
-  /bmp/8kx8k.bmp

   .PNG
-  
   /png/4kx4k.png
-  /png/8kx8k.png

   .TIF

-  /tif/4kx4k.tif
-  /tif/8kx8k.tif

#. Install 4.2.2 server and increase Java memory to 4096M in template.xml.

#. Using a 4.2.2 client of OMERO upload big images listed in the prerequisite images (e.g. /bmp/8kx8k.bmp ).

#. Upgrade to the newest 4.4.x server. (See
   :omerodoc:`Server Upgrade <sysadmins/server-upgrade.html>`,
   remember about config files).

#. Now again try to view the same big image.

   - |C| an exception (which should be hidden from the user) is thrown which implies, "this image needs a pyramid created. please try again").

   - |C| Server log should show "Missing pyramid:/OMERO/Pixels/PIXEL\_ID\_pyramid"

   - |C| In the background, the server generates the pyramid.

   - |C| On clicking on the same big Image for a second time, the image will be viewable.
