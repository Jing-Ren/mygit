<!-- #include file="conn_db.asp" -->
<%
	guaranteeInfoID = CInt(request.QueryString("guaranteeInfoID"))
	Set rs = conn.Execute("select * from guaranteeInfo where guaranteeInfoID="&guaranteeInfoID)	
%>

<html>
<head>
	<meta charset="UTF-8">
	<title>更新调度调整原因信息</title>
</head>
<body>
<div>
<form method="post"action="chart_info(database).asp">
<table width="560px"heigth="350px"border="3"align="center"cellspacing="5px"cellpadding="5px"frame="box" rules="all">

	<caption align="top">调度调整原因分析</caption>
		<thead>
		<tr >
			<td hidden="true">ID </td >
			<td></td>
			<td >天气原因</td>
			<td >飞机调配</td>
			<td >计划原因</td>
			<td >机组原因</td>
			<td >行政调整</td>
			<td >其他</td>
		</tr>
		<tr>
			<td hidden="true"><input value="<%=rs("guaranteeInfoID")%>"></td>
			<td align="center" valign="center" >数量</td>
			<td><input type="text"name="weatherReason"value="<%=rs("weatherReason")%>"></td>
			<td><input type="text"name="flightChange"value="<%=rs("flightChange")%>"></td>
			<td><input type="text"name="planReason"value="<%=rs("planReason")%>"></td>
			<td><input type="text"name="aircrewReason"value="<%=rs("aircrewReason")%>"></td>
			<td><input type="text"name="administrativeChange"value="<%=rs("administrativeChange")%>"></td>
			<td><input type="text"name="otherReason"value="<%=rs("otherReason")%>"></td>
		</tr>
		
		</thead>
</table>

<br><br>
		<p align="center"><input type="submit" name="" value="更新"></p>
</form>
</div>

</body>
</html>