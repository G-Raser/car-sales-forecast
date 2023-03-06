function fnW(str) {
    var num;
    str >= 10 ? num = str : num = "0" + str;
    return num;
}

//预测折线图
//var china_map =echarts.init(document.getElementById("china_map"),'macarons'); 
var china_map =echarts.init(document.getElementById("china_map"),'infographic'); 
//var china_map =echarts.init(document.getElementById("china_map"),'shine'); 


// function randomData() {
// 		return Math.round(Math.random()*500);
// 	}
//
// 	var mydata = [
// 		{name: '北京',value: '110145台' },{name: '天津',value: randomData() },
// 		{name: '上海',value: '122235台' },{name: '重庆',value: randomData() },
// 		{name: '河北',value: randomData() },{name: '河南',value: '68016台' },
// 		{name: '云南',value: randomData() },{name: '辽宁',value: randomData() },
// 		{name: '黑龙江',value: randomData() },{name: '湖南',value: randomData()},
// 		{name: '安徽',value: '84129台' },{name: '山东',value: '89965台' },
// 		{name: '新疆',value: randomData() },{name: '江苏',value: '129677台' },
// 		{name: '浙江',value: '125918台' },{name: '江西',value: randomData() },
// 		{name: '湖北',value: '101163台' },{name: '广西',value: randomData() },
// 		{name: '甘肃',value: randomData() },{name: '山西',value: randomData() },
// 		{name: '内蒙古',value: randomData() },{name: '陕西',value: randomData()},
// 		{name: '吉林',value: randomData() },{name: '福建',value: '67299台' },
// 		{name: '贵州',value: randomData() },{name: '广东',value: '382960台' },
// 		{name: '青海',value: randomData() },{name: '西藏',value: randomData() },
// 		{name: '四川',value: randomData() },{name: '宁夏',value: randomData() },
// 		{name: '海南',value: randomData() },{name: '台湾',value: randomData() },
// 		{name: '香港',value: randomData() },{name: '澳门',value: randomData() }
// 	];
//
// 	var option = {
// 		//backgroundColor: '#FFFFFF',
//
// 		title: {
// 			text: '新能源汽车充电桩地区分布',
// 			textStyle:{color:'#fff'},
// 			//subtext: '纯属虚构',
// 			x:'center'
// 		},
// 		tooltip : {
// 			trigger: 'item'
// 		},
// 		visualMap: {
// 			show : false,
// 			x: 'left',
// 			y: 'bottom',
// 			//layoutCenter:['30%','30%'],
// 			splitList: [
// 				{start: 500, end:600},{start: 400, end: 500},
// 				{start: 300, end: 400},{start: 200, end: 300},
// 				{start: 100, end: 200},{start: 0, end: 100},
// 			],
// 			color: ['#ff0', '#ffff00', '#0E94EB','#6FBCF0', '#F0F06F', '#00CC00']
// 		},
// 		series: [{
// 			name: '新能源汽车充电桩地区分布',
// 			type: 'map',
// 			mapType: 'china',
// 			roam: true,
// 			label: {
// 				normal: {
// 					show: false
// 				},
// 				emphasis: {
// 					show: false
// 				}
// 			},
// 			data:mydata
// 		}]
// 	};
option = {
  title: {
    text: 'Stacked Area Chart'
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
      data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
    }
  ],
  yAxis: [
    {
      type: 'value'
    }
  ],
  series: [
    {
      name: 'Email',
      type: 'line',
      stack: 'Total',
      areaStyle: {},
      emphasis: {
        focus: 'series'
      },
      data: [120, 132, 101, 134, 90, 230, 210]
    },
    {
      name: 'Union Ads',
      type: 'line',
      stack: 'Total',
      areaStyle: {},
      emphasis: {
        focus: 'series'
      },
      data: [220, 182, 191, 234, 290, 330, 310]
    },
    {
      name: 'Video Ads',
      type: 'line',
      stack: 'Total',
      areaStyle: {},
      emphasis: {
        focus: 'series'
      },
      data: [150, 232, 201, 154, 190, 330, 410]
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
        show: true,
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


//违法犯罪人员分析占比，带边框效果的饼图
//var pie_fanzui =echarts.init(document.getElementById("pie_fanzui"),'macarons');


//充电桩地区分布图地图
var pie_fanzui =echarts.init(document.getElementById("pie_fanzui"),'infographic');
// option = {
//     title : {
//         x:'center'
//     },
//     tooltip : {
//         trigger: 'item',
//         formatter: "{a} <br/>{b} : {c} ({d}%)"
//     },
//     legend: {
//         orient: 'vertical',
//         left: 'left',
//         data: ['比亚迪','理想','特斯拉','蔚来','小鹏'],
//         textStyle: {color: '#fff'}
//     },
//
// 	label: {
// 	     normal: {
// 	          textStyle: {
// 	                color: 'red'  // 改变标示文字的颜色
// 	          }
// 	     }
// 	},
//     series : [
//         {
//             name: '新能源汽车类型分析',
//             type: 'pie',
//             radius : '55%',
//             center: ['50%', '60%'],
//             data:[
//                 {value:335, name:'比亚迪'},
//                 {value:310, name:'理想'},
//                 {value:234, name:'特斯拉'},
//                 {value:135, name:'蔚来'},
//                 {value:1548, name:'小鹏'}
//             ],
//
//             itemStyle: {
//                 emphasis: {
//                     shadowBlur: 10,
//                     shadowOffsetX: 0,
//
//                     shadowColor: 'rgba(0, 0, 0, 0.5)'
//                 }
//             }
//
//         }
//     ]
// };
var data = [
    {
        name: '充电桩地区分布图',
        value: ['116.489356', '39.94083'],
        date: '2022-10-01',
        city: '北京市',
    },
];
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
        trigger: 'item',
        triggerOn: 'click',
        padding: 0,
        enterable: true,
        transitionDuration: 1,
        textStyle: {
            color: '#000',
            decoration: 'none',
        },
        formatter: function (params) {
            console.log(params);
            const { data } = params;
            const type = data.type;
            let typeName = '数据中心';
            const tipHtml = ` <div style="width: 280px; background: rgba(22, 80, 158, 0.8); border: 1px solid rgba(7, 166, 255, 0.7);">
                                <div style="color: #fff; padding: 10px; font-size: 16px; border-bottom: 2px solid #0c8bdd;">${data.name}</div>
                                <p style="color: #fff;padding: 5px 10px;font-size: 14px;">建设位置：${data.city}</p>
                                <p style="color: #fff;padding: 5px 10px;font-size: 14px;">建设时间：${data.date}</p>
                                <p style="color: #fff;padding: 5px 10px;font-size: 14px;">设施类型：${typeName}</p>
                              </div>`;
            return tipHtml;
        },
    },
    visualMap: {
        show: true,
        min: 0,
        max: 200,
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
// echarts.on('click', (params) => {
//     if (params.componentType === 'series' && params.componentSubType === 'scatter') {
//         const index = params.dataIndex;
//         // 取消所有散点高亮
//         echarts.dispatchAction({
//             type: 'downplay',
//             seriesIndex: 0, //第几条series
//         });
//         // 显示指定data 的tooltip
//         // myChart.dispatchAction({
//         //     type: 'showTip',
//         //     seriesIndex: 0, //第几条series
//         //     dataIndex: index, //第几个tooltip
//         // });
//         // 高亮指定的散点
//         echarts.dispatchAction({
//             type: 'highlight',
//             seriesIndex: 0, //第几条series
//             dataIndex: index, //第几个tooltip
//         });
//     }
// });
pie_fanzui.setOption(option);
//----------------------违法犯罪人员分析占比end---------------

//-----------------饼图-----------------

var pie_bingtu =echarts.init(document.getElementById("pie_bingtu"),'infographic');
var Data = [
        {
          value: 46,
          name: "新兴产业片区",
        },
        {
          value: 32,
          name: "先进智造片区",
        },
        {
          value: 34,
          name: "综合产业片区",
        },
        {
          value: 38,
          name: "滴水湖核心片区",
        },
        {
          value: 57,
          name: "浦东国际机场片区",
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

      // myChart.clear();
      // 设置实例参数
      // myChart.setOption(option);

      // let index = 0; //默认选中第二个
      // echarts.dispatchAction({
      //   type: "highlight",
      //   seriesIndex: 0,
      //   dataIndex: index, //默认选中第二个
      // });
      // echarts.on("mouseover", function (e) {
      //   if (e.dataIndex != index) {
      //     echarts.dispatchAction({
      //       type: "downplay",
      //       seriesIndex: 0,
      //       dataIndex: index,
      //     });
      //   }
      // });
      // echarts.on("mouseout", function (e) {
      //   index = e.dataIndex;
      //   echarts.dispatchAction({
      //     type: "highlight",
      //     seriesIndex: 0,
      //     dataIndex: e.dataIndex,
      //   });
      // });
pie_bingtu.setOption(option);

//条形图
//var pie_age =echarts.init(document.getElementById("pie_age"),'macarons'); 
var pie_age =echarts.init(document.getElementById("pie_age"),'infographic'); 
//var pie_age =echarts.init(document.getElementById("pie_age"),'shine'); 
// option = {
//     tooltip: {
//         trigger: 'item',
//         formatter: "{a} <br/>{b}: {c} ({d}%)"
//     },
//     legend: {
//         orient: 'vertical',
//         x: 'left',
//         data:['18-30','31-40','41-50','51-60','65岁以上','未标明'],
//         textStyle: {color: '#fff'}
//     },
//     series: [
//         {
//             name:'汽车购买人年龄分布',
//             type:'pie',
//             radius: ['30%', '55%'],
//             avoidLabelOverlap: false,
//             label: {
//                 normal: {
//                     show: false,
//                     position: 'center'
//                 },
//                 emphasis: {
//                     show: true,
//                     textStyle: {
//                         fontSize: '20',
//                         fontWeight: 'bold'
//                     }
//                 }
//             },
//             labelLine: {
//                 normal: {
//                     show: false
//                 }
//             },
//             data:[
//                 {value:335, name:'18-30'},
//                 {value:310, name:'31-40'},
//                 {value:234, name:'41-50'},
//                 {value:135, name:'51-60'},
//                 {value:135, name:'65岁以上'},
//                 {value:1548, name:'未标明'}
//             ]
//         }
//     ]
// };
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
        max:500,
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
        // axisLabel:{
        //     formatter:'{value}%'
        // }
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
        data: ['大米', '花生', '草莓', '玉米', '杭白'],
    },
    series: [
        {
            name: '系列一',
            type: 'bar',
            barWidth: 12,
            stack: 'stack',
            data: [160, 103, 155, 100, 50],
            markPoint: {
                symbol: 'rect',
                symbolSize: [3, 12],
                itemStyle: {
                    color: '#ffffff'
                },
                data: [
                    { coord: [280, 0]},
                    { coord: [170, 1]},
                    { coord: [450, 2]},
                    { coord: [300, 3]},
                    { coord: [150, 4]},
                ]
            }
        },
        {
            name: '系列二',
            type: 'bar',
            barWidth: 12,
            stack: 'stack',
            data: [160, 103, 155, 100, 50],
        },
        {
            name: '系列三',
            type: 'bar',
            barWidth: 12,
            stack: 'stack',
            data: [160, 103, 155, 100, 50],
        }
    ]
};
pie_age.setOption(option);
//----------------------违法犯罪人员年龄分析占比end---------------



//===================人口出入时间段统计=======================
//var line_time =echarts.init(document.getElementById("line_time"),'shine'); 
// var line_time =echarts.init(document.getElementById("line_time"),'macarons');
//var line_time =echarts.init(document.getElementById("line_time"),'infographic'); 
// var option = {
//         // 给echarts图设置背景色
//         //backgroundColor: '#FBFBFB',  // -----------> // 给echarts图设置背景色
//         color: ['#7FFF00'],
//         tooltip: {
//             trigger: 'axis'
//         },
//
// 		grid:{
//                     x:40,
//                     y:30,
//                     x2:5,
//                     y2:20
//
//                 },
//         calculable: true,
//
//
//         xAxis: [{
//              type: 'category',
//         data: ['6:00-9:00', '10:00-12:00', '13:00-15:00', '16:00-20:00', '21:00-24:00'],
//      axisLabel: {
// 			color: "#7FFF00" //刻度线标签颜色
// 			}
//         }],
//         yAxis: [{
//
//             type: 'value',
//             axisLabel: {
// 			color: "#7FFF00" //刻度线标签颜色
// 			}
//         }],
//         series: [{
//             name: '辆',
//             type: 'line',
//             data: [800, 300, 500, 800, 300, 600],
//
//         }]
//     };
//
//
// line_time.setOption(option);


//=========违法犯罪人员地区分布开始=======================
//var qufenbu_data =echarts.init(document.getElementById("qufenbu_data"),'shine'); 
//var qufenbu_data =echarts.init(document.getElementById("qufenbu_data"),'macarons'); 
// var qufenbu_data =echarts.init(document.getElementById("qufenbu_data"),'infographic');
// option = {
//     color: ['#FADB71'],
//     tooltip : {
//         trigger: 'axis',
//         axisPointer : {            // 坐标轴指示器，坐标轴触发有效
//             type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
//         }
//     },
//     grid: {
//         x:30,
//         y:10,
//         x2:15,
//         y2:20
//     },
//     xAxis : [
//         {
//             type : 'category',
//             data : ['河北', '天津', '北京', '新疆', '内蒙', '宁夏', '海南'],
//             axisTick: {
//                 alignWithLabel: true
//             },
//             axisLabel: {
// 			color: "#FADB71" //刻度线标签颜色
// 			}
//         }
//     ],
//     yAxis : [
//         {
//             type : 'value',
//             axisLabel: {
// 			color: "#FADB71" //刻度线标签颜色
// 			}
//         }
//     ],
//     series : [
//         {
//             name:'地区分布',
//             type:'bar',
//             barWidth: '60%',
//             data:[10, 52, 200, 334, 390, 330, 220]
//         }
//     ]
// };
//
// qufenbu_data.setOption(option);
//=========违法犯罪人员地区分布结束=======================


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



