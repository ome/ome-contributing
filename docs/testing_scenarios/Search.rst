Search
======



**New UI in 5.0.3 in**: Web, Insight

**Purpose of the test** is to check that Insight and Web have the same Search UI and
return valid results with each query.
All searches below should be performed at the same time in Insight and Web and the
displayed results should be identical in both clients.

.. seealso::
   
    `Query Parser Syntax <http://lucene.apache.org/core/3_1_0/queryparsersyntax.html>`_ for how to write search queries.

 
.. seealso::

     `Luke <https://code.google.com/archive/p/luke/>`_
        a Java application which you can download and point at your ``/OMERO/FullText`` directory to get a better feeling for Lucene queries. Download ``lukeall-3.5.0.jar`` and do ``java -jar lukeall-3.5.0.jar -ro -index /OMERO/FullText/``.


**Test links and tools**

#. |C| that the Hints button (under ``?`` sign in Insight and ``Show Search hints`` in Web) opens and the message makes sense.
#. |C| that the link to the Help webpage inside the Hints button works.

**Test default search**

#. Start by entering a search query in the tool-bar search box in the main client window. Type query and hit Enter or click search button.

   - |C| that you are taken to the search 'page'/UI with your search query entered into the search field, and that the search has been performed with the results appearing in the center panel.
   - |C| that the Web and Insight search forms have all the same fields and that the defaults are the same.
   - |C| that the objects searched for are ``Projects``, ``Datasets``, ``Images``, ``Screens``, ``Plates`` (all checkboxes selected by default).
   - |C| that no fields are chosen by default: Checkboxes for ``Name``, ``Description``, ``Annotations`` are all unchecked.
   - |C| that the default ``Scope`` for the search is ``All Groups``, with user matching the username you are logged in as, e.g.``user-4 user-4``.
   - |C| that no date range has been chosen by default.


**Test various search queries**

#. Test single keywords by entering one word into the search field.

   - |C| that searching with a single keyword returns results where every result contains the keyword in ``Name``, ``Description`` or ``Annotation``.
   - |C| that same results returned by Web and Insight.

#. Search for multiple keywords separated by spaces. 

   - |C| that the clients use OR logic in this case, but that the Results list is sorted in such a manner that the results which contain most keywords are on the top of the list. See also the limitations in :term:`Tokenizing`

#. Select to search for ``Name`` only by checking the ``Name`` checkbox. Search for single keyword.

   - |C| that all results have the keyword in their name.

#. Search for two or more keywords, separated by spaces, with ``Name`` field checked.

   - |C| that all results have one or more of the keywords in their name.
   - |C| that results with most keywords in their name are ordered first.

#. Search for two or more keywords, separated by ``AND``, with ``Name`` field checked.

   - |C| that all results have ALL keywords in their name.

#. Search for multiple words within double quotes.

   - |C| that only results containing the quoted words are returned  See also Limitations in :term:`Quotes`

#. Use wildcards in searches, with ``?`` replacing a single character and ``*`` replacing 1 or more characters.

   - |C| that results are consistent with this wildcard behaviour.
   - |C| that leading wildcards, where the search starts with ``?`` or ``*`` also work.
   - |C| that wildcards work in both keywords of a 2-keyword search.
   - See also Limitations in :term:`Wildcards`
   
#. Try searches including various non-alphanumeric characters, including wildcards, ``AND`` and OR (for OR use logic only, not the OR string itself, note that the OR logic is a default in clients).

   - |C| that no exceptions are thrown.
   - |C| also test with single characters or wildcards.
   - See also Limitations in :term:`Wildcards`
   - See also Limitations in :term:`Advanced Search`


#. |C| that Search for two terms with ``AND`` in between with fields ticked will return the result if the two terms are:
   
   - in the same ticked field (e.g. ``weird AND bla`` will return a   result if ``Name`` is ticked and both ``weird`` and ``bla`` are in the ``Name``)
   - one term in one ticked field and another term in another ticked field (e.g. ``weird AND bla`` will return result when the ``weird`` is in a ``Name`` and ``bla`` is in ``Description`` as long as both ``Name`` and ``Description`` are ticked) 

#. Try search by ID: Enter a valid ID for Project, Dataset or Image, with all datatypes checked.

   - |C| that the object is returned regardless of current group or group search, or ``Data owned by`` options.
   - |C| that if the search query matches other objects by other fields, they are also returned.
   - |C| that objects returned by ID appear at the top of search results.


**Test object types and fields**

#. Restrict the types of object you are searching for by unchecking Image, Dataset etc.

   - |C| that you only get the specified object types returned.

#. Add a description to an Image, including various keywords that also exist in other Image names. Select ``Description`` field only. Search for keywords within the description you added.

   - |C| that the Image is returned - NB: this also confirms that the index was updated.
   - |C| that no objects are returned that don't have the search terms in their description.

#. Add a text, csv or PDF file attachment to an Image, a Plate and a Screen, do not select any fields. Search for keywords within the content and name of the attachment you added. Note that the textfile must have the  ``.txt``, ``.csv`` or ``.pdf``,  suffix to its name for the content search to succeed.

   - |C| that the Image, Plate and Screen are returned - NB: this also confirms that the index was updated.
   - |C| that when you select the field ``Annotation`` and search again, the Image, Plate and Screen with the attachment are returned again.




**Test Scope**

#. You need to be a member of several groups with a number of users in each. Each group needs to have some data owned by different users.
   Search with 'All Groups' chosen, and with your name (e.g. ``user-4 user-4``).

   - |C| that Group for each search result is shown in Results list.
   - |C| that all data returned belongs to you, and is not restricted by group.

#. Search with 'All Groups' and 'All Users'.

   - |C| that data returned is not restricted by user or group.

#. Search within a specific group and with your username selected.

   - |C| that data returned belongs to you, and only comes from the specified group.

#. Search within a specified group and 'All Users'.

   - |C| that results are from the specified group and not restricted by owner.

#. Search within a specified group and user.

   - |C| that all results come from the specified group and belong to correct user.


**Test date range**

#. Enter a single 'From' date and search.
   
   - |C| that you cannot pick a date in the future (Web only?)
   - |C| that search results are all created after picked date.
   - |C| that you cannot search with a 'To' date before the 'From' date.
   - |C| that the 'From' date can be cleared and search is not now restricted by date

#. Enter a 'To' date only.
   
   - |C| that you cannot pick a date in the future (Web only?)
   - |C| that you cannot perform the search without also picking a 'From' date

#. Enter a 'From' and 'To' date.
   
   - |C| that all results are created between the picked dates.

#. Search for ``Import date`` or ``Acquisition date`` should be implemented.
   
   - |C| that the ``Import date`` is the Default.
   - |C| that you can always search for ``Import Date`` and ``Acquisition Date`` date.
   - |C| that you can always see in the UI what date is shown (also in Results list) - there should be 2 separate columns.
   - |C| that you can sort these columns by clicking on the bar above them.
   - Note that only some image formats have reliable Acquisition dates in OMERO, e.g. ``svs``
   - Note that only images have Acquisition dates, P/D/S/Ps have only Imported date. Nevertheless, P/D/S/Ps will be found even when Acquisition date is specified only, which is a bit counter-intuitive, but expected.
   - (Insight only) |C| that a search with an empty query but a valid date range returns results as expected (= all the items with the ``Import date`` or ``Acquisition date`` within the specified range).

**Search Results**

#. Go to the Search Results and select one. 

   - (Web only) |C| that you can navigate to the result in the data tree by clicking on the link in the rightmost column of the central pane.
   - |C| that the right-hand pane is visible for P/D/S/P/I search results
   - |C| that in Insight, in case of Images, you can navigate to the containing dataset using right-hand pane, and ``Located in``.
   - |C| that in Insight the ``Located in`` link will lead you to the correct result only when the group in which the result is located is on display (under ``Projects`` harmonica). 
   - (Insight only) |C| that if the group is not on display the links will lead you to Project tab. Click back to Search tab and select another image in the Results list and 
   - (Insight only) |C| that there are no Insight errors when doing so.

**Known Limitations**

.. glossary::

   **Tokenizing**


      The search queries are tokenized at the non-alphanumeric 
      characters (except dash, underscore and colon), and then passed to Lucene. The OR logic between 
      multiple tokens is implemented. The non-alphanumeric characters 
      are ignored (except dash and underscore, which are accepted at face value).  For the behaviour of colon see :term:`Map Annotations Search`



   **Quotes** 


      The Quoted search will not keep everything as it is in quotes, 
      instead it will tokenize at the non-alphanumeric signs and throw 
      these away. Nevertheless, the order of the terms in the quotes is 
      of importance and will be respected. For example ``"weird_tag"`` 
      and  ``"weird-tag"`` queries will have the same Result, like 
      ``weird tag``, ``weird_tag`` and ``weird-tag`` but not 
      ``weirdtag`` and not ``tag weird`` or ``weird spacer tag``.



   **Wildcards**


      The combination of a wildcard with any non-alphanumeric character 
      search is not allowed and will be caught out with a warning 
      message, e.g. ``(*`` but also ``?*`` or ``**`` and ``*.*`` will 
      give no results. Search for ``*.svs`` defaults to ``svs``. The 
      search for parts of alphanumerics groups must be done using 
      wildcards, parts of alphanumeric groups only will return nothing, e
      .g. search for ``we`` will NOT return ``weird_image.svs``, but 
      search for ``we*`` will.



   **Advanced Search**


      Search for ``nd2 weird AND attachment`` takes the space betwee ``nd2`` and ``weird`` as OR and returns the results which have 
      both ``weird`` and ``attachment`` OR ``nd2`` in them.



   **Map Annotations Search**


      Additionally to the possiblity of searching single or multiple strings of Key:Value pairs in the Map Annotations, there is following logic implemented. ``Temperature:37`` will find only Map Annotations (i.e. NOT OTHER types of Annotations) with Key ``Temperature`` AND Value ``37``. Key ``Temperature`` with Value ``40``, as well as Key ``37`` with Value ``Temperature`` will both be ignored.
      A further possibility is to search for ``has_key:Temperature`` which will return solely Map Annotations with this specific Key.
   





