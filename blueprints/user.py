'''
-*- coding = utf-8 -*-
@Time : 2023/3/3 16:13
@Author : Promise
@File : user.py
@Software : PyCharm
'''
from flask import Blueprint,render_template,request,redirect,url_for,session
from exts import db
from .forms import LoginForm,RegisterForm
from models import UserModel

from werkzeug.security import generate_password_hash, check_password_hash


bp = Blueprint("user",__name__,url_prefix='/user')

# GET：从服务器上获取数据
# POST：将客户端数据交给服务器
@bp.route('/register',methods=['GET','POST'])
def register():
    if request.method == 'GET':
        return render_template('register.html')
    else:
        # 验证用户提交的邮箱和验证码对应是否正确
        # 表单验证：flask-wtf:wtforms
        form = RegisterForm(request.form)
        if form.validate():
            email = form.email.data
            username = form.username.data
            password = form.password.data
            # 对密码加密
            user = UserModel(email=email, username=username, password=generate_password_hash(password),isManager=0)
            db.session.add(user)
            db.session.commit()
            return redirect(url_for("user.login"))
        else:
            print(form.errors)
            return redirect(url_for("user.register"))


@bp.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'GET':
        return render_template("login.html")
    else:
        form = LoginForm(request.form)
        if form.validate():
            email = form.email.data
            password = form.password.data
            user = UserModel.query.filter_by(email=email).first()
            if not user:
                print("邮箱在数据库中不存在！")
                return redirect(url_for("user.login"))
            if check_password_hash(user.password, password):
                # cookie：
                # cookie中不适合存储太多的数据，只适合存储少量的数据
                # cookie一般用来存放登录授权的东西
                # flask中的session，是经过加密后存储在cookie中的
                session['user_ID'] = user.ID
                return redirect("/")
            else:
                print("密码错误！")
                return redirect(url_for("user.login"))
        else:
            print(form.errors)
            return redirect(url_for("user.login"))







