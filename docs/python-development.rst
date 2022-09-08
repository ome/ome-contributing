
Python development
==================

Many OME repositories use
 `bump2version <https://pypi.org/project/bump2version/>`_ to manage version numbers.
These can be identified by the presence of a `.bumpversion.cfg` file at the top of the
repository.


First fetch and checkout master or main branch::

    $ git fetch origin
    $ git checkout master
    $ git rebase origin/master

You will need to be able to sign commits with `gpg`. Test this with::

    $ echo "test" | gpg --clearsign

Compare the current version in `.bumpversion.cfg` with the last release version
to see if the current difference represents a patch release.
If any PRs are merged that would require the next release to be a ``major`` or ``minor`` version
(see `semver.org <https://semver.org/>`_) then that PR can include a version bump created via::

    $ bumpversion --no-tag minor|major

If this hasn't been performed prior to release and you wish to specify the next version
number directly when creating the release, this can be achieved with::

    $ bumpversion --new-version 5.9.0 release

If the version is already suitable, simply run::

    $ bumpversion release

This will remove the ``.dev0`` suffix from the current version, commit, and tag the release.

To switch back to a development version run::

    $ bumpversion --no-tag patch

NB: this assumes next release will be a ``patch`` (see below).
To complete the release, push the master branch and the release tag to origin::

    $ git push origin master v5.8.0

Publishing to Pypi
==================

Many of the OME Python repositories use GitHub actions to pubish to Pypi
when a new Tag is created and pushed to GitHub.
This is typically specified in a file such as `.github/workflows/publish_pypi.yml`.
