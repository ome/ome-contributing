QA web application testing
==========================


**To test in**: QA application, Web, Insight, Importer

**Purpose of the test** is to check the QA Web application functionality.

#. Go to https://qa.staging.openmicroscopy.org/, login and remove the date in the top row of boxes. 

#. Click ``Filter`` and select one QA feedback.

#. |C| that all data are displayed correctly.

#. Click on ``New ticket`` and select ``Trac`` in the ``System`` menu. 

   - |C| that the trac domain (the top item on the list) points to the test trac.
   
   - |C| that you can create a ticket on the ``Trac``.

#. |C| that the new ticket form shows:

   - Component
   - Milestone
   - Keywords
   - Version
   - Priority
   - CC
   - |C| that you are the pre-selected owner of the ticket, but still you can change this by using the dropdown menu

#. Upload files.

   - log out
   - click send files
   - add your email address and select few files, click send
   - go to the newly created feedback and check if all data is displayed correctly, also ssh to ``yourldapname@qa.staging.openmicroscopy.org`` and cd into ``/opt/qa-filestore`` - |C| if files are saved in subfolders with names matching the feedback numbers.
   - log in, check if all are displayed on the feedback page

#. Send feedback from Insight
 

   - open the file ``config/container.xml`` of your Insight and, in case this is not done already (it might have been preset automatically), exchange the url on line 170 to ``https://qa.staging.openmicroscopy.org/qa/initial/``
   - in the same file and, in case this is not done already (it might have been preset automatically), exchange the url on line 171 to ``https://qa.staging.openmicroscopy.org/qa/upload_processing/``
   - Save the changes in ``config/container.xml`` and start Insight
   - Import an image that will fail to import e.g. ``data_repo/test_images_bad/mike1_R3D.dv`` [:ref:`ImportUI014`]
   - Submit the error to the QA system using "Submit All" button in the right bottom corner [:ref:`ImportUI015b`]. 
   - Enter a valid e-mail address [:ref:`ImportUI016`]
   - |C| that you received a notification e-mail.
   - |C| that your email address, error message, and file links are all included on the QA webpage.
   - Send a reply comment to the QA webpage, include your email address and a message.
   - Log into the QA system as an administrator and confirm the comment was received.
   - Reply to the QA message, the message should appear in your email.
   - Finally, set the QA message status to "Closed" and save.
   - Import ``test_images_bad/mike1_R3D.dv`` and 

     - There will be no log, but you should be able to submit the files (as .zip) and exceptions. 
     - |C| that your submissions have arrived in the QA system
      

   - Import ``test_images_broken/volocity/3 Colour.acff`` and ``data_repo/test_images_broken/broken_images_scenario/``

     - submit the .zip, consisting of the file AND log
     - submit the exceptions
     - |C| that your submissions have arrived in the QA system

   - Go to ``Help > Send feedback``, enter a valid email address and a test message and click ``Send``
   - |C| that the feedback has arrived in the QA system
   - Add to it the ticket your created in step 4 clicking on ``Add ticket``
   - Cause an error in Insight and submit the error to QA and |C| that the error is in the QA

   
#. Send feedback from Web

   - click onto your username in top-right corner
   - Select ``Help``
   - Dialog will open. Input a valid email and message and click ``Send``.
   - |C| that the feedback arrived in QA system. 
   - Cause an error in Web
     - Tag a dataset in Web
     - Delete the dataset in Insihgt
     - Remove the tag in Web (click on the tag in right-hand pane and confirm yes in the dialog)
     - In Web, click onto the ``+`` sign to add new tag 
     - Submittable error appears
   - Submit the error and |C| that you can see it in the QA
   - Submit a comment from Web and |C| that you can see it in the QA


#. Send feedback from CLI

   - donwload a server from the CI and unzip
   - download files from ``data_repo/test_images_broken/``
   - try to import these files into a CI server (e.g. trout) with following three options, replacing EMAIL with a valid email address. Use ``test_images_broken/volocity/3 Colour.acff`` for this:






         ::

          bin/omero import PATH_TO_FILE/FILENAME  --report  --email EMAIL --qa_baseurl=https://qa.staging.openmicroscopy.org/qa
          bin/omero import PATH_TO_FILE/FILENAME  --report --upload  --email EMAIL --qa_baseurl=https://qa.staging.openmicroscopy.org/qa
          bin/omero import PATH_TO_FILE/FILENAME  --report --logs    --email EMAIL --qa_baseurl=https://qa.staging.openmicroscopy.org/qa
          
 
   - |C| that the feedback arrived in QA system (qa-staging)
   - |C| that you received an email for every submission
   - |C| that for ``--report`` option, the error was submitted
   - |C| that for ``--report --upload`` option, the file itself and the log were uploaded as a .zip
   - |C| that for ``--report --logs`` option, the logs were submitted, not a .zip
   - |C| that when you import ``squig/data_repo/test_images_broken/broken_images_scenario/fails_at_processing/wrong-light-source-mk3.ome`` with 
      - ``--report --logs`` option, you have no log (none is available) in the qa feedback, but you also have no NPE on the console output
      - ``--report --upload`` option, you have just the file uploaded (again, no log is available)

#. Older versions

   
   - repeat the point 6 sending feedback from older version of Insight (4.4 and 5.0 version)
   - repeat the point 7 sending feedback from older version of Web (4.4 and 5.0 version)
   - repeat the point 8 sending feedback from older version of CLI (4.4 and 5.0 version)
   - send feedback using http (additionally to the use of https)


