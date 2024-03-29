Development of the OME Data Model
=================================

.. warning:: This page is being restructured following the decoupling of the
    data model from the Bio-Formats code repository. An updated version will
    be published shortly.

Introduction
------------

This is a document describing a way to work and publish the OME model schema
on the OME website, based on observations of the 2016-06 release being
performed; that release version is used in the examples below. Throughout the
process it is important to not just copy and paste, but to understand what is
actually being done and why. The text below is not quite yet a step-by-step
guide, more a set of explanations that should make the necessary steps clear. 
Many of the command-line scripts below assume that you start at the top level
of your Bio-Formats repository, and they include some :file:`/path/to`
directories for you to adjust as appropriate.

Schema development
------------------

.. _clean_bf_repo:

Clean the repository
^^^^^^^^^^^^^^^^^^^^

In working with the Bio-Formats git repository, first clean the
unnecessary files away so that they cause no confusing clutter that
wastes your time. From the top-level :file:`bioformats` folder, while
:command:`ant clean` and :command:`mvn clean` are both fine approaches,
the most thorough is :command:`git clean -dfx`.


Major or minor release?
^^^^^^^^^^^^^^^^^^^^^^^

A minor release of the OME model schema may suffice for changes like
adding new legal values to an existing enumeration. A release *must*
be major if,

* some documents that validate under the current release will not
  validate under the new one (a major "data-level" change)

* some terms in the schema have changed meaning and may thus be acted on
  differently (a major "information-level" change)

A major release requires changing the schema's namespace. For a minor
release it suffices to increment the value of the `version` attribute of
the `xsd:schema` element, leaving the namespace unchanged.

.. seealso::

  :bf_pr:`PR #1999 <1999>` (major schema change), :bf_pr:`PR #2553
  <2553>` (minor schema change)


Create the new schema directory
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. note::

  This subsection is for major releases only. A minor release can reuse
  the schema directory for the current release, so skip over this part.

For the schema release process a high fraction of the necessary work
occurs in Bio-Formats' `components/specification` directory.
Inside there, `components/specification/released-schema` contains a subdirectory for
each schema, even before its actual release.

To preserve the version history, the creation of the new schema
directory is performed across a pair of commits. First, the latest patch
gets its new name, for example::

  cd components/specification/released-schema
  mkdir 2015-01
  git mv 2013-10-dev-5/catalog.xml 2015-01
  git mv 2013-10-dev-5/*.xsd 2015-01
  
then, for the subsequent commit, remember to do::

  git checkout HEAD^ 2013-10-dev-5/catalog.xml
  git checkout HEAD^ 2013-10-dev-5/*.xsd
  git add 2013-10-dev-5/*

to restore the released files from the latest patch. In this way, the
files of the actually released schema retain their version history.

For an even later commit one may consider::

  git rm -r 2013-10-dev-?

which removes the patch versions if no longer desired.

.. note::

  It may make sense to adjust the above :command:`git mv` commands to
  move fewer files to the release directory. For instance,
  :file:`OMERO.xsd` is not used by the OME schema so need not be
  released alongside it in the :file:`2015-01` directory if has not been
  changed since the previous release.


Catalog files
^^^^^^^^^^^^^

The released schema directories have catalog files that list their
contents. For instance::

  cd components/specification/released-schema
  find . -name catalog.xml

Within each commit, each catalog file should be kept up to date with
changes made in that same directory, such that the catalogs always list
exactly the available schema definitions.


XML transforms
^^^^^^^^^^^^^^

The changes made to the released schemas should be accompanied by
changes to the XML transforms in
`components/specification/transforms`. For major releases use
:command:`git mv` in renaming the upgrade and downgrade for the latest
patch. Remember to restore the originals in a later commit, as above
when restoring the schema definition files for the latest patch.

For minor releases it suffices to adjust the existing upgrade and
downgrade transforms for the current release. Remember that users may be
downgrading from an earlier minor version than this newest version.

The transforms' analog of the catalog files is
`components/specification/transforms/ome-transforms.xml` which should
describe the transforms in its directory for that commit.


Search and replace
^^^^^^^^^^^^^^^^^^

.. note::

  This subsection is for major releases only. A minor release reuses the
  current release and patch versions, so skip over this part.

There are various references to the latest patch version and even the
latest release version to be updated; the whole Bio-Formats repository
requires checking.

In replacing the "2013-10-dev-5" schema references within the actual
schema definition files in the new :file:`released-schema/2015-01`
directory, also update the copyright date in their headers, and the date
in :file:`ome.xsd`'s first `xsd:documentation` tag. Likewise, with the
XML transforms, update the copyright date in their headers, and in the
attributes appearing near the start of
`components/specification/transforms/ome-transforms.xml`.

Other files in which to fix the schema version include:

* `components/autogen/build.properties`
  and `ant/xsd-fu.xml` for code generation
* the Project Object Model, Maven's `pom.xml`
* the `components/specification/publish`
  because of the HTML within
* checks in the Bio-Formats code for the latest schema version,
  including various Java classes (`version.equals`, `SCHEMA_LOCATION`,
  etc.)

Avoid changing:

* sample files in `components/specification/samples`
* old schema releases


Testing
^^^^^^^

Once the above changes have been made and committed, it is time to test.
This requires having various prerequisites installed for Bio-Formats
development, including for the `C++ implementation
<https://downloads.openmicroscopy.org/latest/ome-files-cpp/>`_.
Before each test, :ref:`clean the repository <clean_bf_repo>`::

  git clean -dfx
  ant test
  git clean -dfx
  mvn test
  git clean -dfx
  TMPDIR=/tmp/bf-build-`date +%s`
  mkdir $TMPDIR
  pushd $TMPDIR
  cmake `dirs +1`
  make
  ctest -V
  popd

You may care to give :command:`make` an additional ``-j`` option
specifying the number of cores to use in parallelizing the build. Note
that the :command:`ctest` step can take a long time.

Sample files
------------

OME-XML sample files
^^^^^^^^^^^^^^^^^^^^

Once the schemas and transforms are moved and named to fit the release
version, then the sample files can be upgraded. A new copy of the sample
files is created in a new directory, updated to the new schema using
:command:`xsltproc` with the new transform, then pretty-printed with
:command:`xmllint` or similar. A sufficient command-line approach is::

  cd components/specification/samples
  for SRC in `find 2015-01 -type f -name '*.ome' -o -name '*.xml'`
  do DEST=`echo $SRC | sed -e 's/^2015-01/2016-06/‘`
     mkdir -p `dirname $DEST`
     <$SRC xsltproc ../transforms/2015-01-to-2016-06.xsl - | xmllint --format - >$DEST
  done

The OME-TIFF files require special handling, as they do not have an
automatic update tool. First, identify them and copy them to the new
directory::

  find 2015-01 -name '*.ome.tiff'
  cp 2015-01/set-1-meta-companion/*.ome.tiff 2016-06/set-1-meta-companion/

Next, each OME-TIFF file must be edited to have the schema version
changed to that of the new release. They are binary files so choice of
editor is important; the other non-text data must be preserved. One of
several suitable options is Emacs' `Hexl mode
<https://www.gnu.org/software/emacs/manual/html_node/emacs/Editing-Binary-Files.html>`_.

OME-TIFF sample files
^^^^^^^^^^^^^^^^^^^^^

Sample files for each schema release version are available under
https://downloads.openmicroscopy.org/images/OME-TIFF/. The sample files in the
previous release's directory, and the multi-file samples in its
:file:`tubhiswt-*` directories, are upgraded to the new schema using
:command:`bfconvert` from the updated Bio-Formats repository: in that
repository use :command:`ant tools` to generate the necessary
:file:`bioformats_package.jar` Java archive file. The sample files from
the subdirectories are provided also as compressed "zip" archive files.
The files in the :file:`bioformats-artificial` subdirectory are
generated by other Bio-Formats classes. Putting these facts together,
setting up the new "2016-06” samples folder is easily achieved::

  mkdir 2016-06
  mkdir 2016-06/binaryonly
  mkdir 2016-06/companion
  mkdir 2016-06/modulo
  cd 2015-01
  for i in *.ome.tif*
  do /path/to/bioformats/tools/bfconvert $i ../2016-06/$i
  done
  cd binaryonly
  for i in *.ome.tif*
  do /path/to/bioformats/tools/bfconvert $i ../../2016-06/binaryonly/$i
  done
  cd ../companion
  for i in *.ome.tif*
  do /path/to/bioformats/tools/bfconvert $i ../../2016-06/companion/$i
  done
  cd ../modulo
  for i in *.ome.tif*
  do /path/to/bioformats/tools/bfconvert $i ../../2016-06/modulo/$i
  done
  for i in tubhiswt-?D
  do mkdir ../2016-06/$i
     FROM=`ls $i | head -n 1`
     TO=`echo $FROM | sed -e 's/_C0/_C%c/ ; s/_TP0/_TP%t/'`
     /path/to/bioformats/tools/bfconvert $i/$FROM ../2016-06/$i/$TO
  done
  cd ../2016-06
  for i in tubhiswt-?D ; do zip $i.zip $i/* ; done
  mkdir bioformats-artificial
  cd bioformats-artificial
  BF_PROG=loci.formats.tools.MakeTestOmeTiff /path/to/bioformats/tools/bf.sh
  for i in *.ome.tif ; do zip $i.zip $i ; done

Review the new sample files to ensure that they look correct. At the end
of the next step they are published online.

Binary Only and companion files:
The OMETiffWriter does not support the writing of sample BinaryOnly or Companion files.
If the only required update is to change the schema version then the files may be edited with a Hex Editor.
Any additional editing may change the length of the file and invalidate the tiff header.

In instances where more detailed changes are required to BinaryOnly samples:

* Write a short program using OMETiffReader and Writer to read and write the existing sample
* Using debugging tools, inject the desired OME XML prior to saveComment in OMETiffWriter close function
* Ensure when modifying the XML that the UUID values are correct
* Verify that files pass using xmlvalid and tiffinfo commands

Schema publication
------------------

.. _oXygen: https://www.oxygenxml.com/

Schema release
^^^^^^^^^^^^^^

Once a specification change has been made into an `ome-model` release, the 
`publish` script in the https://github.com/ome/schemas repository automatically generates new schemas pages published at https://www.openmicroscopy.org/Schemas/.

Generated documentation
^^^^^^^^^^^^^^^^^^^^^^^

Documentation for the released schema must be generated from the 
:file:`ome.xsd` definition file. The XML editor oXygen_ is recommended for
this task, and requires the schema definitions to have been published online
as described above. To build the generated documentation for a given release::

  /Applications/oxygen/schemaDocumentationMac.sh https://www.openmicroscopy.org/Schemas/OME/$RELEASE/ome.xsd -cfg:components/specification/omeOxygenDocConfig.xml

Check that the documentation generated in the new :file:`output`
directory all looks correct.

The :jenkinsjob:`SCHEMA-documentation` job will generate the oXygen_ 
documentation for a given version of the schema. Once generated, this documentation can be transferred to a :file:`$RELEASE` subfolder of
:file:`/var/www/html/www.openmicroscopy.org/specification/schema_doc` on `web-prod`. 
