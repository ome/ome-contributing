Share security testing
======================

**To test in**: Web, CLI

**Purpose of the test** is to check that you cannot bypass security on the server as a member of a share. The rationale for the test: A member of a single private group which has no data on their own should not be able to retrieve any data (of other users) on the server, even if the user is a member of a Share. The Share for the purposes of this test contains no images.

#. Login to web as an admin. Create a brand new user (non-admin, non-group owner, username:"test_share_owner") in a private group. This user should have no data.

#. Edit the first three lines of the following python script to point to your server and port and the password of the newly created user "test_share_owner"::

    import omero
    from omero.rtypes import unwrap

    host = "myserver"
    port = 4064
    password = "CHANGEME"
    owner = "test_share_owner"

    c_owner = omero.client(host=host, port=port)
    s_owner = c_owner.createSession(owner, password)

    q = """select i.id, i.name, i.details.owner.id, i.details.group.id from Image i"""
    assert 0 == len(unwrap(s_owner.getQueryService().projection(q, None, {'omero.group': str(-1)})))

    sid = s_owner.getShareService().createShare("test", None, [], [], [], True)

    assert 0 == len(s_owner.getQueryService().findAll("Image", None, {'omero.share': str(sid), 'omero.group': str(-1)}))


    q = """select i.id, i.name, i.details.owner.id, i.details.group.id from Image i"""
    res = unwrap(s_owner.getQueryService().projection(q, None, {'omero.share': str(sid), 'omero.group': str(-1)}))
    print "res:", len(res)
    for i in res:
        print i


    q = """select count(i.id) from Image i"""
    print "total images on the server:", unwrap(s_owner.getQueryService().projection(q, None, {'omero.share': str(sid), 'omero.group': str(-1)}))


    s_owner.closeOnDestroy()
    c_owner.closeSession()
    c_owner.__del__()



#. |C| that the output of the script run is just two lines, e.g.::

    res: 0
    total images on the server: [[0L]]

#. Here is the example of NON-EXPECTED output (there is a non-zero "res" output, as well as non-zero images found, these images and "res" should be inaccessible to the user) ::

    res: 21325
    [1L, 'abdominal.dcm', 7L, 7L]
    [2L, 'ankle.dcm', 7L, 7L]
    [3L, '000000_000001.jpx', 10L, 9L]
    [4L, '4kx4k.jpf', 10L, 9L]
    [5L, '8kx8k.jpf', 10L, 9L]
    ...
    [24323L, 'i241.fake', 10L, 9L]
    [24328L, 'i644.fake', 10L, 9L]
    [24351L, '1minute30asecinterval2cycles807ms.czi', 6L, 9L]
    total images on the server: [[21325L]]


