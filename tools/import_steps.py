#!flask/bin/python
# -*- coding: UTF-8 -*-
from app import models, db

file = open('init.feature','r',encoding='utf-8')
s = None
step_str = None
param_flag = False
chk_flag = False
for f in file:

    if f.strip().startswith('当') or f.strip().startswith('那么'):
        param_flag = False
        global s
        if not s is None:
            print('ready to insert steps....')
            db.session.add(s)
            db.session.commit()

        tmp_str = f.split('<')

        step_prefix = tmp_str[0]
        step_str = tmp_str[1].strip()

        print(step_str)
        st = models.Steps.query.filter_by(name = step_str).first()
        if not st is None:
            param_flag = True
            continue

        if step_prefix.strip().startswith('那么'):
            print(step_prefix)
            chk_flag = True
        else:
            chk_flag = False
        print(chk_flag)
        s = models.Steps(name=step_str, is_chk=chk_flag)
    elif f.strip().startswith('|') and not param_flag:
        param_flag = True
        params = f.strip()[1:-1]
        print(params)
        # s = s[:-1] + ',  ' + params + ')'
        print(chk_flag)
        s = models.Steps(name=step_str, is_chk=chk_flag, param_name = params)
db.session.add(s)
db.session.commit()





