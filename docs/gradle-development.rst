Java components (Gradle)
========================

.. _Semantic Versioning: https://semver.org
.. _Git: https://git-scm.com/
.. _Gradle: https://gradle.org/

This document describes the conventions and process used by the OME team for developing,
maintaining and releasing its Java components using Gradle_ as their build system. The
set of rules and procedures described below applies to all the submodules of
https://github.com/ome/omero-build as well as https://github.com/ome/omero-gradle-plugins/.

.. seealso::

    :doc:`java-development`
       Conventions and process for maintaining the OME Java Components using Maven

Conventions
-----------

Source code and build system
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The source code of the components is maintained under version control
using Git_ and hosted on GitHub_.

Gradle_ is the primary build system. The directory layout should
follow the standard Maven layout i.e. in the case of a single-module project::

   .github/
     workflows/     # GitHub actions workflow
   src/
     main/          # Component source
   test/
     main/
  LICENSE.txt
  README.md
  build.gradle
  settings.gradle

Additionally, a :file:`publish.gradle` might exist allowing to declare some publishing tasks.

.. seealso::
   :doc:`using-git`

Development
^^^^^^^^^^^

Server components follow `Semantic Versioning`_ i.e. given a version number
MAJOR.MINOR.PATCH, increment the:

- MAJOR version when you make incompatible API changes,
- MINOR version when you add functionality in a backwards-compatible manner,
  and
- PATCH version when you make backwards-compatible bug fixes.

In between releases the version is bumped to the next SNAPSHOT version.

Code contributions should follow the guidelines highlighted in :doc:`code-contributions`.

Distribution
^^^^^^^^^^^^

All the release artifacts for the repositories listed above should be deployed
to the OME Artifactory according to the process described in the next
section.

Release process
---------------

To  make a new component release, after merging all contributions, on the `master`
branch, the version defined in :file:`build.gradle` must be moved out of SNAPSHOT
and set to the target version.

After committing the changes, a PGP-signed tag must be created for the released version
using :command:`git tag -s`::

    $ git tag -s -m "Tag version x.y.z" vx.y.z

The version should then be set to the next SNAPSHOT version in :file:`build.gradle` and
the changes committed to the `master` branch.

Both the master branch as well as the tag must be pushed upstream::

    $ git push origin master vx.y.z

This will trigger two GitHub Actions builds and the generated artifacts will be uploaded
to the OME Artifactory. All builds from the `master` branch are expected to be snapshots
and uploaded to the `ome.snapshots` repository. All tag builds are expected to be full
releases and uploaded to the `ome.releases` repository.

On GitHub, create a release from the `vx.y.z` tag e.g. using https://github.com/ome/omero-server/releases/new
and use `Generate release notes` to automatically fill the release content.
