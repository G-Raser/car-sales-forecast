'''
-*- coding = utf-8 -*-
@Time : 2023/2/10 15:53
@Author : Promise
@File : forms.py
@Software : PyCharm
'''
import wtforms
from wtforms.validators import Email, Length, EqualTo, InputRequired
from models import UserModel
from exts import db

# Form:主要就是用来验证前端提交的数据是否符合要求
class RegisterForm(wtforms.Form):
    email = wtforms.StringField(validators=[Email(message='邮箱格式错误')])
    username = wtforms.StringField(validators=[Length(min=2,max=10,message='用户名格式错误！')])
    password = wtforms.StringField(validators=[Length(min=6,max=16,message='密码格式错误！')])

    # 自定义验证：
    # 1. 邮箱是否已经被注册
    def validate_email(self,field):
        email = field.data
        user = UserModel.query.filter_by(email=email).first()
        if user:
            raise wtforms.ValidationError(message='该邮箱已经被注册！')

class LoginForm(wtforms.Form):
    email = wtforms.StringField(validators=[Email(message="邮箱格式错误！")])
    password = wtforms.StringField(validators=[Length(min=6, max=20, message="密码格式错误！")])

