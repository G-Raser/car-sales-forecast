from entity.model import (
    Brand,
    Cars,
    CarsInfo,
    CarSales,
    Station,
    User,
    Result,
    db_session
)


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

