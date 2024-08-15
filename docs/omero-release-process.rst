OMERO.server release
====================

.. _OMERO: https://github.com/ome/openmicroscopy/
.. _OMERO Downloads: https://downloads.openmicroscopy.org/omero/
.. _OMERO Server Docker: https://github.com/ome/omero-server-docker
.. _OMERO Documentation: https://github.com/ome/omero-documentation/
.. _Read The Docs: https://readthedocs.org/
.. _OME website: https://github.com/ome/www.openmicroscopy.org


This document describes the release process for OMERO_ server.

Register CVE
^^^^^^^^^^^^

To be added

Release process
^^^^^^^^^^^^^^^

Source code release
-------------------

To make a new release:
 - Merge all contributions on the `develop` branch.
 - Ensure that all the dependencies have been bumped via the :file:`update.yml` GitHub action which is run hourly. You can also execute the script :file:`update_dependencies.sh` manually if you wish.
 - Add an entry to :file:`history.rst`.

After committing the changes, a signed tag must be created for the released version
using :command:`git tag -s`::

    $ git tag -s -m "Tag version x.y.z" vx.y.z

Both the `develop` branch as well as the tag must be pushed upstream::

    $ git push origin develop vx.y.z

This will trigger GitHub action builds, generate artifacts, create a GitHub release and upload
the artifacts to the release on GitHub.
An hourly cron job runs on our virtual machine and copy the artifacts published on Github under `OMERO Downloads`_.

Docker container release
------------------------

Before making a new release, merge all contributions on the `master` branch (rare).

When the artifacts are available under `OMERO Downloads`_, you can release the `OMERO Server Docker`_.
Bump the version in :file:`Dockerfile` to the latest release version.

After committing the changes, a signed tag must be created for the released version
using :command:`git tag -s`::

    $ git tag -s -m "Tag version x.y.z" vx.y.z

Both the `master` branch as well as the tag must be pushed upstream::

    $ git push origin master vx.y.z


Documentation release
---------------------

Before making a new release, merge all contributions on the `master` branch.

A GitHub action is run daily to update the documentation with changes made in various repositories
e.g. ``omero-install``, ``omeroweb-install``, ``openmicroscopy``, and bump the version of various components e.g. ``omero-web``.
If you wish to publish the documentation the same day as the source code release, the easiest option is to 
modify the format of the cron job in the :file:`update.yml` GitHub action, commit and push the change to the `master` branch.

After a succesful run of the :file:`update.yml` GitHub action, merge the Pull Request.
After fetching the `master` branch, revert the change to the cron job in :file:`update.yml`. A signed tag must be created for the released version using :command:`git tag -s`::

    $ git tag -s -m "Tag version x.y.z" vx.y.z

Both the `master` branch as well as the tag must be pushed upstream::

    $ git push origin master vx.y.z

The documentation is then published on `Read The Docs`_.

An hourly cron job runs on our virtual machine and redirects the documentation under `docs.openmicroscopy.org <https://docs.openmicroscopy.org/omero>`_ to `omero.readthedocs.io/ <https://omero.readthedocs.io/>`_.

Website release
---------------

When the documentation is deployed, you can make a release of the `OME website`_.

 - Update the version in :file:`_config.yml`
 - Add a new entry under :file:`_posts`

 A signed tag must be created using :command:`git tag -s`::

    $ git tag -s -m "Message" YYYY-MM-DD

Both the `master` branch as well as the tag must be pushed upstream::

    $ git push origin master YYYY-MM-DD

An hourly cron job runs on our virtual machine and deploys the website.

Finally add an entry in https://docs.google.com/spreadsheets/d/1K7ab1UpuiE3FmAq3et7OpyxFwumrT7z8tGrDDBSDxsk/edit#gid=908994883.


