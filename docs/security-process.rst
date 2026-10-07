Security process
================

This document describes the OME security process and covers the steps from the
reception of a vulnerability report up to the security release of a component.
The development process makes extensive use of GitHub functionalities for
managing vulnerability reports and fixes - see
https://docs.github.com/en/code-security/how-tos/report-and-fix-vulnerabilities
for more details.

Triage security reports
^^^^^^^^^^^^^^^^^^^^^^^

Vulnerabilities can be reported by the community via the security mailing list
as described in the `security page <https://www.openmicroscopy.org/security/>`_
of the OME website.

An email received through the security mailing list should be acknowledged
within 1 working day of its reception. First, the report should be reviewed
by the relevant project maintainers to validate whether it qualifies as
a security issue. The email thread can be used to gather additional information
from the reporter as necessary.

Once a decision on the nature of the report has been made, it should be
communicated to the reporter alongside a mitigation timeline, if applicable.

Create a draft advisory
^^^^^^^^^^^^^^^^^^^^^^^

Once a vulnerability has been identified, either internally or from an external
report, an administrator should draft a security advisory against the appropriate
GitHub repository e.g. https://github.com/ome/omero-web/security/advisories.
This advisory can be used for all private discussions about the issue. Comments on
an advisory are not published and remain available to the project maintainers.

Fix a reported vulnerability
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To work securely on the development of a security fix, a temporary private fork
of the repository should be created from the draft advisory as described in
https://docs.github.com/en/code-security/tutorials/fix-reported-vulnerabilities/collaborate-in-a-fork/.

Collaborators can be added to and removed from the private fork as described in
https://docs.github.com/en/code-security/how-tos/report-and-fix-vulnerabilities/fix-reported-vulnerabilities/add-collaborators
and https://docs.github.com/en/code-security/how-tos/report-and-fix-vulnerabilities/fix-reported-vulnerabilities/remove-collaborators.

The development and review process should proceed as usual using pull requests
against the private fork. Importantly, PRs must not be merged until the
component is ready to release.

Schedule and pre-announce the security release
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Once a solution has been identified, a timeline for a security release of the
component should be decided by the maintainers. For OMERO security releases,
sufficient notice should be given to system administrators to plan and schedule
downtime for the upgrade.

The security release should be pre-announced via a post on the `image.sc`_
forum under the `Announcements <https://forum.image.sc/c/announcements/10>`_
category including at least the `ome` and `security` tags. The main page of the
OME website should be updated with a banner announcement linking to the
`image.sc`_ post.

Prepare the advisory
^^^^^^^^^^^^^^^^^^^^

Prior to its publication, the content of the advisory should be updated with
the following information:

- the package, affected versions and patched versions
- a description including Background, Impact, Workaround and Resolution
- an assessment of the severity using CVSS v3 base metrics
- a CVE, if an identifier has already been assigned as part of the vulnerability report,
  it should be re-used, otherwise, a CVE should be requested from the GitHub advisory
- credits to the reporter if applicable

Publish the advisory
^^^^^^^^^^^^^^^^^^^^

On release day, all open Pull Requests against the temporary fork should be merged
in the security advisory - see https://docs.github.com/en/code-security/tutorials/fix-reported-vulnerabilities/collaborate-in-a-fork#merging-changes-in-a-security-advisory
Once merged, all changes will be visible on the public repository.

The release process can then follow the standard procedures with the following variations:

- the GitHub advisory should be published as described in
  https://docs.github.com/en/code-security/how-tos/report-and-fix-vulnerabilities/fix-reported-vulnerabilities/publish-repository-advisory.
- in addition to the release announcement, the GitHub advisory should be duplicated to the
  `list of advisories <https://www.openmicroscopy.org/security/advisories/>`_ on the OME website.
