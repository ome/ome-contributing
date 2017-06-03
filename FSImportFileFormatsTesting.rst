FS Import File Formats Testing
===============================



``Test in``: Insight

``Purpose``: Check the import of various file formats and ability to report failures correctly. 

.. only:: html


     For FS demo, the formats highlighted as "must" should be imported - see here for further info:
     `FS testing table <https://docs.google.com/spreadsheet/ccc?key=0AoMHD4RIe-94dHJabm9UWVo0VzRqVnhBalk1eEJKZlE#gid=4>`_ 

.. only:: latex

**Compare the speed of the workflow on the same images on FS-demo build vs non-FS build (the most recent non-FS release).** 


#. Note any special cases for the file format. These will be in the spreadsheet.

#. Import the files for this format. 

   - Note that some formats have special import requirements--please check first!
   - |C| for any import failures, and take a copy of any exceptions
     (= import failure reasons in the "Failed" button window)
     or other failures [:ref:`FSImportFileFT002`, :ref:`FSImportFileFT003`, :ref:`FSImportFileFT004`].
   - |C| that all files have been copied in all cases, including import failure case.
   - |C| each imported image visually for the following features:
      - All images have thumbnails. Note that big images may take some time to generate thumbnails following import, showing clock placeholder [:ref:`FSImportFileFT005`].
      - All image planes are visible, and that the correct number of planes are in each dimension (check the metadata pane) [:ref:`FSImportFileFT006`] and are of the correct size.
      - All ROIs (if any) are present and in the correct place [:ref:`FSImportFileFT007`].






.. _FSImportFileFT002:
.. figure:: /images/testing_scenarios/ImportFileFormatsTesting/002pub.png
   :align: center

   FSImportFileFT002


.. _FSImportFileFT003:
.. figure:: /images/testing_scenarios/ImportFileFormatsTesting/003.png
   :align: center

   FSImportFileFT003


.. _FSImportFileFT004:
.. figure:: /images/testing_scenarios/ImportFileFormatsTesting/004.png
   :align: center

   FSImportFileFT004


.. _FSImportFileFT005:
.. figure:: /images/testing_scenarios/ImportFileFormatsTesting/005pub.png
   :align: center

   FSImportFileFT005


.. _FSImportFileFT006:
.. figure:: /images/testing_scenarios/ImportFileFormatsTesting/006.png
   :align: center

   FSImportFileFT006 


.. _FSImportFileFT007:
.. figure:: /images/testing_scenarios/ImportFileFormatsTesting/007.png
   :align: center

   FSImportFileFT007


