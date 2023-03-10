# session加密
SECRET_KEY = 'SDASFDSFSDVXdsfsdfzxv'

#数据库配置信息
HOSTNAME = "localhost"
PORT = 3306
DATABASE = 'db_carsales'
USERNAME = 'root'
PASSWORD = 'root'
DB_URL = "mysql+pymysql://{}:{}@{}:{}/{}?charset=utf8mb4".format(USERNAME,PASSWORD,HOSTNAME,PORT,DATABASE)
SQLALCHEMY_DATABASE_URI = DB_URL

