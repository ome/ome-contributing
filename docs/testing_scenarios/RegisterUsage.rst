Registering usage
=================


**To test in**: Web, Insight, IJ plugin, Importer, MatLab, Bio-Formats

**Purpose of the test** is to check if ``UpgradeCheck`` hit is registered, this means the usage monitoring of our products is working as expected.

#. For client upgrade tests, write down your IP address 

   .. note::
     Do not use any website to check you IP address as this may give you
     incorrect result.

   - on UNIX, use: ``$ /sbin/ifconfig`` (Look for ``inet addr`` in the output, in case there are two addresses in the output, like on CI nodes, |C| BOTH, expecting the hits to come just from one of them)
   - on Mac OS X, alternatively go to
     :menuselection:`Apple -> System Preferences -> Network` and find the
     active connection
   - on Windows, open the ``CMD (Command Prompt)`` and type::

       C:\> ipconfig

#. For OMERO.server and OMERO.web tests, use the IP address of the node where 
   the server or the Web is deployed.

#. To check the hits, first connect to feedback database

   - if you are testing the production registry, use the replica of the
     feedback database which is in read-only mode::

       psql -h pg-slave.openmicroscopy.org -U feedback feedback

   - if you are testing the staging registry database::
 
       psql -h ome-web-staging.openmicroscopy.org -U feedback feedback

#. |C| if the hit was registered in the database using the following query:

   **Repeat the following steps for each client** (see step 6. for the precise list of clients and workflows specifying how to score a hit in the registry), replacing `YOUR_IP` with the correct value::

     SELECT registry_ip.ip, registry_hit.creation_date, registry_agent.agent_name, registry_agent.id
     FROM registry_hit 
     LEFT OUTER JOIN registry_ip ON ( registry_hit.ip_id = registry_ip.id )
     LEFT OUTER JOIN registry_agent ON ( registry_hit.agent_id = registry_agent.id )
     WHERE registry_ip.ip = 'YOUR_IP'
     ORDER BY registry_hit.id DESC LIMIT 5;

   You should see results like::

           ip       |         creation_date         |   agent_name   | id 
     ---------------+-------------------------------+----------------+----
      134.36.162.28 | 2015-09-24 09:45:14.112992+01 | OMERO.ij       | 10
      134.36.162.28 | 2015-09-23 11:05:35.554009+01 | OMERO.importer |  1
      134.36.162.28 | 2015-09-23 11:03:10.234792+01 | OMERO.insight  |  2
      134.36.162.28 | 2015-09-23 09:52:05.933021+01 | OMERO.web      |  5

#. Download the appropriate clients:

   - to test the production registry application, go to
     http://downloads.openmicroscopy.org/omero/, choose appropriate version
     and download the packages.

   - to test the staging registry application, download the merge clients from
     :mergecijob:`OMERO-build` or
     :mergecijob:`BIOFORMATS-build`.
     The CI :mergecijob:`OMERO-server` server should also be
     configured to point the staging registry.

#. Test the various clients:

   Note: If asked ot ssh into a server, you might encounter a ``(No module named Ice)`` problem when executing the commands. To alleviate this, run ``eval $(bash /home/hudson/ice/ice-multi-config.sh ice35)`` first.

   .. list-table::
     :widths: 10,90

     *
       - Agent
       - Testing scenario

     *
       - OMERO.importer
       - Open the OMERO.importer client and log in to the given server

     *
       - OMERO.insight
       - Open the OMERO.insight client and log in to the given server

     *
       - OMERO.editor
       - Open the OMERO.editor client and log in to the given server

     *
       - OMERO.fs
       -

     *
       - OMERO.web
       - Open the OMERO.web client and log in to the given server

     *
       - OMERO.server
       - ssh to the server. Go to ``/home/hudson/<server-name>/`` Start the OMERO.server ``bin/omero admin start``

     *
       - OMERO.ij
       -

     *
       - OMERO.diagnostics
       - ssh to the server. Go to ``/home/hudson/<server-name>/``. Run ``bin/omero admin diagnostics``

     *
       - OMERO.shell
       - ssh to the server. Go to ``/home/hudson/<server-name>/``. Run ``bin/omero shell``

     *
       - OMERO.importer-cli
       - ssh to the server. Go to ``/home/hudson/<server-name>/``. Run ``bin/omero import`` on the server and import a file.  Once the file is imported and appears in OMERO there should be a hit. 

     *
       - OMERO.imagej
       -

         - Copy the appropriate :file:`insight-ij` plugin and the appropriate
           :file:`bioformats_package.jar` into the Plugins folder of your
           ImageJ
         - Open ImageJ
         - Connect to OMERO and log in
         - Make sure there was **only ONE** hit recorded (see the steps 1. -
           2. above for how to do it)
         - Close the :file:`insight-ij` plugin interface running under the
           ImageJ, but do not close ImageJ itself
         - Connect to OMERO (you will be connected automatically)
         - Close the :file:`insight-ij` plugin and ImageJ
         - Make sure there was **only ONE more hit** recorded (see the steps 1. -
           2. above for how to do it). Summed up, from the OMERO.imagej testing you should score 2 hits.

     *
       - OMERO.dropbox
       - Go to the server and copy file to Dropbox folder ``/repositories/<server-name>/DropBox/user``. Once the file is imported and appears in OMERO there should be a hit. 

     *
       - OMERO.bioformats
       - Download the Bio-Formats command-line tools and run
         ``showinf -nopix test.fake``

     *
       - OMERO.test
       - ssh to the server. Go to ``/home/hudson/<server-name>/``. Run ``bin/omero admin checkupgrade`` (5.2.0 and above)

     *
       - OMERO.matlab
       - N/A

