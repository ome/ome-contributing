#! /usr/bin/python

from datetime import datetime, timedelta
from omero.gateway import BlitzGateway
from omero.cli import cli_login
import omero.model
from omero.rtypes import rtime
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('target_user')
parser.add_argument('images', nargs='+')
args = parser.parse_args()

with cli_login() as cli:
    conn = BlitzGateway(client_obj=cli._client)

    target_user = conn.getAdminService().lookupExperimenter(args.target_user)
    members = [omero.model.ExperimenterI(target_user.id.val, False)]
    images = [omero.model.ImageI(i, False) for i in args.images]
    tomorrow = (datetime.now() + timedelta(days=1))
    epoch = datetime.utcfromtimestamp(0)
    expiration = rtime((tomorrow- epoch).total_seconds() * 1000.0)
    conn.getShareService().createShare(
        'test', expiration, images, members, [], True)
