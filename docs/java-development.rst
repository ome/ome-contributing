Java components (Maven)
=======================

.. _Central Repository: https://central.sonatype.org/pages/about/
.. _Semantic Versioning: https://semver.org
.. _Git: https://git-scm.com/
.. _Maven: https://maven.apache.org/

This document describes the conventions and process used by the OME team for developing and maintaining
Java components using Maven_ as their build system and publishing them to the `Central Repository`_ under
the `org.openmicroscopy <https://central.sonatype.com/search?namespace=org.openmicroscopy>`_
namespace.

The set of rules and procedures described below applies to all the following
Java libraries.

.. list-table::
    :header-rows: 1

    -   * Component name
        * GitHub URL
        * groupId:artifactId

    -   * OME Common Java libary
        * https://github.com/ome/ome-common-java
        * `org.openmicroscopy:ome-common <https://central.sonatype.com/artifact/org.openmicroscopy/ome-common>`_

    -   * OME Data model
        * https://github.com/ome/ome-model
        * | `org.openmicroscopy:ome-model <https://central.sonatype.com/artifact/org.openmicroscopy/ome-model>`_
            `org.openmicroscopy:ome-xml <https://central.sonatype.com/artifact/org.openmicroscopy/ome-xml>`_
            `org.openmicroscopy:specification <https://central.sonatype.com/artifact/org.openmicroscopy/specification>`_

    -   * OME JAI
        * https://github.com/ome/ome-jai
        * `org.openmicroscopy:ome-jai <https://central.sonatype.com/artifact/org.openmicroscopy/ome-jai>`_

    -   * OME POI
        * https://github.com/ome/ome-poi
        * `org.openmicroscopy:ome-poi <https://central.sonatype.com/artifact/org.openmicroscopy/ome-poi>`_

    -   * OME MDB Tools
        * https://github.com/ome/ome-mdbtools
        * `org.openmicroscopy:ome-mdbtools <https://central.sonatype.com/artifact/org.openmicroscopy/ome-mdbtools>`_

    -   * OME Stubs
        * https://github.com/ome/ome-stubs
        * | `org.openmicroscopy:ome-stubs <https://central.sonatype.com/artifact/org.openmicroscopy/ome-stubs>`_
            `org.openmicroscopy:lwf-stubs <https://central.sonatype.com/artifact/org.openmicroscopy/lwf-stubs>`_
            `org.openmicroscopy:mipav-stubs <https://central.sonatype.com/artifact/org.openmicroscopy/mipav-stubs>`_

    -   * OME Metakit
        * https://github.com/ome/ome-metakit
        * `org.openmicroscopy:metakit <https://central.sonatype.com/artifact/org.openmicroscopy/metakit>`_

    -   * OME Codecs
        * https://github.com/ome/ome-codecs
        * `org.openmicroscopy:ome-codecs <https://central.sonatype.com/artifact/org.openmicroscopy/ome-codecs>`_

.. note::
   Some of the historical monolithic Java projects, including Bio-Formats and
   OMERO, do not strictly comply with these guidelines yet. As the project
   evolves and components are migrated, any new Java repository should follow 
   this set of rules.

Conventions
-----------

Source code and build system
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The source code of a Java library should be maintained under version control
using Git_ and hosted on GitHub_.

Maven_ should be used as the primary build system. The directory layout should
follow the standard Maven layout i.e. in the case of a single-module project::

   pom.xml
   src/
     main/
       java/
         <package>
   test/
     main/
       java/
         <package>

Additionally, the top-level :file:`pom.xml` should be structured according to
the `Maven guidelines <https://maven.apache.org/developers/conventions/code.html>`_.

.. seealso::
   :doc:`using-git`

Development
^^^^^^^^^^^

Java components use `Semantic Versioning`_ i.e. given a version number
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
to the `Central Repository`_ according to the process described in the next
section.

Release process
---------------

Maintainer prerequisites
^^^^^^^^^^^^^^^^^^^^^^^^

To be able to maintain a Java component, a developer must have:

- a GitHub_ account with push rights to the GitHub source code repository
- a Central Portal account registered as an user of the
  `org.openmicroscopy` namespace
- a valid GPG key for signing the tags and the JARs
- a local :file:`~/.m2/settings.xml` file configured with an user token
  generated as described in https://central.sonatype.org/publish/generate-portal-token/

Follow the instructions at https://central.sonatype.org/register/central-portal/ to
register to publish via the Central Portal. You need to contact Central Support to be
associated with the `org.openmicroscopy` namespace.

.. seealso::

    https://central.sonatype.org/register/central-portal/
      Register to Publish Via the Central Portal

    https://central.sonatype.org/publish/generate-portal-token/
      Generating a Portal Token for Publishing

    https://central.sonatype.org/publish/publish-portal-maven/
      Publishing By Using the Maven Plugin

Release strategies
^^^^^^^^^^^^^^^^^^

There are different strategies to release a Maven component. At the moment we
are pushing 2 successive commits (or Pull Requests) to the master branch. The
first commit/Pull Request bumps the version number to the release version and
is used for generating the release while the second commit bumps the version
to the next development cycle.

.. seealso::
    https://imagej.net/Development_Lifecycle
       A section describing approaches which OME might be considering.

Release preparation
^^^^^^^^^^^^^^^^^^^

The first step of the Java component release is to prepare a release
candidate on the GitHub_ and `Central Repository`_ repositories.

The first operation to perform a Maven release is to bump the version out of
SNAPSHOT either via editing the :file:`pom.xml` manually or using the Maven
versions plugin::

    $ mvn versions:set -DnewVersion=x.y.z -DgenerateBackupPoms=false
    $ git add -u .
    $ git commit -m "Bump release version to x.y.z"

Additionally, a PGP-signed tag should be created for the released version e.g.
using :command:`git tag -s`::

    $ git tag -s -m "Release version x.y.z" vx.y.z

Optionally, push the master branch and the tag to your fork for validation by another
member of the team::

    $ git push <fork_name> master
    $ git push <fork_name> vx.y.z

Once you have updated all the versions and ensured that your build passes
without deployment you can perform the deployment by using the release profile
with::

    $ mvn clean deploy -P release
    # Potentially add -D gpg.keyname=keyname if desired.

This will perform validation steps and upload the artifacts to a staging deployment
available at https://central.sonatype.com/publishing/deployments.

Publication
^^^^^^^^^^^

At the moment all Java components use the Central Publishing Maven plugin with the
`auoPublish` option set to `false`. To finish the publication, visit
https://central.sonatype.com/publishing/deployments and click `Publish`.

The GitHub tag can be pushed to the organization repository::

    $ git push origin vx.y.z

Next development version
^^^^^^^^^^^^^^^^^^^^^^^^

Finally create a commit to bump the new development version e.g. using the Maven
versions plugin again and push the master branch::

    # Where w == z+1
    $ mvn versions:set -DnewVersion=x.y.w-SNAPSHOT -DgenerateBackupPoms=false
    $ git add -u .
    $ git commit -m "Bump release version to x.y.w-SNAPSHOT"
    $ git push origin master

Javadoc
^^^^^^^

At the moment, we use the service provided https://javadoc.io/ for public
hosting of the Javadoc. For each release to Maven Central, the new Javadoc
should be automatically deployed within 24h. It is possible to trigger the
generation of the Javadoc by visiting the URL.
