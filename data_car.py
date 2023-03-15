#!/usr/bin/env python3
# -*- encoding: utf-8 -*-


import pymysql

#mysql查询使用
conn = pymysql.connect(host="localhost", user="root", passwd="Promise", port=3306,db="db_carsales", charset="UTF8MB4",autocommit=True)
cur = conn.cursor(cursor = pymysql.cursors.DictCursor)

def data_echarts():
    
    # 1、左中
    sql1="""
        select scope,count from t_stations
        where station_class = '公共充电站';
    """

    try:
        #1、左中
        cur.execute(sql1)
        rs = cur.fetchall()
        #print(rs)
        map_data1 =  []
        for ai in rs:
            map_data1.append({"name":ai['scope'],"value":ai['count']})
        # print(map_data1)
    except:
        map_data1 =  [{"name":"北京","value":0}]
        print('info1:左中数量获取失败--')


    # 2、左下
    sql2="""
       select t2.brand_name,t1.sales
        from t_carsales t1
        left join t_brands t2
        on t1.sale_brand_code = t2.brand_code
        where t1.time = '2023/1/22'
        order by field(t2.brand_name,'比亚迪','特斯拉','理想','蔚来','小鹏');
    """

    try:
        #2、左下
        cur.execute(sql2)
        rs2 = cur.fetchall()
        #print(rs)
        pie_data1 =  []
        for ai2 in rs2:
            pie_data1.append({"name":ai2['brand_name'],"value":ai2['sales']})
        # print(pie_data1)
    except:
        pie_data1 =  [{"name":"","value":0}]
        print('info2:左下数量获取失败--')


    # 3、中间
    sql3="""
       select time 
			,SUM(case when sale_brand_code = 'BYD' THEN sales END) AS BYD
			,SUM(case when sale_brand_code = 'LX' THEN sales END) AS LX
			,SUM(case when sale_brand_code = 'T' THEN sales END) AS T
			,SUM(case when sale_brand_code = 'NIO' THEN sales END) AS NIO
			,SUM(case when sale_brand_code = 'XP' THEN sales END) AS XP
        from t_carsales
        group by time 
        ORDER BY time;
    """

    sql3_1 = """
           select time 
    			,SUM(case when sale_brand_code = 'BYD' THEN sales END) AS BYD
    			,SUM(case when sale_brand_code = 'LX' THEN sales END) AS LX
    			,SUM(case when sale_brand_code = 'T' THEN sales END) AS T
    			,SUM(case when sale_brand_code = 'NIO' THEN sales END) AS NIO
    			,SUM(case when sale_brand_code = 'XP' THEN sales END) AS XP
            from t_results
            group by time 
            ORDER BY time;
        """

    try:
        #3、中间
        cur.execute(sql3)
        rs3 = cur.fetchall()
        cur.execute(sql3_1)
        rs3_1=cur.fetchall()
        # print(rs3)
        # print(rs3_1)
        line_data = {}
        line_name,line_data1,line_data2,line_data3,line_data4,line_data5 =  [],[],[],[],[],[]
        for ai3 in rs3:
            line_name.append(ai3['time'])
            line_data1.append(int(ai3['BYD']))
            line_data2.append(int(ai3['LX']))
            line_data3.append(int(ai3['T']))
            line_data4.append(int(ai3['NIO']))
            line_data5.append(int(ai3['XP']))
        for ai3_1 in rs3_1:
            line_name.append(ai3_1['time'])
            line_data1.append(int(ai3_1['BYD']))
            line_data2.append(int(ai3_1['LX']))
            line_data3.append(int(ai3_1['T']))
            line_data4.append(int(ai3_1['NIO']))
            line_data5.append(int(ai3_1['XP']))
        line_data = {'line_name':line_name,'line_data1':line_data1,'line_data2':line_data2,'line_data3':line_data3,'line_data4':line_data4,'line_data5':line_data5}
        print(line_data)
    except:
        print('info3:中间数量获取失败--')


    # 4、右上
    sql4="""
       select t2.brand_name
            ,sum( case when left(time,4)= '2021' then sales end ) as sales_2021
            ,sum( case when left(time,4)= '2022' then sales end ) as sales_2022
            ,sum( case when left(time,4)= '2023' then sales end ) as sales_2023
        from t_carsales t1
        left join t_brands t2
        on t1.sale_brand_code = t2.brand_code
        group by t2.brand_name
        order by field(t2.brand_name,'比亚迪','特斯拉','理想','蔚来','小鹏');
    """

    try:
        #4、右上
        cur.execute(sql4)
        rs4 = cur.fetchall()
        #print(rs)
        bar_data = {}
        bar_name,bar_data1,bar_data2,bar_data3 =  [],[],[],[]
        for ai4 in rs4:
            bar_name.append(ai4['brand_name'])
            bar_data1.append(int(ai4['sales_2021']))
            bar_data2.append(int(ai4['sales_2022']))
            bar_data3.append(int(ai4['sales_2023']))
        bar_data = {'bar_name':bar_name,'bar_data1':bar_data1,'bar_data2':bar_data2,'bar_data3':bar_data3}
        # print(bar_data)
    except:
        print('info4:右上数量获取失败--')
    
    data = {'map_data1':map_data1,'pie_data1':pie_data1,'line_data':line_data,'bar_data':bar_data}

    return data


if __name__ == '__main__':
    print(data_echarts())
