Third Party Contribution and Interaction Policy
===============================================

Introduction
------------

OME defines third party contributors as anyone
who is currently neither a member of the OME teams as defined in https://www.openmicroscopy.org/teams/
nor a member of the Glencoe Software team as defined in https://www.glencoesoftware.com/about/team/.

In 2016, OME published its first statement on
`supporting file formats in Bio-Formats <https://www.openmicroscopy.org/2016/01/06/format-support.html>`__.
This was refined further with `a follow up <https://www.openmicroscopy.org/2019/06/25/formats.html>`__
in 2019. OME’s position remains largely unchanged but with the very
welcome increased interest in third party contributions as well as an increased
number of third party interactions, in particular from instrumentation vendors,
over the last few years we felt it appropriate to refine and expand upon these
with an official policy. This policy is designed to clarify what you as a third
party can expect from OME and what OME expects of you and any organization you
are representing during interactions with OME.

Communication
-------------

OME has two main methods of primary communication:

- public community support, best effort,
- private commercial relationship, SLA, and contractual terms.

The wider community, OME’s academically funded staff, and Glencoe Software
participate primarily in the first of these methods using the
`Scientific Community Image Forum <https://forum.image.sc/>`_ discussion forum for scientific
image software sponsored by the
`Center for Open Bioimage Analysis (COBA) <https://openbioimageanalysis.org/>`_
and through OME’s GitHub repositories. OME’s academically funded staff
endeavours to at least reply to new threads within 24 hours. Here the
communication expectations follow time honoured BBS and public internet forum
etiquette of “no support via private message unless invited”.

The rationale for this is simple:

1. the entire community benefits when a discussion surrounding a problem
   and potential solution can be seen and contributed to by the entire community 
2. a community member giving up their time and demonstrating their expertise
   without expectation of compensation is not obligated to support you privately.

Glencoe Software participates in the second of these methods via contract work
and the Software Maintenance Agreements it has with its licensees of Bio-Formats
and OMERO. One of the expressed purposes of its existence is to provide private
support guided by contractual terms and conditions.

Receipt of Sample Data
----------------------

OME regularly receives, solicited and unsolicited, sample data primarily when
discussing and attempting to address file format problems issues in Bio-Formats.
It is the expectation when providing sample data to OME’s academically funded
staff that the data may be made public unless otherwise stated under a liberal
license, at least
`Creative Commons Attribution 4.0 International License <https://creativecommons.org/licenses/by/4.0/>`_.
The recommended way to submit public sample data is to use the
`Bio-Formats Zenodo community <https://zenodo.org/communities/bio-formats>`_.

Providing data that cannot be made public is strongly discouraged. Doing so may
dramatically delay addressing an issue as the team has to assess the benefit of
doing so against the future maintenance burden to third party contributors who
will not have access to such data.

Glencoe Software accepts sample data that must remain private and confidential
under the terms of its contract work and Software Maintenance Agreements. For
new file format work undertaken on the behalf of instrumentation vendors,
Glencoe Software always insists that any test data used to validate its work
can be made publicly available via OME.

Usage of Sample Data
--------------------

OME maintains a curated QA repository with all data received from the
community. The public subset of this repository is made available from
the `OME downloads page <https://downloads.openmicroscopy.org/images/>`__.
Daily tests are run against this data repository, as described in :doc:`ci-bio-formats`.

Historical data that was received either without an explicit license allowing it to be
published or with explicit instructions to remain private cannot be shared with the community.
Third party contributors in particular do not have access to any test data beyond what is
on the public download page.

Data owners may make private data public by resubmitting an appropriately-licensed version using the
`Bio-Formats Zenodo community <https://zenodo.org/communities/bio-formats>`_.

Third Party Contributions
-------------------------

OME encourages third party contributions including from instrumentation vendors
who are the subject matter experts on their respective proprietary file formats.
It expects these contributions to come in one of these forms:

- public contributions of expertise or support without expectation of remuneration
  on the `Scientific Community Image Forum <https://forum.image.sc/>`_ and through OME’s GitHub
  repositories.
- appropriately licensed :doc:`code contributions <code-contributions>` to OME’s
  GitHub repositories made via Pull Request in the primary programming language
  of that repository.
  OME is under no obligation to accept such contributions. Private, funded
  projects undertaken with Glencoe Software on behalf of the third party with
  the expectation that code will be contributed under
  `appropriate license <https://www.openmicroscopy.org/licensing/>`_ to OME’s
  GitHub repositories.

All individual code contributors are expected to fill and return the
:doc:`OME Contributor License Agreement <cla>`. The agreement is between OME,
represented by the University of Dundee, and the copyright owner or the legal
entity authorized by the copyright owner and is valid for all contributions
across all OME repositories.

Proprietary Native Code Blobs
-----------------------------

OME can not tolerate any contributions that rely upon proprietary native code
blobs such as dynamic or statically linked libraries, and SDKs. The maintenance
and support responsibility for any such native code blob remains entirely with
the contributor. OME will direct support issues it receives to the contributor
publicly and any current or future compatibility testing with the native code
blob with OME software is performed on a best effort basis.
