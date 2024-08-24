Mapr (web extension for IDR)
============================



**To test in**: Web

**Purpose of the test** is to check the so called Mapr, this means the additional metadata
navigation tabs, metadata display and tree autocomplete search extending the OMERO.web UI.

**Section 1: UI layout testing and queries**

Note: **Replace the ``idr-demo-test-server``** with the server address from the testing sheet in all the urls below !!

#. |C| that the multiple words of Key-Value pair tables do not occur. For example Compound should not be split into Compound Name and Compound Name Url, see [:ref:`compound_not_expected`] for a negative example. Instead, the url should be indicated by a clickable icon in the Compound Name row, see [:ref:`compound_expected`] for an expected layout example. Also other rows like Compound Source and Compound Group should be missing, just as indicated in the expected layout example. Analogically check the layout of Gene, Organism and other mapr objects.

#. Gene should be divided into Gene and Supplementary. 
   
   - go to ``Studies`` tab and open a study
   - navigate in the tree down to wells
   - select a well in central pane
   - expand the "Attributes" harmonica in right-hand pane
   - |C| that there are two MapAnnotations for ``Gene`` topic, ``Gene`` and ``Gene Supplementary``, see [:ref:`gene_supplementary`]

#. Check pagination in central pane 

   - click onto the "Organism" tab and type "h" in the filter box above the left-hand tree
   - |C| that spinning wheel is present (It can happen though that the dropdown menu shows immediately, with no spinning wheel appearing.)
   - wait, this can take a few seconds before the dropdown menu appears
   - find and click "Homo sapiens" in the dropdown menu
   - wait till the UI refreshes
   - expand any, but not the first Screen
   - expand any, but not the first Plate in the Screen
   - wait till central pane is populated with images thumbnails
   - click onto Next in the centre of the central panel to load the second page
   - being with the cursor on the left-hand pane tree, use the down arrow key on keyboard to switch between screens and plates and |C| that the central pane and right-hand pane update correspondingly
   - try also multiselections in central pane and left-hand tree
   - |C| that the selections and multi-selections in central and left-hand panes select the corresponding objects in left-hand tree and central pane. Also keep checking the right-hand pane loading and synchronicity with your actions in the left/central panes. Concentrate especially to the region of the end of the first page and beginning of the second page.

#. Check type across multiple studies

   - Use both of the two following methods to find a Gene:

     - go to Genes tab and filter and choose a gene 
     - navigate to a plate (not first plate or first screen) and well (not first well) and click into the Gene symbol in right-hand pane

   - once you select the Gene you should see something similar to this example [:ref:`tree_numbers`]
   - |C| that gene is loaded in right hand panel (appropriate MapAnnotation(s) will appear)
   - |C| that the first number in the Gene name in the tree signifies the number of images (23 in the example screenshot [:ref:`tree_numbers`]), the second number is the number of screens/projects which contain images with this gene (4 in the example screenshot [:ref:`tree_numbers`]).
   - |C| that there are no two MapAnnotations containing exactly the samee values in right-hand pane. 
   - |C| that all the displayed MapAnnotations in the right-hand pane are unique, by hovering over them and checking their ID in the tooltip.
   - Repeat search for different genes and checks of the numbers in the tree and the MapAnnotations in RHP as indicated, until you have found and checked three cases

     - Gene with Screens only
     - Gene with Projects only
     - Gene with both Screens and Projects
  
   - Repeat the "Check type accross multiple studies" steps for types: Phenotype, siRNA, Compound, Organism instead of Gene

#. Check query.

   - in your browser line, go to ``idr-demo-test-server/mapr/phenotype/?value=elongated%20cells&query=true``
   - |C| that you have more results with the &query=true ending of the url than without it
   - |C| that the query retrieves all the values which contain "elongated cells" string
   - get other values from Phenotypes tab

     - type an alphabetical character into the filter line
     - read the values in the dropdown menu
     - edit the url with these new values

   - |C| that when you use another phenotype values in the url the query delivers corresponding results.

#. Pagination on query. Checking the pagination of the left-hand panel.

   - note that it is fairly unprobable that you will find a paginated left-hand panel just by randomly browsing through the screens/plates, use the example below or adjust this example
   - in your browser line go to ``idr-demo-test-server/mapr/gene/?value=ab&query=true``
   - |C| that the top node in the tree ("Gene") is selected as shown in [:ref:`pagination_left-hand_tree`]
   - click onto Next in the centre of the central panel to load the second page
   - click onto "2" in the centre of the central panel to load the second page
   - |C| that the elements of the lef-hand side tree in the second page work as expected (tree expands, thumbs appear in central and right-hand pane gets populated as expected.)

#. |C| that when you multiselect Screens, the harmonica tab order in right-hand pane is the same for single [:ref:`Mapr002`] as well as multiselections [:ref:`Mapr001`]. Also check that all the annotations on the single screens are visible in the multiselection mode in the right-hand pane. 


**Section 2: Performance test**

#. Performance test will need to concentrate on the caching (going to the same page several times when cached and not cached, playing with 2 different tabs (in your browser) and trying to "put the UI off" by making actions in one tab and trying to catch up in another tab with the action.


|
|
|
|

.. _Mapr001:
.. figure:: /images/testing_scenarios/Mapr/001.png
   :align: center

   Mapr001



|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _Mapr002:
.. figure:: /images/testing_scenarios/Mapr/002.png
   :align: center

   Mapr002

|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _compound_not_expected:
.. figure:: /images/testing_scenarios/Mapr/compound_not_expected.png
   :align: center

   compound_not_expected

|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _compound_expected:
.. figure:: /images/testing_scenarios/Mapr/compound_expected.png
   :align: center

   compound_expected

|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _gene_supplementary:
.. figure:: /images/testing_scenarios/Mapr/gene_supplementary.png
   :align: center

   gene_supplementary

|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _tree_numbers:
.. figure:: /images/testing_scenarios/Mapr/tree_numbers.png
   :align: center

   tree_numbers



|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

.. _pagination_left-hand_tree:
.. figure:: /images/testing_scenarios/Mapr/pagination_left-hand_tree.png
   :align: center

   pagination_left-hand_tree



|
|
|
|
|
|
|
|
|
|
|
|
|
|
|












