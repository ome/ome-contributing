OMERO.server release
====================

.. _OMERO: https://github.com/ome/openmicroscopy/
.. _OMERO Downloads: https://downloads.openmicroscopy.org/omero/
.. _OMERO Server Docker: https://github.com/ome/omero-server-docker
.. _OMERO Documentation: https://github.com/ome/omero-documentation/
.. _Read The Docs: https://readthedocs.org/projects/omero/builds/
.. _image.sc: https://forum.image.sc/

This document describes the release process for OMERO_ server.
The release process uses GitHub actions, make sure that the actions are active before pushing any tag.

Register CVE
^^^^^^^^^^^^

To be added

Release process
^^^^^^^^^^^^^^^

Source code release
-------------------

To make a new release:
 - Merge all contributions on the ``develop`` branch.
 - Ensure that all the dependencies have been bumped via the `update <https://github.com/ome/openmicroscopy/blob/develop/.github/workflows/update.yaml>`_ GitHub action which is run hourly. The action will open a Pull Request that updates the `omero.properties <https://github.com/ome/openmicroscopy/blob/develop/etc/omero.properties>`_ file, merge the Pull Request. You can also execute locally the script `update_dependencies.sh <https://github.com/ome/openmicroscopy/blob/develop/update_dependencies.sh>`_ manually if you wish.
 - Add an entry to `history.rst <https://github.com/ome/openmicroscopy/blob/develop/history.rst>`_.

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
Bump the version in `Dockerfile <https://github.com/ome/omero-server-docker/blob/master/Dockerfile>`_ to the latest release version.

After committing the changes, a signed tag must be created for the released version
using :command:`git tag -s`::

    $ git tag -s -m "Tag version x.y.z" x.y.z

Both the `master` branch as well as the tag must be pushed upstream::

    $ git push origin master x.y.z


Documentation release
---------------------

Before making a new release, merge all contributions on the `develop` branch.

A GitHub action is run daily to update the documentation with changes made in various repositories
e.g. ``omero-install``, ``omeroweb-install``, ``openmicroscopy``, and bump the version of various components e.g. ``omero-web``.
If you wish to publish the documentation the same day as the source code release, the easiest option is to 
modify the format of the cron job in the `update.yml <https://github.com/ome/omero-documentation/blob/develop/.github/workflows/update.yml>`_ GitHub action, commit and push the change to the `develop` branch.

After a succesful run of the `update.yml <https://github.com/ome/omero-documentation/blob/develop/.github/workflows/update.yml>`_ GitHub action, merge the Pull Request created by the action if changes were made in the related repositories.
After fetching the `develop` branch, revert the change to the cron job in :file:`update.yml`. A signed tag must be created for the released version using :command:`git tag -s`::

    $ git tag -s -m "Tag version x.y.z" vx.y.z

Both the `develop` branch as well as the tag must be pushed upstream::

    $ git push origin develop vx.y.z

The documentation is built and published on `Read The Docs`_.

An hourly cron job runs on our virtual machine and adds redirect from for example `docs.openmicroscopy.org/omero/5.6.13 <https://docs.openmicroscopy.org/omero/5.6.13>`_ to `omero.readthedocs.io/en/v5.6.13/ <https://omero.readthedocs.io/en/v5.6.13/>`_.

Website release
---------------

When the documentation is deployed, you can make a release of the `Open Microscopy Environment`_ website.

To make a release:
 - Update the version in `_config.yml <https://github.com/ome/www.openmicroscopy.org/tree/master/_config.yml>`_
 - Add a new entry under `_posts <https://github.com/ome/www.openmicroscopy.org/tree/master/_posts>`_. The name of the post should be ``YYYY-MM-DD-omero-MAJOR-MINOR-PATCH.md`` e.g. ``2024-08-15-omero-5-6-13.md``
 - Point to the post announcing the release in `omero/downloads/index.html <https://github.com/ome/www.openmicroscopy.org/tree/master/omero/downloads/index.html>`_.


A signed tag must be created using :command:`git tag -s`::

    $ git tag -s -m "Message" YYYY.MM.DD

Both the `master` branch as well as the tag must be pushed upstream::

    $ git push origin master YYYY.MM.DD

An hourly cron job runs on our virtual machine and deploys the website.

Finally add an entry in https://docs.google.com/spreadsheets/d/1K7ab1UpuiE3FmAq3et7OpyxFwumrT7z8tGrDDBSDxsk/edit#gid=908994883 and announce the release on `image.sc <https://forum.image.sc/>`_ using the ``Annoucements`` categorie.


