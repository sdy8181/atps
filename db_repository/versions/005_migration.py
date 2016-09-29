from sqlalchemy import *
from migrate import *


from migrate.changeset import schema
pre_meta = MetaData()
post_meta = MetaData()
task_history = Table('task_history', post_meta,
    Column('id', Integer, primary_key=True, nullable=False),
    Column('status', String(length=128)),
    Column('date_time', String(length=64)),
    Column('feature_ids', String(length=512)),
    Column('results', TEXT),
)


def upgrade(migrate_engine):
    # Upgrade operations go here. Don't create your own engine; bind
    # migrate_engine to your metadata
    pre_meta.bind = migrate_engine
    post_meta.bind = migrate_engine
    post_meta.tables['task_history'].create()


def downgrade(migrate_engine):
    # Operations to reverse the above upgrade go here.
    pre_meta.bind = migrate_engine
    post_meta.bind = migrate_engine
    post_meta.tables['task_history'].drop()
