from exts import db
from datetime import datetime

class BrandModel(db.Model):
    __tablename__ = 't_brands'
    ID = db.Column(db.Integer, primary_key=True, autoincrement=True)
    brand_name = db.Column(db.String(255), nullable=True, default=None)
    brand_code = db.Column(db.String(255), nullable=True, default=None)

class CarModel(db.Model):
    __tablename__ = 't_cars'
    ID = db.Column(db.Integer, primary_key=True, autoincrement=True)
    car_brand = db.Column(db.String(255), nullable=True, default=None)
    car_introduction = db.Column(db.String(255), nullable=True, default=None)
    car_class = db.Column(db.String(255), nullable=True, default=None)
    car_brand_code = db.Column(db.String(255), nullable=True, default=None)

class CarSalesModel(db.Model):
    __tablename__ = 't_carsales'
    ID = db.Column(db.Integer, primary_key=True, autoincrement=True)
    time = db.Column(db.DateTime, nullable=True, default=None)
    sales = db.Column(db.String(255), nullable=True, default=None)
    sale_brand_code = db.Column(db.String(255), nullable=True, default=None)

class CarsInfoModel(db.Model):
    __tablename__ = 't_carsinfo'
    ID = db.Column(db.Integer, primary_key=True, autoincrement=True)
    title = db.Column(db.String(255), nullable=True, default=None)
    hyperlink = db.Column(db.String(500), nullable=True, default=None)
    content = db.Column(db.String(100), nullable=True, default=None)

class ResultModel(db.Model):
    __tablename__ = 't_results'
    ID = db.Column(db.Integer, primary_key=True, autoincrement=True)
    time = db.Column(db.DateTime, nullable=True, default=None)
    sales = db.Column(db.String(255), nullable=True, default=None)
    sale_brand_code = db.Column(db.String(255), nullable=True, default='')

class StationModel(db.Model):
    __tablename__ = 't_stations'
    ID = db.Column(db.Integer, primary_key=True, autoincrement=True)
    station_class = db.Column(db.String(255), nullable=True, default=None)
    scope = db.Column(db.String(255), nullable=True, default=None)
    unit = db.Column(db.String(255), nullable=True, default=None)
    count = db.Column(db.Integer, nullable=True, default=None)

class UserModel(db.Model):
    __tablename__ = 't_users'
    ID = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.String(255), nullable=False)
    password = db.Column(db.String(255), nullable=False)
    email = db.Column(db.String(255), nullable=False, unique=True)
    isManager = db.Column(db.Integer, nullable=False)

