Development tools: maintenance
==============================

Most of the development tools used internally by the OME project are
Python-based and hosted on PyPI_. Their source
code is on GitHub.

Maintainer prerequisites
------------------------

To be able to maintain a Python development tool, a developer must:

- have a GitHub account and have push rights to the GitHub source code
  repository
- have a valid PGP key for signing the tags


Release process
---------------

The first operation to perform while releasing a project is to create a signed
tag locally::

   $ cd <project>
   $ git tag -s vx.y.z

The last command will create a tag with the default `v` prefix, i.e. `vx.y.z`.


Push the signed tag needs to the source code repository to trigger the upload to PyPI_ via GitHub action::

   $ git push origin vx.y.z

