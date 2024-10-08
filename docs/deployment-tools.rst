OME deployment tools
====================

This section describes deployment tools supported by the OME team.
It is primarily designed for the core OME developers who want to
bring new or upgrade existing prerequisites. The following steps explain
the connections between basic repositories and the testing workflow.


.. note::

    This section requires a brief understanding of
    :ansible_docs:`Ansible <user_guide/intro_getting_started.html>`
    and Docker engine https://docs.docker.com/.

Prerequisites locations
-----------------------

The list of OME prerequisites is stored in multiple git repositories, each of 
which is available from several locations.

OME Infrastructure
^^^^^^^^^^^^^^^^^^

Infrastructure is provided to simplify deployment using 
`Ansible <https://www.ansible.com>`_.

The Infrastructure repository is available from:

-  https://github.com/ome/infrastructure

Roles repositories are available in:

-  https://github.com/ome?q=ansible-role


OMERO-install
^^^^^^^^^^^^^

OMERO installation scripts are provided to help new users with installing
OMERO.server for the first time on a clean system, and can be used as
the basis for more advanced configurations.

The OMERO-install repository is available from:

-  https://github.com/ome/omero-install

The OMEROWEB-install repository is available from:

-  https://github.com/ome/omeroweb-install

Testing workflow
----------------

The testing environment is split into two tiers: developer and production
testing platform.


Devspace - Continuous Integration (Dev Testing)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Continuous integration tools managed by Jenkins CI providing
an automation framework that runs repeated jobs. The default deployment
initializes a Jenkins CI master with a predefined set of jobs.

The :doc:`Devspace <devspace>` repository is available from:

-  https://github.com/ome/devspace

Devspace Dockerfiles uses common devagent image. The repository
is available from:

-  https://github.com/ome/devagent-docker


CI-master - Continuous Delivery (Production)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Production Continuous Delivery (CD) platform managed by
Jenkins_.
More details about CI-master available on :doc:`continuous-integration`


How to add new/upgrade/remove old prerequisites
-----------------------------------------------

When the OME platform requires a new set of prerequisites all the above
listed repositories may require updates. Depends on the nature of 
packages developers must consider:

- infrastructure repository:

  - adding new Ansible role in its own repo or update existing one
    https://github.com/ome?q=ansible-role
  - adding complete Ansible playbook to Infrastructure

- adding new scripts installing appropriate package and its dependencies
  to OMERO-install or OMEROWEB-install, that includes:

  - updating Linux and Mac installation scripts
  - updating documentation autogen

- deploying Devspace to test OMERO-install scripts, that includes:

  - adding new Docker container if requires to support additional processes
  - adjusting predefined Jenkins jobs

After successful testing new prerequisites can be proposed as a permanent
adjustment to production CD.

.. note::

    Any Python module that is distributed from Linux distro packages
    must be installed from RPM file. Python modules only available
    on PyPI_ should be added as PIP requirement.


Pre release testing
-------------------

It is also very important to test all the dependencies before release
to make sure sysadmin instructions are fully tested. The easiest way to
test is to use Devspace.


EXAMPLE
-------

This example shows how to test and upgrade OMERO dependencies.

1. Open a PR against omero-install (e.g. install Pillow from RPM
   https://github.com/ome/omero-install/pull/129).
2. Upgrade base docker image using
   (e.g. https://github.com/ome/devagent-docker/blob/master/Dockerfile#L19)
   and open a PR against `devagent-docker <https://github.com/ome/devagent-docker>`_.
   
   Run :jenkinsjob:`DOCKER-merge`.
   Latest merge image will be released to `Docker Hub <https://hub.docker.com/r/snoopycrimecop/devslave-c7-docker/builds/>`_.
   For more details about configuring automated builds on Docker Hub, see
   https://docs.docker.com/docker-hub/builds/.
3. Update devspace to use newly released container (e.g.
   https://github.com/ome/devspace/pull/63/files#diff-296e14ae0dc392c7edd9369908467953).
4. Commit and push your changes to github (e.g. https://github.com/ome/devspace/pull/63),
   set your branch in devspace ansible config and deploy.


If all tests are passing, above repositories should be tagged
and tag should be propagated accordingly.


.. note::

    We are working very hard to improve and simplify that process.

