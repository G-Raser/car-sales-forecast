from flask import Flask, jsonify
from flask import render_template
# from myDatabase import Database
from exts import db
import config
from flask_migrate import Migrate
from models import BrandModel
from blueprints.user import bp


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

@app.route('/')
def hello_world():
    return render_template('index.html')
    # db = Database()
    # bydsales = db.getBYDsales()
    # dict_byd = {}
    # for i in range(1, len(bydsales)):
    #     dict_byd.setdefault(bydsales[i][1], bydsales[i][2])
    # list_byd = list(dict_byd.values())
    # list_time = list(dict_byd.keys())
    # return render_template('area-basic.html', list_byd=list_byd, list_time=list_time)

# # 测试是否连接成功
# with app.app_context():
#     print(BrandModel.query.get(1).brand_name)
#     with db.engine.connect() as conn:
#         rs = conn.execute(db.text("select 1"))
#         print(rs.fetchone())  # (1,)

@app.route("/viewdata") 
def viewdata():
    alldata = data_car.data_echarts()
    return jsonify(data = alldata)


if __name__ == '__main__':
    # 启动flask
    app.run(debug=True)
