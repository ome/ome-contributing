Web - light testing
===================



**To test in**: Web

**Purpose of the test** is to have a lightweight scenario covering all OMERO.web in case PRs testing such as Django upgrade or similar where the whole UI has to be tested, but not too deeply.


#. Feedback: send comment and error

   - Go to the appropriate server and add to the url ``/feedback/comment/`` for example ``https://eel/merge/feedback/comment/`` and filling in your email address, send comment.
   - Go to the appropriate server and add to the url ``/weberror/error_500/`` for example ``https://eel/merge/weberror/error_500/`` and filling in your email address, submit error.
   - |C| that the comment and error were sent (you should get corresponding emails).

#. Login:

   - Replacing the ``eel/merge`` part in the following example, navigate in your browser to the url ``https://eel/merge/webclient/login/?url=%2Fmerge%2Fwebclient%2Fuserdata%2F%3Fexperimenter%3D-1``
   - Log in as a user who can view data of user-1.
   - |C| that you were redirected to ``https://eel/merge/webclient/userdata/?experimenter=-1``
   - |C| that you can view data of user-1.
   - Click on random P/D/I and |C| that you are not logged out automatically.

#. Webadmin:

   - :doc:`Resetpwd`
   - :doc:`AdminGroupUserCreate` (handled by robot test - just concentrate on tasks highlighted in testing sheet and take scenario as guidance)
   - :doc:`AdminGroupUserEdit` (handled by robot test - just concentrate on tasks highlighted in testing sheet and take scenario as guidance)
   - Edit my account (handled by robot test - just briefly double-check that you can change your password, first name and other details in the ``User settings`` form). To get to the ``User settings``, click onto your name in top right corner of the UI.
   - Crop your avatar under ``User settings``. 

     - Click on ``Change`` under the avatar.
     - Click on ``Browse`` and ``Upload`` in case no avatar is uploaded yet.
     - Click on ``Edit`` and then on ``Crop`` in the forms. 
     - |C| that the action proceeds.

#. Webclient:
   
   - Copy the link to an image from  the ``chain-link`` icon in top right of the Web UI and logout.
   - |C| that this link when pasted to your browser in a new tab takes to the image (after you logged in again)
   - Briefly search using global searching (from the small dialog in top right) as well as advance searching (from the Search interface, which you get to after you used the small dialog in top right). Just |C| that you get ANY results, selecting search terms which you know you should get some results for (Compare with Insight in doubt, no need to go into granularities like date, targeting, advanced search for P/D/I and similar).
   - Annotation :doc:`Annotate` (just try to annotate the image with Tags, Ratings, Key-Value pairs, Comments, Description - do not go into details and edge cases, simple execution of single annotations is enough. Take the scenario just as a rough lead.) Test annotating with

      - singly-selected images
      - multiselections of images
      - attaching files from local harddrive
      - attaching existing files

   - Create Project, Dataset, Screen (from icon and right-click, one execution per object means 6 executions in total - again, no granularity needed)
   - Create and Edit Share :doc:`Share` (scenario just to give you a rough lead, see further) - just confirm that you can Creat and Edit, do not go into detail, email sending, multiselections, deletions etc.
   - Edit channel name and save the change
   - |C| that rendering settings work in most general cases: ``Copy``, ``Paste``, ``Save``, ``Save to all`` in Preview, ``Copy`` and ``Paste`` in Full Viewer, ``Copy``, ``Paste and Save`` , ``Set Imported and Save`` and ``Set Owners and Save`` in the tree. Try just once per command and |C| that action proceeds, and |C| that the thumbnails in central pane update accordingly. Do not go into details, permissions and synchronization checks.
   - Download a file attachment and |C| that the action proceeds.
   - Download an original file and |C| that the action proceeds.
   - Save an image using ``Save as jpeg`` and |C| that the action proceeds.
        

#. Execute 2 scripts which you know should work, like ``Kymograph``. |C| that the execution was successful, do not go into details about the particularities of the script itself. Take :doc:`ScriptsClient` as a lead only.

