OMERO.downloader
================

Preparation
-----------

Downloader
^^^^^^^^^^

To minimize typing make a helpful alias like::

  $ cd omero-downloader/
  $ mvn package
  ...
  $ export SOURCE_DIR="`pwd`" TARGET_DIR="/tmp/repo" OME_DIR="/ome"
  $ rm -fr "$TARGET_DIR"
  $ mkdir "$TARGET_DIR"
  $ alias download="\"$SOURCE_DIR\"/download.sh -d \"$TARGET_DIR\" -s eel.openmicroscopy.org -u user-3 -w ome"
  $ cd

:envvar:`SOURCE_DIR` is where your sources for OMERO.downloader are and
:envvar:`TARGET_DIR` is to where it should download files. The following
test steps assume that something like that shell alias has been set.
:envvar:`OME_DIR` is where you have squig mounted locally. Adjust the
options in the alias definition according to how you log in to your
OMERO server.


Bio-Formats
^^^^^^^^^^^

This scenario assumes that the `Bio-Formats command-line tools
<https://downloads.openmicroscopy.org/latest/bio-formats/artifacts/bftools.zip>`_
are available locally.


XML formatter
^^^^^^^^^^^^^

It helps for some optional steps to have a reasonable OME-XML formatter
or editor. Here I shall assume that :command:`xmllint` is available: it
is easily installed as part of ``libxml2``. Feel free to substitute for
any other such tool.


OMERO.cli
^^^^^^^^^

For using the :command:`omero` executable you may find it convenient to
add its ``bin`` directory to your search :envvar:`PATH`. Alternatively,
from your OMERO directory you could set another alias::

  alias omero="`pwd`/bin/omero"

This scenario assumes that typing :command:`omero` without any prefix
suffices for your shell to locate the OMERO.cli Python executable.


Follow symbolic links
^^^^^^^^^^^^^^^^^^^^^

Some test steps use :command:`ls -l` for exploring symbolic links. You
may find :command:`realpath` helpful for checking to where a symbolic
link (symlink) ultimately links. This command is provided as part of GNU
coreutils. BSD users may prefer to use :command:`readlink` but the
analogous command-line option depends on the BSD variant. Mac users may
find it easiest to simply install coreutils, e.g., :command:`brew
install coreutils` then use :command:`grealpath`.


Working directory
^^^^^^^^^^^^^^^^^

With the environment variables and aliases set as above you can follow
this scenario from any convenient working directory. This flexibility
may be helpful as you investigate the outcome of any particular step of
the scenario.


File downloads
--------------

#. Get the ID of an image that has a companion file::

    omero login
    DV_IMAGE=$(omero import "$OME_DIR"/data_repo/test_images_good/dv/IAGFP-Noc01_R3D.dv)

#. Download the image's binary file::

    download -f binary $DV_IMAGE
    find "$TARGET_DIR" -name IAGFP-Noc01_R3D.dv -print

#. |C| that three files are listed: for fileset, image and repository.

#. |C| with :command:`ls -l` that the image file is a symlink to the
   fileset file.

#. |C| with :command:`ls -l` that the fileset file is a symlink to the
   repository file.

#. |C| that :command:`showinf -autoscale` on any of those files shows
   the image.

#. Download the image's log file::

    download -f companion $DV_IMAGE
    find "$TARGET_DIR" -name IAGFP-Noc01_R3D.dv\* -print

#. |C| that for the fileset and image directories, the binary file is in
   a ``Binary`` directory and the log file in a ``Companion`` directory.

#. |C| that within the repository directory both files are in the same
   directory.

#. |C| that :command:`showinf` on the repository's log file shows the
   image::

    showinf -autoscale `find "$TARGET_DIR"/Repository -name IAGFP-Noc01_R3D.dv.log -print`

#. Download both the binary and companion files for the image::

    download -f binary,companion $DV_IMAGE

#. |C| that two files are listed, both as "already downloaded"

#. Get the ID of an image whose file is large::

    omero login
    SCN_IMAGE=$(omero import "$OME_DIR"/data_repo/test_images_good/leica-scn/mihaela/UCLAD_0000000280_2011-02-10\ 13_32_55Z.scn)

   That import may take a few minutes so perhaps take a short break.

#. *Start* to download the file::

    download -f binary $SCN_IMAGE

#. Once the "commencing download of file" message is shown and its line
   of dots is growing then quit the downloader mid-download with
   control+C or similar.

#. Retry the download, |c| that the message is now "resuming download".
   Allow it to complete.

#. Retry the download, |c| that the message is now "already download".
   (If you used the above Leica file then you should have already seen
   this as its second image uses the same file.)

#. Find the file in the local repository::

    SCN_FILE=`find "$TARGET_DIR/"Repository -name UCLAD_0000000280_2011-02-10\ 13_32_55Z.scn -print`

#. Find the checksum of the file then delete it::

    cksum "$SCN_FILE"
    rm "$SCN_FILE"

#. Download the file again *without* interrupting it.

#. |c| that the file's checksum matches the previous.


File exports
------------

#. Import a big image, e.g.::

    omero login
    JPEG_IMAGE=$(omero import "$OME_DIR"/data_repo/test_images_good/jpeg/4kx4k.jpg)

#. In a graphical client wait for the image's thumbnail to become available.

#. Annotate the image a little: add a tag, a comment, a ROI, etc. Note
   the IDs of what you add.

#. Annotate one of the ROIs, e.g.::

    omero obj new RoiAnnotationLink parent=Roi:1234 child=TagAnnotation:567

   to add tag ID 567 to ROI ID 1234.

#. *Start* to export the image::

    download -f tiff $JPEG_IMAGE

#. Once the "commencing download of pixels" message is shown and its
   line of dots is growing then quit the downloader mid-download with
   control+C or similar.

#. Restart the download, |c| that the message is now "resuming
   download". Allow it to complete.

#. Change to the export directory for that image then see what it has::

    cd "$TARGET_DIR"/`echo $JPEG_IMAGE | tr : /`/Export/
    ls

#. |c| that :command:`tiffcomment` does not have much to report about the export::

    tiffcomment 4kx4k.jpg.tiff

#. |c| that :file:`4kx4k.jpg.tiff` is viewable with its smooth intensity
   gradient::

    showinf 4kx4k.jpg.tiff

#. Now export the *OME-*\ TIFF version of the image::

    download -f ome-tiff $JPEG_IMAGE

#. |c| that :command:`tiffcomment` has rather more to say about that export::

    tiffcomment 4kx4k.jpg.ome.tiff

#. |c| that :file:`4kx4k.jpg.ome.tiff` has the same pixel data as
   :file:`4kx4k.jpg.tiff`::

    showinf 4kx4k.jpg.ome.tiff

#. |c| that :file:`4kx4k.jpg.ome.tiff` has valid OME-XML::

    xmlvalid 4kx4k.jpg.ome.tiff

#. |c| the XML output from :command:`tiffcomment` above::

    tiffcomment 4kx4k.jpg.ome.tiff | xmllint -format -

   #. |c| that at the top level is an ``OME`` element.

   #. |c| that the ``Pixels`` element contains ``TiffData`` elements.

   #. |c| that the image has annotation and ROI reference elements.

   #. |c| that the ROI has an annotation reference element.

   #. |c| that the referenced elements are present.


Fetching metadata
-----------------

Here we reuse the :envvar:`JPEG_IMAGE` for testing exports. If you are
not also testing exports then just run the first few import and
annotation steps of `File exports`_ until the first download. If you
prefer then you can use :file:`2kx2k.jpg` instead of the larger.

#. Download XML fragments for your image's model objects::

    download -f ome-xml-parts $JPEG_IMAGE

#. Change to the metadata directory for that image then see what it has::

    cd "$TARGET_DIR"/`echo $JPEG_IMAGE | tr : /`/Metadata/
    ls

#. |c| that the export directory has no XML files in it yet::

    ls ../Export/

#. |c| the XML fragment for the image::

    xmllint -format `echo $JPEG_IMAGE | tr I: i-`.ome.xml

   #. |c| that at the top level is an ``Image`` element.

   #. |c| that the ``Pixels`` element contains a ``MetadataOnly``
      element.

   #. |c| that the image has no annotation or ROI reference elements.

#. |c| the related XML fragments::

    ls ../*/*/Metadata/*

#. |c| that these annotations and ROIs are the ones you expected.
   :command:`xmllint -format ...` can be used to inspect each.

   #. |c| that their top-level element is ``ROI`` or some kind of
      annotation.

   #. |c| that their XML contains no reference elements.

   #. |c| the same for the annotation that you put on the ROI::

       ls ../Roi/*/Annotation/*/Metadata/*

#. Assemble the XML fragments into one whole::

    download -f ome-xml-whole $JPEG_IMAGE

#. |c| that nothing mentioned writing anything as XML

#. |c| that the export directory now has an XML file in it::

    ls ../Export/

#. |c| the contents of the XML file::

    xmllint -format ../Export/`echo $JPEG_IMAGE | tr I: i-`.ome.xml

   #. |c| that at the top level is an ``OME`` element.

   #. |c| that the ``Pixels`` element contains a ``MetadataOnly``
      element.

   #. |c| that the image has annotation and ROI reference elements.

   #. |c| that the ROI has an annotation reference element.

   #. |c| that the referenced elements are present.

#. Delete all the downloaded XML::

    find "$TARGET_DIR" -name \*.xml -print -exec rm {} +

   You may wish to first omit everything after the ``-print`` to check
   what would be deleted.

#. Run the combined parts-and-whole metadata export::

    download -f ome-xml $JPEG_IMAGE

   For the ``-f`` option ``ome-xml`` is simply shorthand for
   ``ome-xml-parts,ome-xml-whole``, options you used above.

#. |c| that the XML fragments are again just as before after running the
   ``ome-xml-parts`` download.

#. |c| that the assembled OME-XML document is again just as before after
   running the ``ome-xml-whole`` download.

#. Optionally, try deleting some subset of XML files and repeating the
   export to ensure that the download messages are as you would expect,
   e.g.::

    writing annotations as XML, need 3, already have 2... done


Whole fileset
-------------

#. Remove any existing export directories::

    rm -fr "$TARGET_DIR"/Image/*/Export

#. Import a plate::

    omero login
    INCELL_PLATE=$(omero import "$OME_DIR"/data_repo/test_images_good/incell/Single\ plane\ no\ flatfield\ corr/)

#. Download its binary files::

    download -f binary $INCELL_PLATE

#. |c| that file download failures are reported. A server with
   default configuration does not allow download of plate files.

#. Export one of the images listed for, "determining files used by
   image"::

    download -f ome-tiff,ome-xml Image:1234

#. |c| that the OME-TIFF and OME-XML files were exported::

    cd "$TARGET_DIR"/Image/*/Export/
    ls

#. |c| that the OME-TIFF and OME-XML files look reasonable::

    showinf -autoscale 2007.10.17.17.04.55.xdce*.ome.tiff
    xmllint -format image-*.ome.xml

#. |c| that downloads can be expanded to whole filesets, using the same
   image ID as above::

    download -f ome-xml -a Image:1234

#. |c| that you see many "assembling metadata for image" messages.

#. |c| that you see an "already assembled metadata for image" message
   for the image that you chose above.

#. |c| that referencing the plate directly works the same as ``-a``::

    download -f ome-xml $INCELL_PLATE

#. |c| that you see many "already assembled metadata for image"
   messages.


Limit symbolic links
--------------------

#. Delete the contents of your download directory::

    rm -fr "$TARGET_DIR"
    mkdir "$TARGET_DIR"

#. Import a simple image::

    omero login
    PNM_IMAGE=$(omero import "$OME_DIR"/data_repo/test_images_good/pgm/pigfoot.pgm)

#. Download its binary files::

    download -f binary $PNM_IMAGE

#. |c| that a link exists from the fileset to the image::

    ls -l "$TARGET_DIR"/Fileset/*/Image/

#. |c| that a link exists from the image to the fileset::

    ls -l "$TARGET_DIR"/Image/*/Binary/

#. |c| that a link exists from the fileset to the local repository::

    ls -l "$TARGET_DIR"/Fileset/*/Binary/

#. |c| that the links reach the target file::

    showinf "$TARGET_DIR"/Fileset/*/Image/*/Binary/pigfoot.pgm

#. Delete the contents of your download directory::

    rm -fr "$TARGET_DIR"
    mkdir "$TARGET_DIR"

#. Download its binary files making no links::

    download -f binary -l none $PNM_IMAGE

#. Verify that only the repository file exists::

    find "$TARGET_DIR" -not -type d -print

#. |c| that the repository file is as expected::

    showinf `find "$TARGET_DIR" -type f -print`

#. Download its binary files again without limiting links::

    download -f binary $PNM_IMAGE

#. |c| that an "already downloaded file" message is shown.

#. |c| that the links are now created::

    find "$TARGET_DIR" -type l -print

#. |c| that the links reach the target file::

    showinf "$TARGET_DIR"/Fileset/*/Image/*/Binary/pigfoot.pgm


Limit metadata
--------------

Here we reuse the :envvar:`JPEG_IMAGE` for testing exports. If you are
not also testing exports then just run the first few import and
annotation steps of `File exports`_ until the first download. If you
prefer then you can use :file:`2kx2k.jpg` instead of the larger.

#. Delete all the downloaded XML::

    find "$TARGET_DIR" -name \*.xml -print -exec rm {} +

   You may wish to first omit everything after the ``-print`` to check
   what would be deleted.

#. Run the normal XML fragment download::

    download -f ome-xml-parts $JPEG_IMAGE

#. |c| that images, ROIs and annotations were downloaded::

    find "$TARGET_DIR" -name \*.xml -print

#. Assemble the XML document for that image, both with and without pixel
   data::

    download -f ome-tiff,ome-xml $JPEG_IMAGE

#. Change to the export directory for that image::

    cd "$TARGET_DIR"/`echo $JPEG_IMAGE | tr : /`/Export/

#. |c| that the XML includes images, ROIs and annotations::

    tiffcomment 4kx4k.jpg.ome.tiff | xmllint -format -
    xmllint -format `echo $JPEG_IMAGE | tr I: i-`.ome.xml

#. Delete the exported files::

    rm -f *.ome.tiff *.ome.xml

   This step is important because any change in the ``-x`` option will
   not overwrite previous exports.

#. Repeat the above steps using fewer kinds of model object for the
   ``-x`` option in the :command:`download`:

   * ``-x image,roi``
   * ``-x image,annotation``
   * ``-x image``

   #. |c| that ROIs and annotations are omitted from the XML accordingly.

   #. |c| that omission from assembled XML is regardless of if extra XML
      fragments were downloaded in a previous ``ome-xml-parts`` step.

#. Repeat the above step using even fewer kinds of model object for the
   ``-x`` option in the :command:`download`:

   * ``-x roi,annotation``
   * ``-x roi``

   Note that the exported file for :command:`xmllint` will be found among::

    ls "$TARGET_DIR"/`echo $JPEG_IMAGE | tr : /`/Roi/*/Export/roi-*.ome.xml

#. Do one more repetition for ``-x annotation``.

   Note that the exported files for :command:`xmllint` will be found among::

    ls "$TARGET_DIR"/`echo $JPEG_IMAGE | tr : /`/Annotation/*/Export/annotation-*.ome.xml
    ls "$TARGET_DIR"/`echo $JPEG_IMAGE | tr : /`/Roi/*/Annotation/*/Export/annotation-*.ome.xml

   according to how you annotated the image and ROI.


Session login
-------------

The above suggested "download" shell alias uses the ``-u``, ``-w``
options to supply a username and password. A session key should suffice:

#. Obtain an OMERO session key::

    omero login
    KEY=`omero sessions key`

#. Import a simple image::

    DICOM_IMAGE=$(omero import "$OME_DIR"/data_repo/test_images_good/dicom/ankle.dcm)

#. Download the image file using the session key::

    "$SOURCE_DIR"/download.sh -d "$TARGET_DIR" -s eel.openmicroscopy.org -k $KEY -f binary $DICOM_IMAGE

   As when you set the "download" shell alias adjust the server name for
   your OMERO server.

#. |c| that the downloaded file looks as expected::

    showinf "$TARGET_DIR"/`echo $DICOM_IMAGE | tr : /`/Binary/ankle.dcm


Other groups
------------

The above tests pay no mind to which images are in which groups:
probably everything was done as the current user in their default group.
OMERO.downloader should be able fetch from outside the current group.
For example, try adding a ``-g <group-name>`` option to the ``login`` in
some of the above workflows. One could even adjust the ``-u`` and ``-w``
options in the "download" shell alias, and adjust the options given to
:command:`omero login`, to have an administrator try to download data
that a normal user has in a private group. Try a couple of different
types of download with the various ``-f`` options from the workflows to
|c| that any kind of data can be fetched from any group that the
download user can read.
