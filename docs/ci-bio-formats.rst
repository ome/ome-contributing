Bio-Formats jobs
----------------

.. list-table::
    :header-rows: 1

    -   * Job task
        * Merge jobs

    -   * Merge the PRs and couple versions
        * :term:`BIOFORMATS-push`

    -   * Build the Bio-Formats artifacts
        * :term:`BIOFORMATS-build`

    -   * Build the Bio-Formats documentation
        * :term:`BIOFORMATS-linkcheck`


.. glossary::

    :mergecijob:`BIOFORMATS-push <BIOFORMATS-push>`

        This job merges all the PRs opened against the development branch of
        https://github.com/ome/bio-formats-build and couples the component
        versions

    :mergecijob:`BIOFORMATS-build <BIOFORMATS-build>`

        This job builds all the Bio-Formats artifacts using Maven and Ant

    :mergecijob:`BIOFORMATS-linkcheck <BIOFORMATS-linkcheck>`

        This job runs the linkchecker on the Bio-Formats documentation

    `Nightly repository test <https://bf-testing-results.s3.amazonaws.com/index.html>`_

        These tests are run nightly against a merge build of Bio-Formats.
        The current status is also reported in a
        `GitHub Action <https://github.com/ome/bioformats/actions/workflows/report.yml>`_.
        These tests independently produce a merge build, and are not dependent upon
        :mergecijob:`BIOFORMATS-push <BIOFORMATS-push>`.
