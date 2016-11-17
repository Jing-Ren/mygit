<!-- #include file="conn_db.asp" -->
<%
	Set rs = conn.Execute("select * from guaranteeInfo")
	Set plan1 = conn.Execute("select * from pilotMonthPlan where ID=1")
	Set plan2 = conn.Execute("select * from pilotMonthPlan where ID=2")
	Set plan3 = conn.Execute("select * from pilotMonthPlan where ID=3")
	Set plan4 = conn.Execute("select * from pilotMonthPlan where ID=4")
	Set op = conn.Execute("select * from flightOperation")
	Set ch = conn.Execute("select * from checkList")
	Set tip6 = conn.Execute("select * from tipInfo where tipInfoID=6")
	Set ca = conn.Execute("select * from caseLab")
	Set ca1 = conn.Execute("select * from caseLab where caseType=''")
	
	
	
%>
<%

	Set per1 = conn.Execute("select count(*) as num1 from checkList where isFinish='完成'")
	Set per2 = conn.Execute("select count(*) as num2 from checkList where isFinish='未完成'")
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"> 
<title>生产信息调度</title>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
 	<h1 align="center">生产信息调度</h1>
	<ul id="myTab" class="nav nav-tabs">
		<li class="active"><a href="#dispatch" data-toggle="tab">调度调整原因分析</a></li>
		<li><a href="#case" data-toggle="tab">案例库</a></li>
		<li><a href="#month" data-toggle="tab">飞行员月计划汇总表</a></li>
		<li><a href="#operation" data-toggle="tab">航班运行情况汇总表</a></li>
		<li><a href="#check" data-toggle="tab">飞行计划编排检查单</a></li>	
	</ul>
<br>
<br>
<br>
<!-- 饼状图表示 -->	
<div id="myTabContent" class="tab-content">
<div id="dispatch" class="tab-pane fade in active"align="center">
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
                	        text: '调度调整原因分析',
                	        subtext: '以月为单位',
                	        x:'center'
                	    },
                	    tooltip : {
                	        trigger: 'item',
                	        formatter: "{a} <br/>{b} : {c} ({d}%)"
                	    },
                	    legend: {
                	        orient : 'vertical',
                	        x : 'left',
                	        data:['天气原因','飞机调配','计划原因','机组原因','行政调整','其他']
                	    },
                	    calculable : true,
                	    series : [
                	        {
                	            type:'pie',
                	            radius : '55%',
                	            center: ['50%', '60%'],
                	            data:[
                	                {value:<%=rs("weatherReason")%>, name:'天气原因'},
                	                {value:<%=rs("flightChange")%>, name:'飞机调配'},
                	                {value:<%=rs("planReason")%>, name:'计划原因'},
                	                {value:<%=rs("aircrewReason")%>, name:'机组原因'},
                	                {value:<%=rs("administrativeChange")%>, name:'行政调整'},
                	                {value:<%=rs("otherReason")%>, name:'其他'}
                	            ]
                	        }
                	    ]
                	};
        
                // 为echarts对象加载数据 
                myChart.setOption(option); 
				myChart.on('click', function (params) {
				var caseType = params.name
				window.open("caseInfo.asp?caseType=" + caseType);
				<!-- window.open('https://www.baidu.com/s?wd=' + encodeURIComponent(params.name));-->
				});	
            }
        );
    </script>

<div id="div1" style="width: 40%;height:400px;float:right"valign="15">
<form method="post"action="infotipUpdate.asp">
	提示信息：<br>
	<textarea style="width: 80%;height:260px;"type="text"border="3px"name="tipDetail">
	<%=tip6("tipDetail")%>
	</textarea>
	<br>
	<button type="submit">保存</button>
</form>
</div>
<button><a href="chart_info.asp?guaranteeInfoID=<%=rs("guaranteeInfoID")%>">更新</a></button>
</div>
    <!-- 饼状图表示-end -->
</div>

<!-- 案例库start  -->
<div id="case" class="tab-pane fade active"align="center">
<div style="width: 60%;">
<table class="table table-striped">
<form>
	<caption align="top">案例库<br></caption>
		<tr>		
			<td hidden="true"></td>
			<td >时间</td>
			<td>案例类型</td>
			<td>详细内容</td>
			<td>操作</td>
		</tr>
		<% do while not ca.eof%>
		<tr> 
			<td hidden="true"><%=ca("caseLabID")%></td>
			<td><%=ca("caseTime")%></td>
			<td><%=ca("caseType")%></td>
			<td><%=ca("caseDetail")%></td>		
			<td><a href="caseUpdate.asp?caseLabID=<%=ca("caseLabID")%>">更新</a> <a href="caseDelete(db).asp?caseLabID=<%=ca("caseLabID")%>">删除</a></td>			
		</tr>
		<% ca.movenext 
		loop%>
</form>
</table>
	<div align="center">
	<br><br>
		<button ><a href="caseInsert.html"target="_top"> 添加新案例</a></button>
		
	</div>
</div>	


</div>
<!-- 案例库end -->

<!-- 飞行员月计划情况表start -->
<div id="month"class="tab-pane fade active"align="center">
	<div style="width: 40%;">
	<table class="table table-striped">

		<caption align="top">飞行员月计划情况表</caption>
<form>
		<thead>
		<tr>
			<tr>
			<td rowspan="4"width="150px">月平均小时 <br> (单位：小时/月)</td>
			</tr>
			<tr>
			<td width="150px">国内机长</td>
			<td width="150px"><%=plan1("localCaptain")%></td>
			</tr>
			<tr>
			<td >外籍机长</td>
			<td ><%=plan1("foreignCaptain")%></td>
			</tr>
			<tr>
			<td >一副</td>
			<td ><%=plan1("copilot")%></td>
			</tr>
		</tr>
		<tr>
		    <tr>
			<td rowspan="4">月平均出勤天数 <br> (单位：天/月)</td>
			</tr>
			<tr>
			<td >国内机长</td>
			<td ><%=plan2("localCaptain")%></td>
			</tr>
			<tr>
			<td >外籍机长</td>
			<td ><%=plan2("foreignCaptain")%></td>
			</tr>
			<tr>
			<td>一副</td>
			<td><%=plan2("copilot")%></td>
			</tr>
		</tr>
		<tr>
			<tr>
			<td rowspan="4">月平均过夜天数 <br> (单位：天/月)</td>
			</tr>
			<tr>
			<td >国内机长</td>
			<td ><%=plan3("localCaptain")%></td>
			</tr>
			<tr>
			<td >外籍机长</td>
			<td><%=plan3("foreignCaptain")%></td>
			</tr>
			<tr>
			<td >一副</td>
			<td ><%=plan3("copilot")%></td>
			</tr>
		</tr>
		<tr>
			<tr>
			<td rowspan="4">平均日出勤小时 <br> (单位：小时/月)</td>
			</tr>
			<tr>
			<td >国内机长</td>
			<td ><%=plan4("localCaptain")%></td>
			</tr>
			<tr>
			<td >外籍机长</td>
			<td ><%=plan4("foreignCaptain")%></td>
			</tr>
			<tr>
			<td >一副</td>
			<td ><%=plan4("copilot")%></td>
			</tr>
		</tr>
		<tr>
		<td></td>
		<td></td>
		<td><button><a href="momthUpdate.asp">更新</a></button></td>
		</tr>
		</thead>
</form>		
</table>
</div>
</div>
<br>
<br>
<br>
<br>
<!--飞行员月计划情况表end  -->
<!-- 航班运行情况表start  -->
<div id="operation" class="tab-pane fade active"align="center">
<div style="width: 60%;">
<table class="table table-striped">
<form>
	<caption align="top">航班运行情况表 <br></caption>
		<tr>		
			<td >保障时间</td>
			<td>保障航班量</td>
			<td>飞机日利用率</td>
			<td>备降次数</td>
			<td>飞行部原因延误航班数 </td>
			<td >操作</td>
		</tr>
		<% do while not op.eof%>
		<tr> 
			<td><%=op("flightTime")%></td>
			<td><%=op("flightCount")%></td>
			<td><%=op("flightUsage")%></td>		
			<td><%=op("diversionNum")%></td>		
			<td><%=op("flight_DelayNum")%></td>	
			<td><a href="opUpdate.asp?flightOperationID=<%=op("flightOperationID")%>">更新</a> <a href="operationDelete.asp?flightOperationID=<%=op("flightOperationID")%>">删除</a></td>			
		</tr>
		<% op.movenext 
		loop%>
</form>
</table>
	<div align="center">
	<br><br>
		<button ><a href="operationInsert.html"target="_top"> 添加运行情况</a></button>
		
	</div>
</div>	


</div>
<!-- 航班运行情况表end -->

<!-- 检查单 -->
<div id="check" class="tab-pane fade active"align="center">
<div style="width:60%">
<!--进度条-->

<div class="progress">
<script>
	$(function(){
		$("#jingdu").css("height",<%=per1("num1")%>*10)
	})
</script>
  <div class="progress-bar"id="jingdu" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"style="width:60%;height:5px" >
	
  </div>
</div>
<!--进度条end-->
<br>
<br>
<br>
<form name="plan"method="post"action="checkUpdate.asp">
<table class="table table-striped"frame="hsides"border="1">
	<tr align="center">
		<td hidden="true">编号</td>
		<td>时间</td>
		<td>项目</td>
		<td>是否完成</td>
		<td>备注</td>
		<td>操作</td>
	</tr>
	<%do while not ch.eof%>
	<tr align="center">
		<td hidden="true"name="checkListID"><%=ch("checkListID")%></td>
		<td width="100"name="checkTime"><%=ch("checkTime")%></td>
		<td width="320"name="checkProject"><%=ch("checkProject")%></td>
		<td width="100"name="isFinish"><%=ch("isFinish")%></td>
		<!--
		<td>
		<select name="isFinish">
			<option value="完成"> 完成</option>
			<option value="未完成"> 未完成</option>
        </select>	
		</td>
		-->
		<td name="remarks"><%=ch("remarks")%></td>
		<td><button type="submit"><a href="checkUpdate.asp?checkListID=<%=ch("checkListID")%>" target="_blank">更新</a></button></td>
	</tr>
	<% ch.movenext
	loop%>
<table>
</form>
<script language="javascript">
function show(){
	plan.select_text.value = plan.test.options[]
}

</script>



<!-- 检查单end -->
</div>
</body>
</html>