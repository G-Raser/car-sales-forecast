'''
-*- coding = utf-8 -*-
@Time : 2023/3/1 22:03
@Author : Promise
@File : exts.py
@Software : PyCharm
'''
# 为了解决循环引用的问题
# flask-sqlalchemy
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()