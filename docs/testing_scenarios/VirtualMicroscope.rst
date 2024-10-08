Virtual Microscope Testing
==========================


**Production server**: <https://learning.openmicroscopy.org/dundee/>
**Staging server**: <https://ray.openmicroscopy.org/dundee/>

**Public Gallery on production server**: <https://learning.openmicroscopy.org/dundee/gallery/>
**Public Gallery on staging server**: <https://ray.openmicroscopy.org/dundee/gallery/>


**Purpose of the test** is to check the functioning of the Virtual Microscope.


#. Testing cache

   - All urls matching ``webclient/render_*`` and ``webgateway/*`` are cached for 1 minute to simplify testing
   - You can use only public urls for this testing, i.e. only the image IDs taken from Public Gallery when NOT logged in 
   - Either use Firebug, development tools in your web browser or, preferably, open console to check response using ``$ curl -I  TESTED_URL``
   - Go through following 5 steps to |C| that the cache is working properly, working on the command line and only using the Public Gallery to take the image IDs from (repolace the ``1290`` in the examples below with the IDs you need to test). The expected output is included in the examples below.

      - cache wiped out on the server (use an image which was not pointed to by curl yet)

      ::

          $ curl -I https://ray.openmicroscopy.org/dundee/webgateway/img_detail/1290/
          HTTP/1.1 200 OK
          Date: Wed, 02 Dec 2015 09:27:55 GMT
          X-Proxy-Cache: MISS

      - another request immediately after

      ::

          $ curl -I https://ray.openmicroscopy.org/dundee/webgateway/img_detail/1290/
          HTTP/1.1 200 OK
          Date: Wed, 02 Dec 2015 09:28:00 GMT
          X-Proxy-Cache: HIT

      - one minute later, after cache expired

      ::

          $ curl -I https://ray.openmicroscopy.org/dundee/webgateway/img_detail/1290/
          HTTP/1.1 200 OK
          Date: Wed, 02 Dec 2015 09:30:02 GMT
          X-Proxy-Cache: EXPIRED

      - request content that shouldn't be cached

      ::

          $ curl -I https://ray.openmicroscopy.org/dundee/webclient/login/
          HTTP/1.1 200 OK
          Date: Wed, 02 Dec 2015 09:31:10 GMT
          X-Proxy-Cache: BYPASS

      - static file cache:

      ::

          $ curl -I https://ray.openmicroscopy.org/dundee/static/webclient/image/logo_login_web.png
          Cache-Control: max-age=2592000

.. Note::
   ``X-Proxy-Cache`` can show various status (From https://www.nginx.com/blog/nginx-caching-guide/):
      
       -  MISS – The response was not found in the cache and so was fetched from an origin server. The response might then have been cached.
       -  BYPASS – The response was fetched from the origin server instead of served from the cache because the request matched a proxy_cache_bypass directive. The response might then have been cached.
       -  EXPIRED – The entry in the cache has expired. The response contains fresh content from the origin server.
       -  STALE – The content is stale because the origin server is not responding correctly, and proxy_cache_use_stale was configured.
       -  UPDATING – The content is stale because the entry is currently being updated in response to a previous request, and proxy_cache_use_stale updating is configured.
       -  REVALIDATED – The proxy_cache_revalidate directive was enabled and NGINX verified that the current cached content was still valid (If-Modified-Since or If-None-Match).
       -  HIT – The response contains valid, fresh content direct from the cache.

     

2. Public gallery testing

   - |C| in the top menu bar that you are logged in as "Public User". If you are logged in as yourself or other user, then just logout and navigate to the page again and |C| that you are now logged in as "Public User". Note that this is a known unrelated problem (see ticket :ticket:`12991`)."
   - |C| that you see only 4 images in public examples.
   - Double click on each slide and open full viewer. Zoom in and out. Load ROIs if possible.

3. General testing

   -  Log in using your UoD LDAP credentials. The login name should be case insensitive. |C| that when you try various combinations of upper and lower case, you can still log in.
   -  |C| that group/user menu displays "All courses" and name of courses only.
   -  Choose one of the courses from the list. Check if you ended up viewing data belonging to the user named as a course.
   -  Browse through each catalog and see if the slides' thumbnails load.
   -  Click on each slide and see if the metadata panels load. Please note that preview is turned off.
   -  |C| that download button is restricted to Render as JPEG/PNG/TIFF only. Download of raw data should be disabled. |C| that you cannot download original data.
   -  |C| that you cannot delete tags.
   -  |C| that scripts are disabled and there is no script listed in Script menu. Note that Script button is still available in Metadata Panel but it should throw an exception.
   -  Double click on each slide and open full viewer. Zoom in and out. Load ROIs if possible.

