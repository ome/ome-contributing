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
