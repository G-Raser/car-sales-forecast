from flask import Flask
from flask import render_template
from exts import db
import config.config as cf
import utils
from flask_migrate import Migrate

# 创建flask的应用对象
# __name__表示当前的模块名称
# 模块名: flask以这个模块所在的目录为根目录，默认这个目录中的static为静态目录，templates为模板目录
app = Flask(__name__)
# 绑定配置文件
app.config.from_object(cf)
db.init_app(app)
# flask迁移数据库
migrate = Migrate(app, db)


# 定义url请求路径
@app.route('/')
def hello_world():
    sales_byd = utils.get_sales('BYD')
    sales_xp = utils.get_sales('XP')
    sales_t = utils.get_sales('T')
    sales_nio = utils.get_sales('NIO')
    sales_lx = utils.get_sales('LX')
    data_time = utils.get_time()
    return render_template('area-stack.html',
                           sales_byd=sales_byd,
                           sales_xp=sales_xp,
                           sales_t=sales_t,
                           sales_nio=sales_nio,
                           sales_lx=sales_lx,
                           data_time=data_time
                           )


if __name__ == '__main__':
    # 启动flask
    app.run(debug=True)
