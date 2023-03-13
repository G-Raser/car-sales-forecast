from flask import Flask, jsonify, g, session, request, redirect,url_for
from flask import render_template
# from myDatabase import Database
from exts import db
import config
from flask_migrate import Migrate
from models import BrandModel, UserModel
from blueprints.user import bp
from blueprints.forms import UpdateForm

import data_car

# 创建flask的应用对象
# __name__表示当前的模块名称
# 模块名: flask以这个模块所在的目录为根目录，默认这个目录中的static为静态目录，templates为模板目录
app = Flask(__name__)

# 绑定配置文件
app.config.from_object(config)

db.init_app(app)

# flask迁移数据库
migrate = Migrate(app, db)

#blueprint代码模块化
app.register_blueprint(bp)


# # 测试是否连接成功
# with app.app_context():
#     print(BrandModel.query.get(1).brand_name)
#     with db.engine.connect() as conn:
#         rs = conn.execute(db.text("select 1"))
#         print(rs.fetchone())  # (1,)



# 定义url请求路径
@app.route('/')
def hello_world():
    return render_template('index.html')


# 左上角公司通知
@app.route("/viewdata")
def viewdata():
    alldata = data_car.data_echarts()
    return jsonify(data=alldata)

# 修改资料
@app.route("/update", methods=['GET', 'POST'])
def updateUser():
    if request.method == 'GET':
        return render_template("update.html")
    else:
        form = UpdateForm(request.form)
        if form.validate():
            username = form.username.data
            sex = form.sex.data
            brand = form.brand.data
            email = form.email.data

            user_ID = session.get("user_ID")
            user = UserModel.query.get(user_ID)
            user.username = username
            user.sex = sex
            user.brand = brand
            user.email = email

            db.session.commit()
            return render_template("index.html")
        else:
            print(form.errors)
            return render_template("update.html")

# 钩子函数 hook before_request/ before_first_request/ after_request
@app.before_request
def my_before_request():
    user_ID = session.get("user_ID")
    if user_ID:
        user = UserModel.query.get(user_ID)
        setattr(g, "user", user)
    else:
        setattr(g, "user", None)


@app.context_processor
def my_context_processor():
    return {"user": g.user}

if __name__ == '__main__':
    # 启动flask
    app.run(debug=True)
