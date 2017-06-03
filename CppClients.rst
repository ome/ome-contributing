.. contents::
   :depth: 2

###
C++
###


**To test in**: command line

**Purpose of the test** is to make sure the C++ clients functionality is working as expected.

Setup
=====

#. Download C++ build from:

   - (if available) Download page
     \http://downloads.openmicroscopy.org/ome-files-cpp/RELEASE_VERSION/artifacts/BUILD_NUMBER/

   - (if you are supposed to test tip of the branch) Jenkins job e.g.
     :jenkinsjob:`OME-FILES-CPP-DEV-merge`,
     :jenkinsjob:`OME-FILES-CPP-DEV-merge-superbuild`,
     :jenkinsjob:`OME-FILES-CPP-DEV-merge-win-superbuild`,
     :jenkinsjob:`OME-FILES-CPP-DEV-latest-superbuild` or
     :jenkinsjob:`OME-FILES-CPP-DEV-latest-win-superbuild`

#. Unpack the tar file (for example)::

    tar xfv ome-files-platform-bundle-VERSION-Release-PLATFORM-bBUILD.tar.xz

    tar xfv ome-files-standalone-bundle-VERSION-Debug-PLATFORM-bBUILD.tar.xz

#. Add the OME Files C++ :file:`bin` directory to your :envvar:`PATH`. For
   example, on Linux and OS X platforms::

     PATH="/path/to/ome-files-cpp/bin:$PATH"

   or on Windows, using the Command Prompt (note the quoting)::

     set "PATH=\path\to\ome-files-cpp\bin;%PATH%"

#. For platform builds **only**, you will need to have the C++ prerequisites
   installed on your system in order to do the testing - see the
   `OME Files documentation <https://www.openmicroscopy.org/site/support/ome-files-cpp/ome-cmake-superbuild/manual/html/prerequisites.html>`_ for more
   information.

Tests
=====

#. Run "ome-files" to test main wrapper:

   a. ``ome-files --version`` (should show version)
   b. ``ome-files --usage`` (should show basic usage summary)
   c. ``ome-files --help`` (should show ome-files(1) manual page, or HTML page on Windows)

#. Run "ome-files info" to test metadata display

   a. ``ome-files info --version`` (should show version)
   b. ``ome-files info --usage`` (should show basic usage summary)
   c. ``ome-files info --help`` (should show bf-info manual page, or HTML page on Windows)
   d. ``ome-files info /path/to/test-image.ome.tiff`` (should show core and original metadata)
   e. ``ome-files info --omexml /path/to/test-image.ome.tiff`` (should show and validate OME-XML metadata in addition)

#. Run the following script to test that all sample data can be read::

    (for pat in "*.tif" "*.tiff" "*.tf2" "*.tf8" "*.btf" "*.companion.ome"; do find /ome/data_repo/curated/ome-tiff/ome-schemas/ -name "$pat"; done) | while read f; do echo "TEST READ: $f"; if ome-files info "$f" ; then echo "**SUCCESS** $f" ; else echo "**FAIL**: $f" ; fi ; done

   Check that all files are successfully read.  No failures should be
   found; the exception is currently a single 2003-FC sample
   (:file:`2003-FC/single-channel.ome.tif`).

#. For platform builds **only**, run "ome-files view" to view pixel data

   a. Run ``ome-files view``; a window should appear.  [MacOS X: Press Cmd-Tab twice to get menus to display]

   b. Choose :menuselection:`File --> Open` (or Ctrl-O/Cmd-O) to open an OME-TIFF image; the image should be displayed.

   c. Test each of the Zoom, Pan and Rotate view options; click and drag to change each.

   d. Test the plane navigation using the navigation sliders; the number of dimension sliders visible will depend upon the number of dimensions in the image metadata.

   e. Test the rendering by changing the Min/Max sliders
