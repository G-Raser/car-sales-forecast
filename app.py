from flask import Flask
from flask import render_template
# from myDatabase import Database
from exts import db
import config
from flask_migrate import Migrate
from models import BrandModel
from blueprints.user import bp

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

if __name__ == '__main__':
    app.run(debug=True)  # debug=True发生错误时会返回发生错误的地方


