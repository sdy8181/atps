# -*- coding: utf-8 -*-

from app import models, db

class DelSteps:

    def del_step_id_by_name(self, step_name):
        step = models.Steps.query.filter_by(name=step_name).first()
        if step is not None:
            id = step.id
            print(id)
            try:
                db.session.delete(step)
                db.session.commit()
            except:
                db.session.rollback()
            finally:
                return id

    def del_feature_step_relationship_id_by_step_id(self, step_id):
        fsrList = models.FeaturesStepsRelationShip.query.filter_by(step_id=step_id).all()
        if len(fsrList) > 0:
            print('aaa')
            print(fsrList)
            for fsr in fsrList:
                print(fsr.id)
                try:
                    db.session.delete(fsr)
                    db.session.commit()
                except:
                    db.session.rollback()


ds= DelSteps()

if __name__ == '__main__':
    step_list = ['打开我的视频', '播放本地视频', '验证视频播放名称一致', '验证视频是否播放', '打开视频搜索', '输入视频搜索关键字', '从搜索结果中播放指定视频', '清空视频搜索框并验证', '从播放记录中播放指定视频', '搜索热门搜索视频', '搜索搜索记录视频', '打开我的发现', '随机播放发现视频', '打开爱奇艺', '随机播放爱奇艺视频', '获取爱奇艺观看记录', '获取我的视频播放记录', '验证视频搜索结果']
    if len(step_list) > 0:
        for slist in step_list:
            id = ds.del_step_id_by_name(slist)
            ds.del_feature_step_relationship_id_by_step_id(id)


