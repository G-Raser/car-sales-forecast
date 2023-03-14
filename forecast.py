import warnings
import itertools
import pandas as pd
import matplotlib.pyplot as plt
import statsmodels.api as sm
import utils

def forcast():
    # Defaults
    plt.rcParams['figure.figsize'] = (20.0, 10.0)
    plt.rcParams.update({'font.size': 12})
    plt.style.use('ggplot')
    taglist = ['BYD', 'XP', 'T', 'NIO', 'LX']
    sales = {}
    value_list = {}
    data = {}
    for tag in taglist:
        sales[tag] = utils.get_sales(tag)
    date_time = utils.get_time()
    MyTime = pd.to_datetime(date_time, format='%Y-%m-%d')
    key_list = MyTime
    for tag in taglist:
        value_list[tag] = sales[tag]
        data[tag] = {'date': key_list,
                     'value': value_list[tag]}
        data[tag] = pd.DataFrame(data[tag])
        data[tag].set_index('date', inplace=True)

    q = d = range(0, 2)
    p = range(0, 3)
    pdq = list(itertools.product(p, d, q))
    seasonal_pdq = [(x[0], x[1], x[2], 36) for x in list(itertools.product(p, d, q))]
    train_data = {}
    test_data = {}
    for tag in taglist:
        train_data[tag] = data[tag]['2021-01-03':'2022-10-30']
        test_data[tag] = data[tag]['2022-11-6':'2023-1-22']
        print(train_data[tag])

    warnings.filterwarnings("ignore")

    AIC_list = {

    }
    SARIMAX_model = []
    SARIMAX_model_list = {taglist[0]: SARIMAX_model}
    mod = {}
    results = {}
    for tag in [taglist[0], taglist[1]]:
        print(tag)
        for param in pdq:
            for param_seasonal in seasonal_pdq:
                try:
                    mod[tag] = sm.tsa.statespace.SARIMAX(train_data[tag],
                                                         order=param,
                                                         seasonal_order=param_seasonal,
                                                         # enforce_stationarity=False,
                                                         enforce_invertibility=False
                                                         )
                    results[tag] = mod[tag].fit()
                    # print('SARIMAX{}x{} - AIC:{}'.format(param, param_seasonal, results[tag].aic), end='\r')
                    AIC_list[tag].append(results[tag].aic)
                    SARIMAX_model.append([param, param_seasonal])
                except:
                    continue
        SARIMAX_model_list[tag] = SARIMAX_model
        # print("SARIMAX_model_list[tag]=")
        # print(SARIMAX_model_list[tag])
    print("over")
    for tag in taglist:
        print('The smallest AIC is {} for model SARIMAX {}x{}'.format(min(AIC_list[tag]), SARIMAX_model_list[tag][
            AIC_list[tag].index(min(AIC_list[tag]))][0], SARIMAX_model_list[tag][AIC_list[tag].index(min(AIC_list[tag]))][
                                                                          1]))
        mod[tag] = sm.tsa.statespace.SARIMAX(train_data,
                                             order=SARIMAX_model[AIC_list[tag].index(min(AIC_list[tag]))][0],
                                             seasonal_order=SARIMAX_model[AIC_list[tag].index(min(AIC_list[tag]))][1],
                                             # enforce_stationarity=False,
                                             enforce_invertibility=False)
        results[tag] = mod[tag].fit()
    pred = results.get_forecast('2023-03-07')
    pred_ci = pred.conf_int()
    print(pred.predicted_mean['2023-1-22':'2023-3-7'])
    save = pd.DataFrame(pred.predicted_mean['2022-1-22':])
    save.to_sql(name='t_results', con=utils.engine)
    return 0
