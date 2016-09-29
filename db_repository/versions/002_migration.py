from sqlalchemy import *
from migrate import *


from migrate.changeset import schema
pre_meta = MetaData()
post_meta = MetaData()
task_history = Table('task_history', pre_meta,
    Column('id', INTEGER, primary_key=True, nullable=False),
    Column('task_remark', VARCHAR(length=128)),
    Column('status', VARCHAR(length=128)),
    Column('date_time', VARCHAR(length=64)),
    Column('feature_ids', VARCHAR(length=512)),
)


def upgrade(migrate_engine):
    # Upgrade operations go here. Don't create your own engine; bind
    # migrate_engine to your metadata
    pre_meta.bind = migrate_engine
    post_meta.bind = migrate_engine
    pre_meta.tables['task_history'].columns['task_remark'].drop()


def downgrade(migrate_engine):
    # Operations to reverse the above upgrade go here.
    pre_meta.bind = migrate_engine
    post_meta.bind = migrate_engine
    pre_meta.tables['task_history'].columns['task_remark'].create()
