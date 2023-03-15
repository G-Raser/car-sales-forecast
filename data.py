#!/usr/bin/env python3
# -*- encoding: utf-8 -*-


import pymysql

#mysql查询使用
conn = pymysql.connect(host="localhost", user="root", passwd="root", port=3306,db="mysql", charset="UTF8MB4",autocommit=True)
cur = conn.cursor(cursor = pymysql.cursors.DictCursor)



# 处理图形数据
def data_read():

    # 执行sql函数
    def data_mysql(sql):
        cur.execute(sql)
        rs = cur.fetchall()
        return rs
    
    # 一、总人口
    # 1、年末总人口
    # 2、城乡人口分布
    # 3、人口性别分布
    all_data = {}
    sql1="""
        select t1.z_type,t2.z_name,t1.z_year,round(t1.z_data) as z_data
        from rep_total_population t1
        left join rep_code t2
        on t1.z_node = t2.z_code
        where t1.z_type = '总人口'
        and t2.z_name = '年末总人口' or (t2.z_name in ('城镇人口','乡村人口','男性人口','女性人口') and t1.z_year = '2021')
        order by t1.z_node,t1.z_year;
    """
    total_alldata = data_mysql(sql1)
    total = {}
    total_data1,total_data2,total_data3,total_data4,total_data5 = [] , [] , [] , [] , []
    
    for r in range(0,len(total_alldata)):
        if total_alldata[r]['z_name'] == '年末总人口':
            total_data1.append(str(int(total_alldata[r]['z_year'])))
            total_data2.append(int(total_alldata[r]['z_data']))
        elif total_alldata[r]['z_name'] in ('城镇人口','乡村人口'):
            total_data3.append(int(total_alldata[r]['z_data']))
        elif total_alldata[r]['z_name'] in ('男性人口','女性人口'):
            total_data4.append(int(total_alldata[r]['z_data']))
    
    total_data5 = [total_data2[9],round((total_data2[9] - total_data2[8])*100/total_data2[8],2)]

    total['echarts1_data'] = {'data1':total_data1,'data2':total_data2}
    total['echarts2_data'] = total_data3
    total['echarts3_data'] = total_data4
    total['echarts4_data'] = total_data5

    # 二、地区人口
    sql2="""
        select t1.z_type,
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(t2.z_name,'市',''),'省',''),'自治区',''),'壮族',''),'回族',''),'维吾尔','') z_name,
        t1.z_year,
        round(t1.z_data) z_data
        from rep_total_population t1
        left join rep_code t2
        on t1.z_node = t2.z_code
        where t1.z_type = '地区人口'
        and t1.z_year = '2020';
    """
    diqu_alldata = data_mysql(sql2)
    diqu_data1 = []
    for d in range(0,len(diqu_alldata)):
        diqu_data1.append({'name':diqu_alldata[d]['z_name'],'value':int(diqu_alldata[d]['z_data'])})

    # 三、人口年龄结构
    # 1、年龄分布
    sql3="""
        select '总体' z_type,
        t1.z_year,
        SUBSTRING_INDEX(t2.z_name, "人", 1) as z_name,
        round(sum(t1.z_data)*100/t3.z_data) as z_data
        from rep_total_population t1
        left join rep_code t2
        on t1.z_node = t2.z_code
        left join (select z_data from rep_total_population
                                where z_type = '人口年龄结构和抚养比'
                                and z_year = '2019'
                                and z_node ='A030301') t3
        on 1=1
        where z_type = '人口年龄结构和抚养比'
        and t1.z_year = '2019'
        and t2.z_name in ('0-14岁人口','15-64岁人口','65岁及以上人口')
        group by t1.z_type,
        t2.z_name,
        t1.z_year,
        t3.z_data

        union all

        select '细分' z_type,
        t1.z_year,
        SUBSTRING_INDEX(t2.z_name, "人", 1) as z_name,
        round(t1.z_data*100/(select z_data from rep_total_population t1 where z_node = 'A03060101' and t1.z_year = '2019'),2) as z_data
        from rep_total_population t1
        left join rep_code t2
        on t1.z_node = t2.z_code
        where t1.z_type = '抽样调查样本_按年龄分'
        and t1.z_year = '2019'
        and t1.z_node <> 'A03060101'    
    """
    renkou_alldata = data_mysql(sql3)
    renkou1 = {}
    renkou_data1,renkou_data2,renkou_data3,renkou_data4 = [],[],[],[]
    for rk in range(0,len(renkou_alldata)):
        if renkou_alldata[rk]['z_type'] == '总体':
            renkou_data1.append(renkou_alldata[rk]['z_name'])
            renkou_data2.append(int(renkou_alldata[rk]['z_data']))
        elif renkou_alldata[rk]['z_type'] == '细分':
            renkou_data3.append(renkou_alldata[rk]['z_name'])
            renkou_data4.append(renkou_alldata[rk]['z_data'])
    renkou1['echart1_data'] = {'data1':renkou_data1,'data2':renkou_data2}
    renkou1['echart2_data'] = {'data1':renkou_data3,'data2':renkou_data4}

    # 2、男性/女性按年龄分
    sql4="""
        with z_nan as(
        select t1.z_type,
        t1.z_year,
        SUBSTRING_INDEX(SUBSTRING_INDEX(t2.z_name, "男", 1), "女", 1) as z_name,
        round(t1.z_data*100/t3.z_data,2) as z_data
        from rep_total_population t1
        left join rep_code t2
        on t1.z_node = t2.z_code
        left join (select z_type,z_data from rep_total_population t1 where z_node in ('A03060201','A03060301') and t1.z_year = '2019') t3
        on t1.z_type = t3.z_type
        where t1.z_type in ('抽样调查样本_男性按年龄分','抽样调查样本_女性按年龄分')
        and t1.z_year = '2019'
        and t1.z_node not in ('A03060201','A03060301')
        )
        select z_year,
        CONCAT('总体',REPLACE(REPLACE(z_type,'抽样调查样本_',''),'按年龄分','')) as z_type,
        '0-14岁' as z_name,
        round(sum(case when z_name in ('0-4岁','5-9岁','10-14岁') then z_data end),0) as z_data
        from z_nan
        group by z_type,z_year

        union

        select z_year,
        CONCAT('总体',REPLACE(REPLACE(z_type,'抽样调查样本_',''),'按年龄分','')) as z_type,
        '15-64岁' as z_name,
        round(sum(case when z_name not in ('0-4岁','5-9岁','10-14岁','65-69岁','70-74岁','75-79岁','80-84岁','85-89岁','90-94岁','95岁以上') then z_data end),0) as z_data
        from z_nan
        group by z_type,z_year

        union

        select z_year,
        CONCAT('总体',REPLACE(REPLACE(z_type,'抽样调查样本_',''),'按年龄分','')) as z_type,
        '65岁及以上' as z_name,
        round(sum(case when z_name in ('65-69岁','70-74岁','75-79岁','80-84岁','85-89岁','90-94岁','95岁以上') then z_data end),0) as z_data
        from z_nan
        group by z_type,z_year

        union

        select 
        t1.z_year,
        CONCAT('细分',right(SUBSTRING_INDEX(t2.z_name, "人", 1),2)) z_type ,
        SUBSTRING_INDEX(SUBSTRING_INDEX(t2.z_name, "男", 1), "女", 1) as z_name,
        round(t1.z_data*100/t3.z_data,2) as z_data
        from rep_total_population t1
        left join rep_code t2
        on t1.z_node = t2.z_code
        left join (select z_type,z_data from rep_total_population t1 where z_node in ('A03060201','A03060301') and t1.z_year = '2019') t3
        on t1.z_type = t3.z_type
        where t1.z_type in ('抽样调查样本_男性按年龄分','抽样调查样本_女性按年龄分')
        and t1.z_year = '2019'
        and t1.z_node not in ('A03060201','A03060301')
    """
    renkou_alldata2 = data_mysql(sql4)
    renkou_data5,renkou_data6,renkou_data7,renkou_data8,renkou_data9,renkou_data10,renkou_data11,renkou_data12 = [],[],[],[],[],[],[],[]
    for rk2 in range(0,len(renkou_alldata2)):
        if renkou_alldata2[rk2]['z_type'] == '总体男性':
            renkou_data5.append(renkou_alldata2[rk2]['z_name'])
            renkou_data6.append(float(renkou_alldata2[rk2]['z_data']))
        elif renkou_alldata2[rk2]['z_type'] == '细分男性':
            renkou_data7.append(renkou_alldata2[rk2]['z_name'])
            renkou_data8.append(float(renkou_alldata2[rk2]['z_data']))
        elif renkou_alldata2[rk2]['z_type'] == '总体女性':
            renkou_data9.append(renkou_alldata2[rk2]['z_name'])
            renkou_data10.append(int(renkou_alldata2[rk2]['z_data']))
        elif renkou_alldata2[rk2]['z_type'] == '细分女性':
            renkou_data11.append(renkou_alldata2[rk2]['z_name'])
            renkou_data12.append(float(renkou_alldata2[rk2]['z_data']))

    renkou1['echart3_data'] = {'data1':renkou_data5,'data2':renkou_data6}
    renkou1['echart4_data'] = {'data1':renkou_data7,'data2':renkou_data8}
    renkou1['echart5_data'] = {'data1':renkou_data9,'data2':renkou_data10}
    renkou1['echart6_data'] = {'data1':renkou_data11,'data2':renkou_data12}

    # 四、就业人员和工资
    sql5="""
        select t1.z_type,
        t2.z_name,
        CONCAT(t1.z_year ,'年') as z_year,
        t1.z_data
        from rep_total_population t1
        left join rep_code t2
        on t1.z_node = t2.z_code
        where t1.z_type = '就业人员_劳动力'

        union all

        select t1.z_type,
        t2.z_name,
        CONCAT(t1.z_year ,'年') as z_year,
        round(case when t2.z_name = '个体户数' then t1.z_data else t1.z_data*100/t3.z_data end,0) as z_data
        from rep_total_population t1
        left join rep_code t2
        on t1.z_node = t2.z_code
        left join (select z_year,z_data from rep_total_population
                            where z_node = 'A040D02') t3
        on t1.z_year = t3.z_year
        where t1.z_type = '就业人员_个体就业'
        and t2.z_name <>'个体就业人数'
        and t1.z_year<='2019'

        union all

        select t1.z_type,
        SUBSTRING_INDEX(t2.z_name, "就", 1) as z_name,
        t1.z_year,
        round(t1.z_data*100/t3.z_data) as z_data
        from rep_total_population t1
        left join rep_code t2
        on t1.z_node = t2.z_code
        left join (select z_year,z_data from rep_total_population
                            where z_node = 'A040201') t3
        on t1.z_year = t3.z_year
        where t1.z_type in ('就业人员_按产业分','就业人员_按城乡分')
        and t1.z_year='2020'
        and t2.z_name <>'就业人员'
    """
    jiuye_alldata = data_mysql(sql5)
    jiuye = {}
    jiuye_data1,jiuye_data2,jiuye_data3,jiuye_data4,jiuye_data5,jiuye_data6,jiuye_data7,jiuye_data8,jiuye_data9,jiuye_data10 = [],[],[],[],[],[],[],[],[],[]
    for jy in range(0,len(jiuye_alldata)):
        if jiuye_alldata[jy]['z_name'] == '劳动力':
            jiuye_data1.append(jiuye_alldata[jy]['z_year'])
            jiuye_data2.append(int(jiuye_alldata[jy]['z_data']))
        elif jiuye_alldata[jy]['z_name'] == '个体户数':
            jiuye_data3.append(jiuye_alldata[jy]['z_year'])
            jiuye_data4.append(int(jiuye_alldata[jy]['z_data']))
        elif jiuye_alldata[jy]['z_name'] == '城镇就业人数':
            jiuye_data5.append(int(jiuye_alldata[jy]['z_data']))
        elif jiuye_alldata[jy]['z_name'] == '乡村个体就业人数':
            jiuye_data6.append(int(jiuye_alldata[jy]['z_data']))
        elif jiuye_alldata[jy]['z_type'] == '就业人员_按产业分':
            jiuye_data7.append(jiuye_alldata[jy]['z_name'])
            jiuye_data8.append(int(jiuye_alldata[jy]['z_data']))
        elif jiuye_alldata[jy]['z_type'] == '就业人员_按城乡分':
            jiuye_data9.append(jiuye_alldata[jy]['z_name']+'就业')
            jiuye_data10.append(int(jiuye_alldata[jy]['z_data']))
    jiuye['echart1_data']={'data1':jiuye_data1,'data2':jiuye_data2}
    jiuye['echart2_data']={'data1':jiuye_data3,'data2':jiuye_data4,'data3':jiuye_data5,'data4':jiuye_data6}
    jiuye['echart3_data']={'data1':jiuye_data7,'data2':jiuye_data8}
    jiuye['echart4_data']={'data1':jiuye_data9,'data2':jiuye_data10}

    sql6 ="""
        select t1.z_type,
        t2.z_name,
        sum(case when t1.z_year='2021' then t1.z_data end) as z_data_2021,
        sum(case when t1.z_year='2020' then t1.z_data end) as z_data_2020,
        sum(case when t1.z_year='2019' then t1.z_data end) as z_data_2019,
        sum(case when t1.z_year='2018' then t1.z_data end) as z_data_2018,
        sum(case when t1.z_year='2017' then t1.z_data end) as z_data_2017,
        sum(case when t1.z_year='2016' then t1.z_data end) as z_data_2016,
        sum(case when t1.z_year='2015' then t1.z_data end) as z_data_2015,
        sum(case when t1.z_year='2014' then t1.z_data end) as z_data_2014
        from rep_total_population t1
        left join rep_code t2
        on t1.z_node = t2.z_code
        where t1.z_type in ('人民生活_全国居民人均收入','人民生活_城镇居民人均收入','人民生活_农村居民人均收入')
        group by t1.z_type,
        t2.z_name
    """
    shouru_alldata = data_mysql(sql6)
    shouru = {}
    s1_data1,s1_data2,s1_data3,s1_data4,s1_data5,s1_data6,s1_data7,s1_data8,s1_data9 = [],[],[],[],[],[],[],[],[]
    s2_data1,s2_data2,s2_data3,s2_data4,s2_data5,s2_data6,s2_data7,s2_data8,s2_data9 = [],[],[],[],[],[],[],[],[]
    s3_data1,s3_data2,s3_data3,s3_data4,s3_data5,s3_data6,s3_data7,s3_data8,s3_data9 = [],[],[],[],[],[],[],[],[]
    for sr in range(0,len(shouru_alldata)):
        if shouru_alldata[sr]['z_type'] == '人民生活_全国居民人均收入':
            s1_data1.append(shouru_alldata[sr]['z_name'])
            s1_data2.append(shouru_alldata[sr]['z_data_2021'])
            s1_data3.append(shouru_alldata[sr]['z_data_2020'])
            s1_data4.append(shouru_alldata[sr]['z_data_2019'])
            s1_data5.append(shouru_alldata[sr]['z_data_2018'])
            s1_data6.append(shouru_alldata[sr]['z_data_2017'])
            s1_data7.append(shouru_alldata[sr]['z_data_2016'])
            s1_data8.append(shouru_alldata[sr]['z_data_2015'])
            s1_data9.append(shouru_alldata[sr]['z_data_2014'])
        elif shouru_alldata[sr]['z_type'] == '人民生活_城镇居民人均收入':
            s2_data1.append(shouru_alldata[sr]['z_name'])
            s2_data2.append(shouru_alldata[sr]['z_data_2021'])
            s2_data3.append(shouru_alldata[sr]['z_data_2020'])
            s2_data4.append(shouru_alldata[sr]['z_data_2019'])
            s2_data5.append(shouru_alldata[sr]['z_data_2018'])
            s2_data6.append(shouru_alldata[sr]['z_data_2017'])
            s2_data7.append(shouru_alldata[sr]['z_data_2016'])
            s2_data8.append(shouru_alldata[sr]['z_data_2015'])
            s2_data9.append(shouru_alldata[sr]['z_data_2014'])
        elif shouru_alldata[sr]['z_type'] == '人民生活_农村居民人均收入':
            s3_data1.append(shouru_alldata[sr]['z_name'])
            s3_data2.append(shouru_alldata[sr]['z_data_2021'])
            s3_data3.append(shouru_alldata[sr]['z_data_2020'])
            s3_data4.append(shouru_alldata[sr]['z_data_2019'])
            s3_data5.append(shouru_alldata[sr]['z_data_2018'])
            s3_data6.append(shouru_alldata[sr]['z_data_2017'])
            s3_data7.append(shouru_alldata[sr]['z_data_2016'])
            s3_data8.append(shouru_alldata[sr]['z_data_2015'])
            s3_data9.append(shouru_alldata[sr]['z_data_2014'])
    shouru['table1'] = {'data1':s1_data1,
                        'data2':s1_data2,
                        'data3':s1_data3,
                        'data4':s1_data4,
                        'data5':s1_data5,
                        'data6':s1_data6,
                        'data7':s1_data7,
                        'data8':s1_data8,
                        'data9':s1_data9}
    shouru['table2'] = {'data1':s2_data1,
                        'data2':s2_data2,
                        'data3':s2_data3,
                        'data4':s2_data4,
                        'data5':s2_data5,
                        'data6':s2_data6,
                        'data7':s2_data7,
                        'data8':s2_data8,
                        'data9':s2_data9}
    shouru['table3'] = {'data1':s3_data1,
                        'data2':s3_data2,
                        'data3':s3_data3,
                        'data4':s3_data4,
                        'data5':s3_data5,
                        'data6':s3_data6,
                        'data7':s3_data7,
                        'data8':s3_data8,
                        'data9':s3_data9}

    all_data = {'total':total,
                'diqu':diqu_data1,
                'renkou1':renkou1,
                'jiuye':jiuye,
                'shouru':shouru}
    return all_data

# 修改数据函数
def updatedata(results):
    '''
    print('data-z_type',results['z_type'])
    print('data-z_data',results['z_data'])
    sql = "update rep_total_population set z_data='%s' where z_year='2021' and z_node='" + results['z_type'] + "' % (" + results['z_data'] + ")"
    print('sql',sql)
    '''
    sql = "update rep_total_population set z_data=" + results['z_data'] + " where z_year='2021' and z_node='" + results['z_type'] + "'"
    print('sql',sql)
    try:
        cur.execute(sql)
        conn.commit()
    except:
        # 如果发生错误就回滚，建议使用这样发生错误就不会对表数据有影响
        conn.rollback()
    return

# 删除数据函数
def deletedata(results):
    sql = "delete from rep_total_population where z_node='" + results['z_type'] + "'"
    #print('sql',sql)
    ''''''
    try:
        cur.execute(sql)
        conn.commit()
    except:
        # 如果发生错误就回滚，建议使用这样发生错误就不会对表数据有影响
        conn.rollback()
    return
    

# 插入数据函数
def insertdata(results):
    sql = "insert into rep_total_population(z_type,z_node,z_year,z_data)values('人民生活_全国居民人均收入','" + results['z_type'] +"','" + results['z_year'] +"'," + results['z_data'] +")"
    #print('sql',sql)
    ''''''
    try:
        cur.execute(sql)
        conn.commit()
    except:
        # 如果发生错误就回滚，建议使用这样发生错误就不会对表数据有影响
        conn.rollback()
    return
    

if __name__ == "__main__":
    print(data_read())