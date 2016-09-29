# -*- coding: utf-8 -*-

from app import models, db
class DbOpt:

    def insertFeatrue(self, data):
        feature = models.Features.query.filter_by(sce_name=data['name']).first()

        if not feature:
            s = models.Features(feature=data['name'], type=data['module'], sce_name =data['name'], sce_tags = data['tags'], sce_type = data['sce_type'])
            db.session.add(s)
        else:
            # 删除关联的步骤信息
            feature_steps_relationShip = models.FeaturesStepsRelationShip.query.filter_by(feature_id=feature.id).all()
            if feature_steps_relationShip:
                for fsr in feature_steps_relationShip:
                    db.session.delete(fsr)
                    db.session.commit()
            s = models.Features.query.filter_by(id=feature.id).first()
            s.feature=data['name']
            s.type=data['module']
            s.sce_name = data['name']
            s.sce_tags = data['tags']
            s.sce_type = data['sce_type']

        db.session.commit()
        id = models.Features.query.filter_by(sce_name=data['name']).first().id
        print(data['name'])
        return id

    def insertFeatureStepsRelationShip(self, data):
        s = models.FeaturesStepsRelationShip(feature_id=data['feature_id'], step_id=data['step_id'], step_idx=data['idx'], step_params=data['param'], step_values=data['value'])
        db.session.add(s)
        db.session.commit()


        # s = models.Features(name=step_str, is_chk=chk_flag, param_name = params)
    def del_feature(self, feature_id):
        # 删除关联的步骤信息
        feature_steps_relationShip = models.FeaturesStepsRelationShip.query.filter_by(feature_id=feature_id).all()
        if feature_steps_relationShip:
            for fsr in feature_steps_relationShip:
                db.session.delete(fsr)
                db.session.commit()
#                 删除步骤
        feature = models.Features.query.filter_by(id = feature_id).first()
        db.session.delete(feature)
        db.session.commit()

    def insert_task_history(self, data):
        try:
            s = models.TaskHistory(status=data['status'], date_time=data['date_time'], feature_ids=data['feature_ids'], results='')
            db.session.add(s)
            db.session.commit()
            id_s = models.TaskHistory.query.filter_by(date_time=data['date_time']).first()

            return id_s.id
        except Exception as e:
            db.session.rollback()
            raise Exception(e)

    def update_task_status(self, id):
        try:
            task = models.TaskHistory.query.filter_by(id=id).first()
            task.status = '执行结束'
            db.session.commit()
        except Exception as e:
            db.session.rollback()
            raise Exception(e)
    # 保存运行结果到数据库
    def save_result_to_task(self, data):
        try:
            task = models.TaskHistory.query.filter_by(id=data['id']).first()
            task.results = data['result']
            print(task.results)
            db.session.commit()
        except Exception as e:
            db.session.rollback()
            raise Exception(e)


dbOpter = DbOpt()
