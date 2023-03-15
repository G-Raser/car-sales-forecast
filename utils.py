from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
import config
from entity.model import (
    Brand,
    Cars,
    CarsInfo,
    CarSales,
    Station,
    User,
    Result
)
engine = create_engine(f'mysql+pymysql://{config.USERNAME}:{config.PASSWORD}@{config.HOSTNAME}/{config.DATABASE}?charset=UTF8MB4',
                       echo=False,  # echo 设为 true 会打印出实际执行的 sql，调试的时候更方便
                       #    future=True,  # 使用 2.0API，向后兼容
                       pool_size=5,  # 连接池的大小默认为 5 个，设置为 0 时表示连接无限制
                       pool_recycle=3600,  # 多久之后对线程池中的线程进行一次连接的回收（重置）
                       pool_timeout=30,  # 池中没有线程最多等待的时间，否则报错
                       pool_pre_ping=True  # 悲观方式， 每次执行sql钱会检查连接,解决数据库异常回复后连接依然没有恢复问题
                       )
db_session = sessionmaker(bind=engine, autocommit=False, autoflush=False, expire_on_commit=False)()
# Base.metadata.drop_all(engine)
# Base.metadata.create_all(engine)
db_session.commit()
db_session.close()

def get_sales(name):
    t = db_session.query(CarSales.sales).filter(CarSales.sale_brand_code == name).all()
    list1 = []
    for i in range(0, len(t)):
        list1.append(t[i][0])
    return list1
def get_time():
    t = db_session.query(CarSales.time).filter(CarSales.sale_brand_code == 'BYD').all()
    list1 = []
    for i in range(0, len(t)):
        list1.append(t[i][0])
    return list1

