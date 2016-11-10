<!-- #include file="conn_db.asp" -->
<%

set r1=conn.Execute("select count(*) as num1 from pilotInfo where pilotLevel='一类机长'")
Set r2=conn.Execute("select count(*) as num2 from pilotInfo where pilotLevel='二类机长'")
Set r3=conn.Execute("select count(*) as num3 from pilotInfo where pilotLevel='三类机长'")
Set r4=conn.Execute("select count(*) as num4 from pilotInfo where pilotLevel='四类机长'")
Set r5=conn.Execute("select count(*) as num5 from pilotInfo where pilotLevel='五类机长'")
Set r6=conn.Execute("select count(*) as num6 from pilotInfo where pilotLevel='六类机长'")


set s1 = conn.execute("select * from pilotMatch where ID=1")
set s2 = conn.execute("select * from pilotMatch where ID=2")
set s3 = conn.execute("select * from pilotMatch where ID=3")
set s4 = conn.execute("select * from pilotMatch where ID=4")
set s5 = conn.execute("select * from pilotMatch where ID=5")
set s6 = conn.execute("select * from pilotMatch where ID=6")


set rs = conn.execute("select * from pilotInfo where otherLimit is not null")
Set tip5 = conn.Execute("select * from tipInfo where tipInfoID=5")


%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"> 
	<title>飞行员资质管理</title>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
</head>
<body>
 	<h1 align="center">飞行员资质管理</h1>
	<ul id="myTab" class="nav nav-tabs">
		<li class="active"><a href="#mypie" data-toggle="tab">飞行员资质管理</a></li>
		<li><a href="#captaintype" data-toggle="tab">机长分类情况</a></li>
		<li><a href="#limit" data-toggle="tab">特殊限制</a></li>
	</ul>
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
            }
        );
    </script>

<div id="div1" style="width: 40%;height:400px;float:right"valign="15">
<form method="post"action="pilotTipUpdate.asp">
	提示信息：<br>
	<textarea style="width: 80%;height:260px;"type="text"border="3px"name="tipDetail">
	<%=tip5("tipDetail")%>
	</textarea>
	<br>
	<button type="submit">保存</button>
</form>
</div>
</div>


    <!-- 饼状图表示-end -->
</div>
<!--机长分类情况表start -->
<div id="captaintype"class="tab-pane fade active"align="center">
	<div style="width: 60%">
	<table class="table table-striped"border="1"frame="hsides">
	<form>
	<font size="4">机长分类情况    </font>	<br>
		<font>更新时间：<%=date()%></font>
		<tr align="center">
			<td>类别</td>
			<td>数量（/人）</td>
			<td>搭配限制</td>
			<td>机场限制</td>
			<td>备注</td>
		</tr>
		<tr align="center">
			<td  >一类机长</td>
			<td ><%=r1("num1") %></td>
			<td ><%=s1("matchLimit") %></td>
			<td ><%=s1("airportLimit")%></td>
			<td ><%=s1("remarks")%></td>
			
		</tr>
		<tr align="center">
			<td  >二类机长</td>
			<td><%=r2("num2") %></td>
			<td><%=s2("matchLimit") %></td>
			<td><%=s2("airportLimit")%></td>
			<td><%=s2("remarks")%></td>
			
		</tr>
		<tr align="center">
			<td >三类机长</td>
			<td><%=r3("num3") %></td>
			<td><%=s3("matchLimit") %></td>
			<td><%=s3("airportLimit")%></td>
			<td><%=s3("remarks")%></td>
			
		</tr>
		<tr align="center">
			<td  >四类机长</td>
			<td><%=r4("num4") %></td>
			<td><%=s4("matchLimit") %></td>
			<td><%=s4("airportLimit")%></td>
			<td><%=s4("remarks")%></td>
			
		</tr>
		<tr align="center">
			<td >五类机长</td>
			<td><%=r5("num5") %></td>
			<td><%=s5("matchLimit") %></td>
			<td><%=s5("airportLimit")%></td>
			<td><%=s5("remarks")%></td>
			
		</tr>
		<tr align="center">
			<td >六类机长</td>
			<td><%=r6("num6") %></td>
			<td><%=s6("matchLimit") %></td>
			<td><%=s6("airportLimit")%></td>
			<td><%=s6("remarks")%></td>
			
		</tr>
	
	</form>
	</table>
	</div>
	<br>
	<div style="width: 10%;">
		<button><a href="pilotInfo.asp" target="_blank">详细信息</a></button>
		<button><a href="pilotQualUpdate.asp" target="_blank">更新</a></button>
	</div>
</div>

<!-- 机长分类情况表end -->
<!-- 特殊限制表start -->
<div id="limit"class="tab-pane fade active"align="center">
    <div style="width: 60%;">
	<table class="table table-striped"frame="hsides">
	<caption >特殊限制</caption>
	<br>
	<form>
	<thead>
		<tr align="center">
			<td>姓名</td>
			<td>其他特殊限制</td>
			<td>限制原因</td>
		
		</tr>
		<% do while not rs.eof%>
		<tr align="center">
			<td ><%=rs("pilotName")%></td>
			<td ><%=rs("otherLimit")%></td>
			<td ><%=rs("limitReason")%></td>		
		</tr>
		<% rs.movenext 
		loop%>
	</thead>
	</form>
	</table>
	</div>
	

</div>


<!-- 特殊限制表end -->

</div>
</body>
</html>