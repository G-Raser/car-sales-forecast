      var chartDom = document.getElementById("columnBar");
      var myChart = echarts.init(chartDom);
      var option;
      option = {
        color: "#288ce1",
        xAxis: {
          type: "category",
          data: [
            "机构1",
            "机构2",
            "机构3",
            "机构4",
            "机构5",
            "机构6",
            "机构7",
            "机构8",
            "机构9",
            "机构10",
            "机构11",
          ],
          axisLabel: {
            interval: 0,
            formatter: function (value) {
              //x轴的文字改为竖版显示
              var str = value.split("");
              return str.join("\n");
            },
            textStyle: {
              color: "#b7b7b7",
            },
          },
        },
        yAxis: {
          type: "value",
          show: false,
          axisLabel: {
            textStyle: {
              color: "#b7b7b7",
            },
          },
        },
        series: [
          {
            data: [
              120,
              200,
              150,
              80,
              70,
              110,
              130,
              120,
              200,
              150,
              80,
              70,
              110,
              130,
            ],
            type: "bar",
            showBackground: false, // 不显示图形背景
            backgroundStyle: {
              color: "rgba(180, 180, 180, 0.2)",
            },
            // 辅助线相关配置markLine
            markLine: {
              silent: true, //基线显示 隐藏
               symbol:'none',// 不显示箭头和圆点
              lineStyle: {
                normal: {
                  color: "red", // 这儿设置安全基线颜色
                },
              },

              data: [
                {
                  name: "标线1起点",
                  yAxis: 150, // 安全基线 1
                  label: {
                    formatter: "BBB",
                  },
                },
                {
                  name: "标线1终点",
                  yAxis: 100, // 安全基线 2
                  label: {
                    formatter: "AAA",
                  },
                },
              ],
            },
            label: {
              show: true, // 开启显示
              rotate: 0, // 旋转角度度
              position: "insideTop", // 在上方显示
              distance: 15, // 距离图形元素的距离。当 position 为字符描述值（如 'top'、'insideRight'）时候有效。
              verticalAlign: "middle",
              textStyle: {
                // 数值样式
                color: "#fff",
                fontSize: 12,
              },
            },
          },
        ],
      };
 option && myChart.setOption(option);
