Java components (Maven)
=======================

.. _Central Repository: https://search.maven.org
.. _Semantic Versioning: https://semver.org
.. _Git: https://git-scm.com/
.. _Maven: https://maven.apache.org/

This document describes the conventions and process used by the OME team for developing, maintaining and releasing its Java components
using Maven_ as their build system.

The set of rules and procedures described below applies to all the following
Java libraries.

.. list-table::
    :header-rows: 1

    -   * Component name
        * GitHub URL
        * groupId:artifactId

    -   * OME Common Java libary
        * https://github.com/ome/ome-common-java
        * `org.openmicroscopy:ome-common`

    -   * OME Data model
        * https://github.com/ome/ome-model
        * | `org.openmicroscopy:ome-model`
            `org.openmicroscopy:ome-xml`
            `org.openmicroscopy:specification`
            `org.openmicroscopy:ome-model-doc`

    -   * OME POI
        * https://github.com/ome/ome-poi
        * `org.openmicroscopy:ome-poi`

    -   * OME MDB Tools
        * https://github.com/ome/ome-mdbtools
        * `org.openmicroscopy:ome-mdbtools`

    -   * OME Stubs
        * https://github.com/ome/ome-stubs
        * | `org.openmicroscopy:ome-stubs`
            `org.openmicroscopy:lwf-stubs`
            `org.openmicroscopy:mipav-stubs`

    -   * OME Metakit
        * https://github.com/ome/ome-metakit
        * `org.openmicroscopy:metakit`

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
to the Central Repository according to the process described in the next
section.

Release process
---------------

Maintainer prerequisites
^^^^^^^^^^^^^^^^^^^^^^^^

To be able to maintain a Java component, a developer must have:

- a GitHub_ account with push rights to the GitHub source code repository
- a Sonatype_ account and be registered as a maintainer of the
  `org.openmicroscopy` repository
- a valid PGP key for signing the tags and the JARs
- a local :file:`~/.m2/settings.xml` file configured with an access token
  generated as described in https://central.sonatype.org/publish/generate-token

Follow the instructions at https://central.sonatype.org/register/legacy to
create a Sonatype account allowing to publish via OSSRH. You need to
contact Central Support to be able to release the artifacts of
groupId `org.openmicroscopy`.

.. seealso:

    https://central.sonatype.org/register/legacy
      Registration instructions to public via OSSRH

    https://central.sonatype.org/publish/publish-guide/
      Publishing via OSSRH

    https://central.sonatype.org/publish/generate-token
      Generating a token for publishing via OSSRH

    https://central.sonatype.org/publish/publish-maven/
      Deploying to OSSRH with Apache Maven

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
candidate on the GitHub_ and Sonatype_ repositories.

The first operation to perform a Maven release is to bump the version out of
SNAPSHOT either via editing the :file:`pom.xml` manually or using the Maven
versions plugin::

    $ mvn versions:set -DnewVersion=x.y.z -DgenerateBackupPoms=false
    $ git add -u .
    $ git commit -m "Bump release version to x.y.z"

Additionally, a PGP-signed tag should be created for the released version e.g.
using :command:`git tag -s`::

    $ git tag -s -m "Release version x.y.x" vx.y.z

Optionally, push the master branch and the tag to your fork for validation by another
member of the team::

    $ git push <fork_name> master
    $ git push <fork_name> vx.y.z

Once you have updated all the versions and ensured that your build passes
without deployment you can perform the deployment by using the release profile
with::

    $ mvn clean deploy -P release
    # Potentially add -D gpg.keyname=keyname if desired.

This will upload the artifacts to a staging Sonatype repository and perform
all the validation steps. The uploaded artifacts can be examined at
\https://oss.sonatype.org/content/repositories/orgopenmicroscopy-xxxx/ where
xxxx is an number incremented for each release.

Release promotion
^^^^^^^^^^^^^^^^^

At the moment all Java components use the Nexus Staging Maven plugin with the
`autoReleaseAfterClose` option set to `false`. A separate promotion step is
necessary for releasing the component to the Sonatype releases repository.
This promotion can happen either via the Sonatype UI as described in
https://central.sonatype.org/publish/release/ or via command-line using
the release phase of the nexus-staging plugin::

    $ mvn nexus-staging:release -P release

The rsync to Central Maven and the update of Maven search usually happen
within a couple of hours but the components are accessible beforehand.

Once the tag is validated, the tag can  be pushed to the organization repository::

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
