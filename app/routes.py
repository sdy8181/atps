#!flask/bin/python
# -*- coding: UTF-8 -*-
import os

from app import app
# from config import LOGCAT_DIR
from app import models
from flask import jsonify, request
from tools.db_operator import DbOpt, dbOpter


@app.route('/')
@app.route('/index')
def index():
    # return "Hello, World!"
    posts = [
        {'author': 'ouguangqian',
         'email': 'guangqianou@pateo.com.cn',
         }
    ]
    return jsonify(posts)


@app.route('/atp/steps/all')
def query_steps_all():
    st = models.Steps.query.all()
    data = []

    for s in st:
        d = {'name': s.name, 'id': s.id}
        data.append(d)
        # print(data)
        # print(jsonify(data))
    return jsonify(data)


@app.route('/atp/features/all')
def query_features_all():
    fe = models.Features.query.all()
    data = []
    for f in fe:
        d = {'id': f.id, 'name': f.sce_name, 'type': f.type, 'sce_type': f.sce_type, 'author': f.author}
        data.append(d)
    return jsonify(data)


@app.route('/atp/steps/params/<string:step_name>')
def query_steps_params_by_name(step_name):
    data = []
    st = models.Steps.query.filter_by(name=step_name).first()

    if st.param_name == None:
        return jsonify({})

    params = st.param_name.split('|')
    for p in params:
        d = {'param': p}
        data.append(d)
    return jsonify(data)


# 根据步骤信息获取id
@app.route('/atp/steps/id/<string:step_name>')
def query_steps_id_by_name(step_name):
    st = models.Steps.query.filter_by(name=step_name).first()
    if st.id == None:
        return jsonify({})
    else:
        return jsonify({'id': st.id})


@app.route('/atp/feature/save', methods=['POST'])
def save_feature():
    print(request.json)
    if not request.json:
        raise Exception('请求为空')
    data = request.json
    print(data)
    feature_id = dbOpter.insertFeatrue(data)
    steps = data['steps']
    idx = 0
    for st in steps:
        st_name = st['name']
        st_param = st['params']
        param = ''
        value = ''
        if len(st_param) > 0:
            for p in st_param:
                if param == '':
                    param += p['name']
                    value += p['value']
                else:
                    param += '|' + p['name']
                    value += '|' + p['value']
        print(param)
        print(value)
        step_id = models.Steps.query.filter_by(name=st_name).first().id
        relationShipData = {'feature_id': feature_id, 'step_id': step_id, 'idx': idx, 'param': param, 'value': value}
        dbOpter.insertFeatureStepsRelationShip(relationShipData)

        idx += 1

    return jsonify(data)


@app.route('/atp/feature/info/<string:sce_name>')
def get_feature_info_by_name(sce_name):
    feature = models.Features.query.filter_by(sce_name=sce_name).first()
    if feature == None:
        return jsonify({})
    else:
        print(type(feature))
        return jsonify(
            {'id': feature.id, 'sce_name': feature.sce_name, 'tags': feature.sce_tags, 'module': feature.type})


@app.route('/atp/feature/info/id=<int:feature_id>')
def get_feature_info_by_id(feature_id):
    feature = models.Features.query.filter_by(id=feature_id).first()
    if feature == None:
        return jsonify({})
    else:
        print(type(feature))
        return jsonify(
            {'id': feature.id, 'sce_name': feature.sce_name, 'tags': feature.sce_tags, 'module': feature.type,
             'feature_name': feature.feature})


@app.route('/atp/feature/featureStepsRelationShip/<string:sce_name>')
def get_feature_steps_relationship_info(sce_name):
    # 根据场景名称获取feature_id
    feature_id = models.Features.query.filter_by(sce_name=sce_name).first().id
    print('场景' + sce_name + '的ID：' + str(feature_id))
    # 查询所有步骤信息 id, param, value, idx
    steps_info = models.FeaturesStepsRelationShip.query.filter_by(feature_id=feature_id).all()
    if len(steps_info) > 0:
        ret = []
        for st in steps_info:
            idx = st.step_idx
            id = st.step_id
            params = []
            param = st.step_params
            value = st.step_values
            if len(param) > 0:
                pa = param.split('|')
                va = value.split('|')
                for i in range(len(pa)):
                    p = {'name': pa[i], 'value': va[i]}
                    params.append(p)
            st_info = {'idx': idx, 'id': id, 'params': params}
            ret.append(st_info)

        return jsonify(ret)
    else:
        return jsonify({})


@app.route('/atp/steps/info/<int:step_id>')
def get_steps_info(step_id):
    st = models.Steps.query.filter_by(id=step_id).first()
    if st.id == None:
        return jsonify({})
    else:
        return jsonify({'name': st.name, 'is_chk': st.is_chk})


@app.route('/atp/feature/del/<int:feature_id>')
def del_feature(feature_id):
    print(feature_id)
    dbOpter.del_feature(feature_id)
    return jsonify({'result': 'true'})


@app.route('/atp/task/save', methods=['POST'])
def save_task_history():
    print(request.json)
    id = dbOpter.insert_task_history(request.json)
    return jsonify({'result': 'true', 'id': id})


@app.route('/atp/task/result/save', methods=['POST'])
def save_result_to_task_his():
    print(request.json)
    dbOpter.save_result_to_task(request.json)
    return jsonify({'result': 'true'})


@app.route('/atp/task/all')
def get_task_all():
    tasks = models.TaskHistory.query.order_by(models.TaskHistory.date_time)
    data = []
    for ta in tasks:
        print(ta.id)
        task = {'id': ta.id, 'status': ta.status, 'date_time': ta.date_time, 'feature_ids': ta.feature_ids}
        data.insert(0, task)
    return jsonify(data)


@app.route('/atp/task/status/update/<int:id>')
def update_task_status(id):
    dbOpter.update_task_status(id)
    return jsonify({'result': 'true'})


@app.route('/atp/task/<int:id>')
def get_task_his_by_id(id):
    task = models.TaskHistory.query.filter_by(id=id).first()
    data = {}
    if task.results == None:
        data = {'id': task.id, 'status': task.status, 'date_time': task.date_time, 'feature_ids': task.feature_ids,
                'result': ''}
    else:
        data = {'id': task.id, 'status': task.status, 'date_time': task.date_time, 'feature_ids': task.feature_ids,
                'result': task.results}
    return jsonify(data)


@app.route('/atp/logcat/log', methods=['POST'])
def upload_logcat_file():
    pass
    # print(request.json)
    # fileName = request.json['fileName']
    # taskId = request.json['taskId']
    # content = request.json['content']
    #
    # filePath = os.path.join(LOGCAT_DIR, taskId, fileName)
    # if not os.path.exists(os.path.dirname(filePath)):
    #     os.makedirs(os.path.dirname(filePath))
    # try:
    #     file = open(filePath, 'a', encoding='UTF-8')
    #     file.writelines(content)
    # finally:
    #     file.close()
    # return jsonify({})
