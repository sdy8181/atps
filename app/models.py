#!flask/bin/python
# -*- coding: UTF-8 -*-

from app import db
from datetime import datetime

class Steps(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement='ignore_fk')
    name = db.Column(db.String(128), index=True, unique= True)
    is_chk = db.Column(db.Boolean,index=True,unique=False)
    param_name = db.Column(db.String(256), index=False, unique=False)
    param_desc = db.Column(db.String(256), index=False, unique=False)
    # features = db.relationship('Features_Steps_RelationShip', backref='id',lazy='dynamic')

    def __str__(self):
        return '<Steps %r>' %(self.name)


class Features(db.Model):
    id = db.Column(db.Integer, primary_key = True, autoincrement='ignore_fk')
    feature = db.Column(db.String(256), index=True, unique= True)
    type = db.Column(db.String(128), index=True, unique= False)
    sce_type = db.Column(db.String(128), index=True, unique= False)
    author = db.Column(db.String(128), index= True, unique= False)
    filepath = db.Column(db.String(256), index=False, unique= False)
    sce_name = db.Column(db.String(256), index=False, unique= False)
    sce_tags = db.Column(db.String(128), index=False, unique= False)
    # step_id = db.Column(db.Integer, db.ForeignKey('steps.id'))
    # step_idx = db.Column(db.Integer)

    def __str__(self):
        return '<Features %r>' % (self.sce_name)

class FeaturesStepsRelationShip(db.Model):
    id = db.Column(db.Integer, primary_key = True, autoincrement='ignore_fk')
    feature_id = db.Column(db.Integer)
    step_id = db.Column(db.Integer)
    step_idx = db.Column(db.Integer)
    step_params = db.Column(db.String(128))
    step_values = db.Column(db.String(128))

class TaskHistory(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement='ignore_fk')
    status = db.Column(db.String(128))
    date_time = db.Column(db.String(64))
    feature_ids = db.Column(db.String(512))
    results = db.Column(db.String())
