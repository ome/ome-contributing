OMERO.web release
=================

.. _OMERO Web: https://github.com/ome/omero-web/
.. _OMERO Web Docker: https://github.com/ome/omero-web-docker/

This document describes the release process for `OMERO Web`_.
The release process uses GitHub actions, make sure that the actions are **active** before pushing any tag.


Release process
^^^^^^^^^^^^^^^

Source code release
-------------------

See `Release process <https://github.com/ome/omero-web#release-process>`_.

Docker container release
------------------------

Before making a new release of `OMERO Web Docker`_, merge all contributions on the `master` branch.

A signed tag must be created for the released version
using :command:`git tag -s`::

    $ git tag -s -m "Tag version x.y.z" x.y.z

The tag must be pushed upstream::

    $ git push origin x.y.z


Website release
---------------

When the documentation is deployed, you can make a release of the `Open Microscopy Environment`_ website.

To make a release:
 - Update the version in `_config.yml <https://github.com/ome/www.openmicroscopy.org/tree/master/_config.yml>`_
 - Add a new entry under `_posts <https://github.com/ome/www.openmicroscopy.org/tree/master/_posts>`_. The name of the post should be ``YYYY-MM-DD-omero-web-MAJOR.MINOR.PATCH.md`` e.g. ``2024-08-15-omero-web-5.26.0.md``
 - Point to the post announcing the release in `omero/downloads/index.html <https://github.com/ome/www.openmicroscopy.org/tree/master/omero/downloads/index.html>`_.


A signed tag must be created using :command:`git tag -s`::

    $ git tag -s -m "Message" YYYY.MM.DD

Both the `master` branch as well as the tag must be pushed upstream::

    $ git push origin master YYYY.MM.DD

An hourly cron job runs on our virtual machine and deploys the website.

Finally 
- Announce the release on `image.sc`_ using the ``Announcements`` category after checking that the website has been deployed.