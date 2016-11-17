<!-- #include file="conn_db.asp" -->
<%
	guaranteeInfoID = CInt(request.QueryString("guaranteeInfoID"))
	Set rs = conn.Execute("select * from guaranteeInfo where guaranteeInfoID="&guaranteeInfoID)	
%>

<html>
<head>
	<meta charset="UTF-8">
	<title>更新调度调整原因信息</title>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div align="center">
<div style="width:60%;">
<form method="post"action="chart_info(database).asp">
<table class="table table-striped"frame="hsides"border="1"style="width:60%;">
	<caption align="top">调度</caption>
		<tr align="center"width="100">
			<td hidden="true">ID </td >
			<td></td>
			<td >天气原因</td>
			<td >飞机调配</td>
			<td >计划原因</td>
			<td >机组原因</td>
			<td >行政调整</td>
			<td >其他</td>
		</tr>
		<tr align="center"width="100">
			<td hidden="true"><input value="<%=rs("guaranteeInfoID")%>"></td>
			<td >数量</td>
			<td><input type="text"name="weatherReason"value="<%=rs("weatherReason")%>"></td>
			<td><input type="text"name="flightChange"value="<%=rs("flightChange")%>"></td>
			<td><input type="text"name="planReason"value="<%=rs("planReason")%>"></td>
			<td><input type="text"name="aircrewReason"value="<%=rs("aircrewReason")%>"></td>
			<td><input type="text"name="administrativeChange"value="<%=rs("administrativeChange")%>"></td>
			<td><input type="text"name="otherReason"value="<%=rs("otherReason")%>"></td>
		</tr>
</table>
<br>
<p align="center"><input type="submit" name="" value="更新"></p>
</form>
</div>
</div>

</body>
</html>