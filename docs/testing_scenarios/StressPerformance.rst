Stress Performance Testing
==========================



**To test in**: Web, Insight

**Purpose of the test** is to check the performance of the system under stress, combining multiple simultaneous imports with viewing and plate handling.

NB: Do not worry about feature-specific bug reporting, keep stressing the system until you see performance issues, errors or crashes.

#. Start the actions described below at a precise given hour (see Standup) in order to coincide with other testers.

#. Import the whole folder ``team/pwalczysko/stress``.

#. After the first images are ready to view, perform actions described in step 4 in taking care to: 
   
   - emphasize speed of action and to challenge the system. 
   - perform all the prescribed actions.
   - not to lose time with too meticulous performance of the steps.

#. Do repeatedly (in any order)

   - view plates.
   - view big images.
   - view multi-image-filesets (MIFs, for example ``lei``).
   - change rendering setting and channel names applying the new settings to ``all`` in a dataset.
   - export images (Download, Export as ome-tiff, jpeg, tiff, png).
   - open ROI tool, draw a line ROI, save it.


