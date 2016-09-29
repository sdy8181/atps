#!flask/bin/python
# -*- coding: UTF-8 -*-
from config import SQLALCHEMY_MIGRATE_REPO, SQLALCHEMY_DATABASE_URI
from migrate.versioning import api

v = api.db_version(SQLALCHEMY_DATABASE_URI, SQLALCHEMY_MIGRATE_REPO)
api.downgrade(SQLALCHEMY_DATABASE_URI,SQLALCHEMY_MIGRATE_REPO, v - 1)
v = api.db_version(SQLALCHEMY_DATABASE_URI, SQLALCHEMY_MIGRATE_REPO)
print('Current database version: ' + str(v))