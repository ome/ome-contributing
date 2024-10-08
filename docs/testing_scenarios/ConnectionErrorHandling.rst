Connection/Error Handling
=========================



**To test in**: Insight

**Purpose of the test**: error handling when server goes down, network failure occurs or when computer goes to sleep

**When testing on Windows 64-bit machine, do the tests with 32-bit as well as 64-bit Insight. (There are known differences between 64 and 32-bit Insight.)**

#. Connect to local server.

   - Expand a project.
   - Restart the server
   - Expand a Dataset before end of server restart

#. Connect to local server.

   - Expand a project.
   - Restart the server
   - Expand a Dataset when the server is restarted.

#. Connect to local server.

   - Expand a project.
   - Expand a Dataset and open an image.
   - Restart the server
   - Turn channel on/off when the server is restarted.

#. Connect to server (not local) using a network cable 

   - Expand a project.
   - Unplug cable.
   - Replug the cable and check your network is up on other apps
   - Expand a Dataset 

#. Connect to server (not local) using a network cable

   - Expand a project/Dataset
   - Open an image
   - Unplug the cable.
   - Replug the cable and check your network is up on other apps
   - Turn channel on/off

#. Connect to server (not local) using wireless network

   - Expand a project.
   - Turn off the wireless network
   - Turn the wireless network back on and check your network is up on other apps
   - Expand a Dataset

#. Connect to server (not local)

   - Expand a project and Dataset and select an image
   - Put computer to sleep (~2 mins)
   - Wake computer up 
   - Open an image

#. Connect to server (not local)

   - **Note** that as of January 2014 there is a known bug/work in progress with 32-bit Insight on Win 7 in this workflow (does not reconnect)
   - Open an image in full viewer
   - Put computer to sleep (~2 mins)
   - Wake computer up
   - Open another image

#. Win XP only 

   - |C| that Insight starts and you can open an image
   - **Note** that on Win XP the ambition is only to get Insight started and working. We do not attempt to sort out loss-of-connection issues on Win XP as long as they do not interfere with the first startup of the app.


