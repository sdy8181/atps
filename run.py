#!flask/bin/python
# -*- coding: UTF-8 -*-

import subprocess
import threading
import os

import sys

# from config import LOGCAT_DIR
from app import app
def start_http_server():

    # os.chdir(LOGCAT_DIR)
    # 先杀掉进程
    if sys.platform == 'linux':
        # ret = os.popen('netstat -anp | grep 9527').readlines()
        ret = subprocess.Popen('netstat -anp | grep 9527', stdout=subprocess.PIPE, shell=True).stdout.readlines()

        for r in ret:
            r = r.decode()
            if '9527' in r:
                while '  ' in r:
                    r = r.replace('  ', ' ')

                pid = (r.strip().split(' ')[6].split('/')[0])
                subprocess.call('kill -9 ' + pid, shell=True)
                break
        subprocess.call('python3 -m http.server 9527', shell=True)
    else:
        # ret = os.popen('netstat -ano | findstr 9527').readlines()
        ret = subprocess.Popen('netstat -ano | findstr 9527', stdout=subprocess.PIPE, shell=True).stdout.readlines()
        for r in ret:
            r = r.decode()
            if '9527' in r:
                while '  ' in r:
                    r = r.replace('  ', ' ')

                pid = r.strip().split(' ')[4]
                subprocess.call('taskkill /F /pid ' + pid, shell=True)
                break
        subprocess.call('python -m http.server 9527', shell=True)

#判断logcat目录是否存在,不存在则创建目录
# if not os.path.exists(LOGCAT_DIR):
#     os.makedirs(LOGCAT_DIR)
#
# t = threading.Thread(target=start_http_server)
# t.setDaemon(True)
# t.start()

app.run(host='10.10.99.12', debug=True)
