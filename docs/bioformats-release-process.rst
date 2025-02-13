Bio-Formats release
===================

.. _Bio-Formats: https://github.com/ome/bioformats
.. _Bio-Formats Documentation: https://github.com/ome/bio-formats-documentation
.. _Bio-Formats Downloads: https://downloads.openmicroscopy.org/bio-formats/
.. _Octave Docker: https://github.com/ome/bio-formats-octave-docker
.. _Read The Docs: https://readthedocs.org/projects/bio-formats/builds/
.. _Data Repository: https://github.com/openmicroscopy/data_repo_config
.. _Bio-Formats homebrew: https://github.com/ome/homebrew-alt

This document describes the release process of the `Bio-Formats`_ Java library.
The release process uses GitHub actions, make sure that the actions are active before pushing any tag.

Before starting the release process, make sure documentation is updated appropriately:

- open a Pull Request with a new release entry in the `whats-new <https://github.com/ome/bio-formats-documentation/blob/master/sphinx/about/whats-new.rst>`_ page
- if any new reader or writer options were added, open a pull request to update `the options page <https://github.com/ome/bio-formats-documentation/blob/master/sphinx/formats/options.rst>`_ and relevant `format page entries <https://github.com/ome/bio-formats-documentation/blob/master/src/main/resources/format-pages.txt>`_
- if any new readers or writers were added, open a pull request to add them to the `list of supported formats <https://github.com/ome/bio-formats-documentation/blob/master/src/main/resources/format-pages.txt>`_

When all changes are approved by both the OME team and the Glencoe Software team, merge documentation pull requests and start the release process.


Source code release
-------------------

Before making a new release, merge all contributions on the ``develop`` branch of `Bio-Formats`_.

The first operation to perform a Maven release is to bump the version out of
``SNAPSHOT`` using the Maven versions plugin, add and commit::

    $ mvn versions:set -DnewVersion=x.y.z -DgenerateBackupPoms=false
    $ mvn versions:set-property -Dproperty=release.version -DnewVersion=x.y.z -DgenerateBackupPoms=false
    $ git add -u .
    $ git commit -m "Bump release version to x.y.z"


A signed tag must be created for the released version using :command:`git tag -s`::

    $ git tag -s -m "Tag version x.y.z" vx.y.z


Revert to ``SNAPSHOT``, add and commit::

    $ mvn versions:set -DnewVersion=x.y.t-SNAPSHOT -DgenerateBackupPoms=false
    $ mvn versions:set-property -Dproperty=release.version -DnewVersion=x.y.z-SNAPSHOT -DgenerateBackupPoms=false
    $ git add -u .
    $ git commit -m "Revert to snapshot"

Both the ``develop`` branch as well as the tag must be pushed upstream::

    $ git push origin develop vx.y.z

This will trigger GitHub action builds, generate artifacts, create a GitHub release and upload
the artifacts to the release on GitHub and to the `OME artifactory`_. 
An hourly cron job runs on our virtual machine and copy the artifacts published on Github under `Bio-Formats Downloads`_.

Close the milestone if any and add new one if needed.

Testing the artifacts
---------------------

To test the artifacts published, 
 - Test the `bio-formats-command-line-tools <testing_scenarios/GeneralRelease.html#bio-formats-command-line-tools>`_.
 - Test `MATLAB (only) <testing_scenarios/GeneralRelease.html#bio-formats-matlab-octave>`_.
 - Check the schema version in OME-XML be ``2016-06`` using the command line tools::
      $ ./bfconvert B.ome.tiff
      $ ./tiffcomment B.ome.tiff

If an error occurs during the testing:
 - Delete the release and the tag on GitHub.
 - Delete the artifacts on `OME artifactory`_.
 - Delete the folder corresponding to the latest release under `Bio-Formats Downloads`_, if it has already been created.

Fiji update site
----------------

After merging all contributions on the ``master`` branch
of https://github.com/ome/bio-formats-fiji, bump the version, add and
commit::

    $ mvn versions:set -DnewVersion=x.y.z -DgenerateBackupPoms=false
    $ mvn versions:set-property -Dproperty=bioformats.version -DnewVersion=x.y.z -DgenerateBackupPoms=false
    $ git add -u .
    $ git commit -m "Bump release version to x.y.z"
    $ git push origin master

Run the `mvn package` command by pointing the `fiji.home` property at the home
folder of your local Fiji application to replace the Bio-Formats JARs e.g.::

    $ mvn clean package -Dfiji.home=/Application/Fiji.app/

Test the Fiji Bio-Formats plugin as described in the
`Fiji Plugin scenario <testing_scenarios/GeneralRelease.html#bio-formats-imagej-fiji-testing>`_.
Once validated, `upload <https://imagej.net/update-sites/setup#Uploading_files_to_your_update_site>`_
the Bio-Formats JARs to the Java-8 update site.

Revert to ``SNAPSHOT``, add, commit and push to origin::

    $ mvn versions:set -DnewVersion=x.y.t-SNAPSHOT -DgenerateBackupPoms=false
    $ git add -u .
    $ git commit -m "Revert to snapshot"
    $ git push origin master

Bio-Formats examples release
----------------------------

Before making a release, merge all contributions on the ``master`` branch of `Bio-Formats Examples <https://github.com/ome/bio-formats-examples>`_.

The first operation to perform a Maven release is to bump the version out of
``SNAPSHOT`` using the Maven versions plugin::

    $ mvn versions:set -DnewVersion=x.y.z -DgenerateBackupPoms=false
    $ mvn versions:set-property -Dproperty=formats-bsd.version -DnewVersion=x.y.z -DgenerateBackupPoms=false

Bump the ``version`` and ``formats-bsd`` in :file:`build.gradle`.

Add and commit::

    $ git add -u .
    $ git commit -m "Bump release version to x.y.z"


A signed tag must be created for the released version using :command:`git tag -s`::

    $ git tag -s -m "Tag version x.y.z" vx.y.z

Revert to ``SNAPSHOT`` in :file:`pom.xml`::

    $ mvn versions:set -DnewVersion=x.y.t-SNAPSHOT -DgenerateBackupPoms=false

Revert the ``version`` to ``SNAPSHOT`` in :file:`build.gradle`.

Add and commit::

    $ git add -u .
    $ git commit -m "Bump version to x.y.t-SNAPSHOT"

Both the ``master`` branch as well as the tag must be pushed upstream::

    $ git push origin master vx.y.z

This will trigger GitHub action builds, generate artifacts and upload
the artifacts to the `OME artifactory`_. 


Documentation release
---------------------

Before making a new release, merge all contributions on the ``master`` branch of `Bio-Formats Documentation`_.

The first operation to perform a Maven release is to bump the version out of
``SNAPSHOT`` using the Maven versions plugin, add and commit::

    $ mvn versions:set -DnewVersion=x.y.z -DgenerateBackupPoms=false
    $ mvn versions:set-property -Dproperty=bioformats.version -DnewVersion=x.y.z -DgenerateBackupPoms=false
    $ mvn versions:set-property -Dproperty=bio-formats-examples.version -DnewVersion=x.y.z -DgenerateBackupPoms=false
    $ git add -u .
    $ git commit -m "Bump release version to x.y.z"

A signed tag must be created for the released version using :command:`git tag -s`::

    $ git tag -s -m "Tag version x.y.z" vx.y.z

Revert to ``SNAPSHOT``, add and commit::

    $ mvn versions:set -DnewVersion=x.y.t-SNAPSHOT -DgenerateBackupPoms=false
    $ git add -u .
    $ git commit -m "Revert to snapshot"

Both the ``master`` branch as well as the tag must be pushed upstream::

    $ git push origin master vx.y.z


The documentation is built and published on `Read The Docs`_.

An hourly cron job runs on our virtual machine and adds redirect from for example `docs.openmicroscopy.org/bio-formats/7.3.1 <https://docs.openmicroscopy.org/bio-formats/7.3.1>`_ to `bio-formats.readthedocs.io/en/v7.3.1/ <https://bio-formats.readthedocs.io/en/v7.3.1/>`_.

Close the milestone if any and add new one if needed.


Homebrew
--------

Before making a new release, merge all contributions on the `master` branch (rare) of `Bio-Formats homebrew`_.

- Update the `Bio-Formats formula <https://github.com/ome/homebrew-alt/blob/master/Formula/bioformats>`_
  by pointing to the ``bioformats-RELEASE.zip`` and update the ``sha256`` value. The ``sha256`` can be found in the ``SHASUM`` file under https://downloads.openmicroscopy.org/bio-formats/RELEASE/artifacts/.
- Update the version and sha256 in the ``.rb`` file corresponding to the current release.


Add, commit the changes and push to origin::

    $ git add -u .
    $ git commit -m "Bump release version to x.y.z"
    $ git push origin master


Docker container release
------------------------

Before making a new release, merge all contributions on the `master` branch (rare) of `Octave Docker`_.

When the artifacts are available under `Bio-Formats Downloads`_, you can release the `Octave Docker`_.
Bump the version in `Dockerfile <https://github.com/ome/bio-formats-octave-docker/blob/master/Dockerfile>`_ to the latest release version.

Add, commit the changes and push to origin::

    $ git add -u .
    $ git commit -m "Bump release version to x.y.z"
    $ git push origin master

Close the milestone if any and add new one if needed.


Data repository release
-----------------------

Before making a new release, merge all contributions on the `master` branch of `Data Repository`_.

A signed tag must be created for the released version using :command:`git tag -s`::

    $ git tag -s -m "Tag version x.y.z" vx.y.z
    $ git push origin vx.y.z


Website release
---------------

When the documentation is deployed, you can make a release of the `Open Microscopy Environment`_ website.

To make a release:
 - Update the version in `_config.yml <https://github.com/ome/www.openmicroscopy.org/tree/master/_config.yml>`_
 - Add a new entry under `_posts <https://github.com/ome/www.openmicroscopy.org/tree/master/_posts>`_. The name of the post should be ``YYYY-MM-DD-bio-formats-MAJOR-MINOR-PATCH.md`` e.g. ``2024-10-24-bio-formats-8-0-0.md``
 - Point to the post announcing the release in `bio-formats/downloads/index.html <https://github.com/ome/www.openmicroscopy.org/tree/master/bio-formats/downloads/index.html>`_.
 - Add, in alphabetical order, new contributors to `_data/bio-formats.json <https://github.com/ome/www.openmicroscopy.org/tree/master/_data/bio-formats.json>`_ and `_data/contributors.json <https://github.com/ome/www.openmicroscopy.org/tree/master/_data/contributors.json>`_.

A signed tag must be created using :command:`git tag -s`::

    $ git tag -s -m "Message" YYYY.MM.DD

Before pushing, make sure that the documentation has been built and published on `Read The Docs`_.
Both the `master` branch as well as the tag must be pushed upstream::

    $ git push origin master YYYY.MM.DD

An hourly cron job runs on our virtual machine and deploys the website.


Announcement
------------

 - Announce the release on `image.sc`_ using the ``Announcements`` category after checking that the website has been deployed.
 - Announce on the Confocal email
 - Announce on X and linkedin


Post Release
------------

 - Add an entry in `Web Server Stats`_.
 - Bump Bio-Formats version in `omero-model <https://github.com/ome/omero-model/blob/master/build.gradle>`_.
 - Bump Bio-Formats version in `OMEZarrReader <https://github.com/ome/ZarrReader/blob/main/pom.xml>`_.
 - Bump Bio-Formats version in `pom-scijava <https://github.com/scijava/pom-scijava/blob/master/pom.xml>`_.

