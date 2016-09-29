#!flask/bin/python
# -*- coding: UTF-8 -*-
import os

from app import db
from config import SQLALCHEMY_MIGRATE_REPO, SQLALCHEMY_DATABASE_URI
from migrate.versioning import api



db.create_all()
if not os.path.exists(SQLALCHEMY_MIGRATE_REPO):
    api.create(SQLALCHEMY_MIGRATE_REPO, 'database repository')
    api.version_control(SQLALCHEMY_DATABASE_URI, SQLALCHEMY_MIGRATE_REPO)
else:
    api.version_control(SQLALCHEMY_DATABASE_URI, SQLALCHEMY_MIGRATE_REPO,api.version(SQLALCHEMY_MIGRATE_REPO))