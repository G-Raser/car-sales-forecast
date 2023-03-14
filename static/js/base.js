
function fnW(str) {
    var num;
    str >= 10 ? num = str : num = "0" + str;
    return num;
}

//预测折线图
//var china_map =echarts.init(document.getElementById("china_map"),'macarons'); 
var china_map =echarts.init(document.getElementById("china_map"),'infographic'); 
//var china_map =echarts.init(document.getElementById("china_map"),'shine');


option = {
  title: {
    text: ' '
  },
  tooltip: {
    trigger: 'axis',
    axisPointer: {
      type: 'cross',
      label: {
        backgroundColor: '#062a4f'
      }
    }
  },
  legend: {
    textStyle: {
        fontSize:  14,
        color:  '#6084ff',
        padding: [0,0,0,8]
    },
    data: ['Email', 'Union Ads', 'Video Ads', 'Direct', 'Search Engine']
  },
  toolbox: {
    feature: {
      saveAsImage: {}
    }
  },
  grid: {
    left: '3%',
    right: '3%',
    bottom: '3%',
    containLabel: true
  },
  xAxis: [
    {
      type: 'category',
      boundaryGap: false,
      axisLabel: {
                  show: true,    //这行代码控制着坐标轴x轴的文字是否显示
                  textStyle: {
                  color: '#6084ff',   //x轴上的字体颜色
                  fontSize:'15.7'    // x轴字体大小
                  }
      },
      data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
    }
  ],
  yAxis: [
    {
      type: 'value',
      axisLabel: {
                  show: true,    //这行代码控制着坐标轴x轴的文字是否显示
                  textStyle: {
                  color: '#6084ff',   //y轴上的字体颜色
                  fontSize:'16'    // y轴字体大小
                  }
      },
    }
  ],
  series: [
    {
      name: 'Email',
      type: 'line',
      stack: 'Total',
      areaStyle: {
      },
      emphasis: {
        focus: 'series'
      },
        data:  [120, 132, 101, 134, 90, 230, 210],
        markLine: {
              silent: true, //基线显示 隐藏
               symbol:'none',// 不显示箭头和圆点
              lineStyle: {
                normal: {
                  color: '#ff6c6c', // 这儿设置安全基线颜色
                  width:3//设置线条粗细
                },
              },
            data: [
                {
                    name: "已有数据",
                    xAxis: '2023/1/22', // 安全基线 1
                    label: {
                        formatter: "已有数据",
                        textStyle:{
                            fontSize:19
                        }
                    },
                },
                // {
                //     name: "标线1终点",
                //     xAxis: 100, // 安全基线 2
                //     label: {
                //         formatter: "AAA",
                //     },
                // },
            ],
        }
    },
    {
      name: 'Union Ads',
      type: 'line',
      stack: 'Total',
      areaStyle: {},
      emphasis: {
        focus: 'series'
      },
      data:  [220, 182, 191, 234, 290, 330, 310]
    },
    {
      name: 'Video Ads',
      type: 'line',
      stack: 'Total',
      areaStyle: {},
      emphasis: {
        focus: 'series'
      },
      data:[150, 232, 201, 154, 190, 330, 410]
    },
    {
      name: 'Direct',
      type: 'line',
      stack: 'Total',
      areaStyle: {},
      emphasis: {
        focus: 'series'
      },
      data: [320, 332, 301, 334, 390, 330, 320]
    },
    {
      name: 'Search Engine',
      type: 'line',
      stack: 'Total',
      label: {
        show: false,
        position: 'top'
      },
      areaStyle: {},
      emphasis: {
        focus: 'series'
      },
      data: [820, 932, 901, 934, 1290, 1330, 1320]
    }
  ]
};
china_map.setOption(option);
//中国地图结束







//获取当前时间
var timer = setInterval(function () {
    var date = new Date();
    var year = date.getFullYear(); //当前年份
    var month = date.getMonth(); //当前月份
    var data = date.getDate(); //天
    var hours = date.getHours(); //小时
    var minute = date.getMinutes(); //分
    var second = date.getSeconds(); //秒
    var day = date.getDay(); //获取当前星期几 
    var ampm = hours < 12 ? 'am' : 'pm';
    $('#time').html(fnW(hours) + ":" + fnW(minute) + ":" + fnW(second));
    $('#date').html('<span>' + year + '/' + (month + 1) + '/' + data + '</span><span>' + ampm + '</span><span>周' + day + '</span>')

}, 1000)


//充电桩地区分布图地图
var pie_fanzui =echarts.init(document.getElementById("pie_fanzui"),'infographic');
var data = [
    {
        name: '北京',
        value: ['116.489356', '39.94083',100],
        date: '2022-10-01',
        city: '北京市',
    },
];
var convertData = function (data) {
  var res = [];
  for (var i = 0; i < data.length; i++) {
      var geoCoord = geoCoordMap[data[i].name];
      if (geoCoord) {
      res.push({
          name: data[i].name,
          value: geoCoord.concat(data[i].value),
      });
      }
  }
  return res;
};
var geoCoordMap = {
  '北京':[116.405285,39.904989],
  '山东':[117.000923, 36.675807],
  '河北':[115.48333,38.03333],
  '吉林':[125.35000,43.88333],
  '黑龙江':[127.63333,47.75000],
  '辽宁':[123.38333,41.80000],
  '内蒙古':[111.670801, 41.818311],
  '新疆':[87.68333,43.76667],
  '甘肃':[103.73333,36.03333],
  '宁夏':[106.26667,37.46667],
  '山西':[112.53333,37.86667],
  '陕西':[108.95000,34.26667],
  '河南':[113.65000,34.76667],
  '安徽':[117.283042, 31.86119],
  '江苏':[119.78333,32.05000],
  '浙江':[120.20000,30.26667],
  '福建':[118.30000,26.08333],
  '广东':[113.23333,23.16667],
  '江西':[115.90000,28.68333],
  '海南':[110.35000,20.01667],
  '广西':[108.320004, 22.82402],
  '贵州':[106.71667,26.56667],
  '湖南':[113.00000,28.21667],
  '湖北':[114.298572, 30.584355],
  '四川':[104.06667,30.66667],
  '云南':[102.73333,25.05000],
  '西藏':[91.00000,30.60000],
  '青海':[96.75000,36.56667],
  '天津':[117.20000,39.13333],
  '上海':[121.55333,31.20000],
  '重庆':[106.45000, 29.56667],
  '台湾': [121.30, 25.03],
  '香港': [114.10000,22.20000],
  '澳门': [113.50000,22.20000],
};
var data2 = [
    { name: '北京', value: 177 },
    { name: '天津', value: 42 },
    { name: '河北', value: 102 },
    { name: '山西', value: 81 },
    { name: '内蒙古', value: 47 },
    { name: '辽宁', value: 67 },
    { name: '吉林', value: 82 },
    { name: '黑龙江', value: 66 },
    { name: '上海', value: 24 },
    { name: '江苏', value: 92 },
    { name: '浙江', value: 114 },
    { name: '安徽', value: 109 },
    { name: '福建', value: 116 },
    { name: '江西', value: 91 },
    { name: '山东', value: 119 },
    { name: '河南', value: 137 },
    { name: '湖北', value: 116 },
    { name: '湖南', value: 114 },
    { name: '重庆', value: 91 },
    { name: '四川', value: 125 },
    { name: '贵州', value: 62 },
    { name: '云南', value: 83 },
    { name: '西藏', value: 9 },
    { name: '陕西', value: 80 },
    { name: '甘肃', value: 56 },
    { name: '青海', value: 10 },
    { name: '宁夏', value: 18 },
    { name: '新疆', value: 67 },
    { name: '广东', value: 123 },
    { name: '广西', value: 59 },
    { name: '海南', value: 14 },
];
option = {

    backgroundColor: '#033652',
    tooltip: {
        show: true,
        formatter: function(params) {
            console.log(params)
            too_data =  params.data.name  
                         + "<br />充电桩数量： " + params.data.value[2]
             return too_data;
     }
    },
    visualMap: {
        show: true,
        min: 0,
        max: 25000,
        left: 'left',
        top: 'bottom',
        text: ['高', '低'], // 文本，默认为数值文本
        calculable: true,
        seriesIndex: [1],
        inRange: {
            color: ['#00467F', '#A5CC82'], // 蓝绿
        },
    },
    geo: {
        show: true,
        map: 'china',
        label: {
            normal: {
                show: true,
                color: '#fff',
            },
            emphasis: {
                color: '#000000',
                fontSize: 8,
                show: true,
            },
        },
        roam: true,
        scaleLimit: {
            min: 1.2,
            max: 15,
        },
        zoom: 2.0,
        itemStyle: {
            normal: {
                borderWidth: 1, // 区域边框宽度
                borderColor: '#029fd4', // 区域边框颜色
                areaColor: '#2F639A', // 区域颜色
            },
            emphasis: {
                areaColor: '#2F639A',
            },
        },
    },
    series: [
        {
            name: '散点',
            type: 'scatter',
            coordinateSystem: 'geo',
            data: data,
            symbol: 'pin',
            symbolSize: 30,
            label: {
                normal: {
                    show: false,
                },
                emphasis: {
                    show: false,
                },
            },
            itemStyle: {
                normal: {
                    color: '#33C481',
                },
                emphasis: {
                    color: '#f00',
                },
            },
        },
        {
            type: 'map',
            map: 'china',
            geoIndex: 0,
            aspectScale: 0.75, //长宽比
            showLegendSymbol: false, // 存在legend时显示
            label: {
                normal: {
                    show: true,
                },
                emphasis: {
                    show: false,
                    textStyle: {
                        color: '#e8e1e1',
                    },
                },
            },
            roam: 'scale',
            tooltip:{
              show: true,
              formatter: function(params) {
                  too_data =  params.data.name  
                               + "<br />充电桩数量： " + params.data.value
                   return too_data;
           }},
            itemStyle: {
                normal: {
                    areaColor: '#031525',
                    borderColor: '#3B5077',
                },
                emphasis: {
                    areaColor: '#2B91B7',
                },
            },
            animation: false,
            data: data2,
        },
    ],
};
pie_fanzui.setOption(option);


//-----------------饼图-----------------

var pie_bingtu =echarts.init(document.getElementById("pie_bingtu"),'infographic');
var Data = [
        {
          value: 46,
          name: "比亚迪",
        },
        {
          value: 32,
          name: "特斯拉",
        },
        {
          value: 34,
          name: "小鹏",
        },
        {
          value: 38,
          name: "蔚来",
        },
        {
          value: 57,
          name: "理想",
        },
];
option = {
        backgroundColor: 'rgba(2,34,49,0.9)',
        color: ["#00b1f2", "#ff921d", "#7bed75", "#4df9ff", "#e8ff7f"],
        legend: {
          type: "plain",
          orient: "vertical",
          left: "57%",
          top: "center",
          align: "left",
          itemGap: 30,
          itemWidth: 20, // 设置宽度
          itemHeight: 20, // 设置高度
          icon: "circle",
          symbolKeepAspect: false,
          formatter: function (name) {
            let data = option.series[0].data;
            // console.log(data, 'data')
            let total = 0;
            let tarValue;
            for (let i = 0; i < data.length; i++) {
              total += data[i].value;
              if (data[i].name == name) {
                tarValue = data[i].value;
              }
            }
            let v = tarValue;
            //计算出百分比
            return `${name}  ${v} `;
            //name是名称，v是数值
          },
          textStyle: {
            color: "#fff",
            fontSize: 12,
          },
        },
        series: [
          {
            type: "pie",
            hoverAnimation: true,
            hoverOffset: 20,
            startAngle: 180, //起始角度
            clockwise: false, //是否顺时针
            radius: ["35%", "68%"],
            center: ["30%", "50%"],
            avoidLabelOverlap: false,
            emphasis: {
              label: {
                show: true,
                fontSize: "30",
                fontWeight: "bold",
                formatter: ["{a|{d}%}"].join("\n"),
                rich: {
                  a: {
                    fontSize: 26,
                    lineHeight: 36,
                    color: "#05aaff",
                  },
                  b: {
                    color: "#a7a9c7",
                    fontSize: 18,
                    lineHeight: 24,
                    color: "#fff",
                  },
                },
              },
            },
            label: {
              show: false,
              position: "center",
              color: "rgba(13, 17, 29,0)",
            },
            labelLine: {
              show: false,
            },
            data: Data,
            level: 30,
          },
        ],
};

pie_bingtu.setOption(option);

//条形图
//var pie_age =echarts.init(document.getElementById("pie_age"),'macarons'); 
var pie_age =echarts.init(document.getElementById("pie_age"),'infographic'); 
option = {
   backgroundColor: 'rgba(2,34,49,0.9)',
    tooltip: {},
    grid: {
        left: '3%',
        right: '10%',
        bottom: '2%',
        top: '3%',
        containLabel: true,
    },
    xAxis: {
        type: 'value',
        // max:500,
        show: true,
        // 不显示轴线
         axisLine :{
            show:false
         },
         // 不显示刻度线
         axisTick:{
            show:false,
         },
        splitLine:{// 网格线为虚线
          show:false,
        },
        splitNumber: 4 ,
        axisLabel:{
          textStyle: {
          color: '#fff',   //x轴上的字体颜色
          fontSize:'14'    // x轴字体大小
          }
        }
    },
    yAxis: {
        type: 'category',
        inverse: true,
        splitLine: {
            show: false,
        },
        axisTick: {
            show: false,
        },
        axisLine: {
            show: false,
        },
        axisLabel: {
            interval: 0,
            color:'rgba(255, 255, 255, 1)',
            fontSize: 14
        },
        data: ['比亚迪', '特斯拉', '小鹏', '蔚来', '理想'],
    },
    series: [
        {
            name: '2021',
            type: 'bar',
            barWidth: 12,
            stack: 'stack',
            data: [160, 103, 155, 100, 50],
            // markPoint: {
            //     symbol: 'rect',
            //     symbolSize: [3, 12],
            //     itemStyle: {
            //         color: '#ffffff'
            //     },
            //     data: [
            //         { coord: [280, 0]},
            //         { coord: [170, 1]},
            //         { coord: [450, 2]},
            //         { coord: [300, 3]},
            //         { coord: [150, 4]},
            //     ]
            // }
        },
        {
            name: '2022',
            type: 'bar',
            barWidth: 12,
            stack: 'stack',
            data: [160, 103, 155, 100, 50],
        },
        {
            name: '2023',
            type: 'bar',
            barWidth: 12,
            stack: 'stack',
            data: [160, 103, 155, 100, 50],
        }
    ]
};
pie_age.setOption(option);


function ccc () {
  $.get('/viewdata').done(function(mydata) {
    alldata = mydata.data
  china_map.setOption({
            legend: {
              data: ['比亚迪','理想','特斯拉','蔚来','小鹏']
            },
            xAxis: [
              {
                data: alldata.line_data.line_name
              }
            ],
            series: [
              {
                name: '比亚迪',
                  data:  alldata.line_data.line_data1,
              },
              {
                name: '理想',
                data:  alldata.line_data.line_data2
              },
              {
                name: '特斯拉',
                data:alldata.line_data.line_data3
              },
              {
                name: '蔚来',
                data: alldata.line_data.line_data4
              },
              {
                name: '小鹏',
                data: alldata.line_data.line_data5
              }
            ]
          }); 
    pie_fanzui.setOption({
      series: [
          {
              data: convertData(alldata.map_data1),
          },
          {
              data: alldata.map_data1,
          },
      ],
  });
    pie_bingtu.setOption({
      legend: {
        formatter: function (name) {
          let data = alldata.pie_data1;
          // console.log(data, 'data')
          let total = 0;
          let tarValue;
          for (let i = 0; i < data.length; i++) {
            total += data[i].value;
            if (data[i].name == name) {
              tarValue = data[i].value;
            }
          }
          let v = tarValue;
          //计算出百分比
          return `${name}  ${v} `;
          //name是名称，v是数值
        },
      },
      series: [
        {
          data: alldata.pie_data1
        },
      ],
}); 
    pie_age.setOption({
       series: [
           {
               data: alldata.bar_data.bar_data1
           },
           {
               data: alldata.bar_data.bar_data2
           },
           {
               data: alldata.bar_data.bar_data3
           }
       ]
   });
  
})
}
setInterval(ccc(), 1000*5);

//时间选择器
var startV = '';
var endV = '';
laydate.skin('danlan');
var startTime = {
    elem: '#startTime',
    format: 'YYYY-MM-DD',
    min: '1997-01-01', //设定最小日期为当前日期
    max: laydate.now(), //最大日期
    istime: true,
    istoday: true,
    fixed: false,
    choose: function (datas) {
        startV = datas;
        endTime.min = datas; //开始日选好后，重置结束日的最小日期
    }
};
var endTime = {
    elem: '#endTime',
    format: 'YYYY-MM-DD',
    min: laydate.now(),
    max: laydate.now(),
    istime: true,
    istoday: true,
    fixed: false,
    choose: function (datas) {
        //        startTime.max = datas; //结束日选好后，重置开始日的最大日期
        endV = datas;
    }
};

laydate(startTime);
laydate(endTime);

//时间选择器
var startVs = '';
var endVs = '';
laydate.skin('danlan');
var startTimes = {
    elem: '#startTimes',
    format: 'YYYY-MM-DD',
    min: '1997-01-01', //设定最小日期为当前日期
    max: '2099-06-16', //最大日期
    istime: true,
    istoday: true,
    fixed: false,
    choose: function (datas) {
        startVs = datas;
        endTimes.min = datas; //开始日选好后，重置结束日的最小日期
        setQgData($('#barTypes').parent().parent(), 1);
    }
};
var endTimes = {
    elem: '#endTimes',
    format: 'YYYY-MM-DD',
    min: laydate.now(),
    max: laydate.now(),
    istime: true,
    istoday: true,
    fixed: false,
    choose: function (datas) {
        //        startTime.max = datas; //结束日选好后，重置开始日的最大日期
        endVs = datas;
        setQgData($('#barTypes').parent().parent(), 1);
    }
};

laydate(startTimes);
laydate(endTimes);




//更改日期插件的样式
function dateCss() {
    var arr = $('#laydate_box').attr('style').split(';');
    var cssStr =
        'position:absolute;right:0;';
    for (var i = 0; i < arr.length; i++) {
        if (arr[i].indexOf('top') != -1) {
            cssStr += arr[i];
        }
    }

    $('#laydate_box').attr('style', cssStr);
}


var workDate;
var time = {
    elem: '#times',
    format: 'YYYY-MM-DD',
    min: laydate.now(),
    max: laydate.now() + 30,
    istime: true,
    istoday: true,
    fixed: false,
    choose: function (datas) {
        //        startTime.max = datas; //结束日选好后，重置开始日的最大日期
        workDate = datas;
    }
};

laydate(time);



