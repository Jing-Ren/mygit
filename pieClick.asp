
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>饼状图click事件</title>
</head>
<body>
<!-- 饼状图表示 -->	
<div id="myTabContent" class="tab-content">
<br>
<br>

<br>
<div id="mypie" class="tab-pane fade in active"align="center">
	<div id="div1" style="width: 60%;" > 
    <div id="sf" style="width: 60%;height:400px;float:left"></div>
    
    <!-- ECharts单文件引入 -->
    <script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
    <script type="text/javascript">
        // 路径配置
        require.config({
            paths: {
                echarts: 'http://echarts.baidu.com/build/dist'
            }
        });
        
        // 使用
        require(
            [
                'echarts',
                'echarts/chart/pie' // pie为饼状图
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('sf')); 
                
                var option = {
                	    title : {
                	        text: '飞行员资质管理',
                	        subtext: '截至<%=date()%>',
                	        x:'center'
                	    },
                	    tooltip : {
                	        trigger: 'item',
                	        formatter: "{a} <br/>{b} : {c} ({d}%)"
                	    },
                	    legend: {
                	        orient : 'vertical',
                	        x : 'left',
                	        data:['一类机长','二类机长','三类机长','四类机长','五类机长','六类机长']
                	    },
						 toolbox: {
							show : true,
							feature : {
								
								dataView : {show: true, readOnly: false},
								magicType : {
									show: true, 
									type: ['pie', 'funnel'],
									option: {
										funnel: {
											x: '25%',
											width: '50%',
											funnelAlign: 'left',
											max: 1548
										}
									}
								},
								restore : {show: true},
								saveAsImage : {show: true}
							}
						},
                	    calculable : true,
                	    series : [
                	        {
                	            type:'pie',
                	            radius : '55%',
                	            center: ['50%', '60%'],
                	            data :[
                	                {value:<%=r1("num1") %>, name:'一类机长'},
                	                {value:<%=r2("num2") %>, name:'二类机长'},
                	                {value:<%=r3("num3") %>, name:'三类机长'},
                	                {value:<%=r4("num4") %>, name:'四类机长'},
                	                {value:<%=r5("num5") %>, name:'五类机长'},
                	                {value:<%=r6("num6") %>, name:'六类机长'}
                	            ]
                	        }
                	    ]
                	};
				
                // 为echarts对象加载数据 
                myChart.setOption(option); 
				// 处理点击事件并且跳转到相应的百度搜索页面
				myChart.on('click', function (params) {
					window.open('levelInfo.asp?pilotLevel=' + encodeURIComponent(params.name));-->
				});	
				
            }
        );
    </script>

</div>

<!-- 饼状图表示-end -->
</div>

</body>
</html>