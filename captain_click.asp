<!-- #include file="conn_db.asp" -->
<!-- 下面六条语句为从数据库的pilotInfo表中查询相应资质分类的机长总数 -->
<%
	set c1=conn.Execute("select * from pilotInfo where pilotLevel='一类机长'")
	Set c2=conn.Execute("select * from pilotInfo where pilotLevel='二类机长'")
	Set c3=conn.Execute("select * from pilotInfo where pilotLevel='三类机长'")
	Set c4=conn.Execute("select * from pilotInfo where pilotLevel='四类机长'")
	Set c5=conn.Execute("select * from pilotInfo where pilotLevel='五类机长'")
	Set c6=conn.Execute("select * from pilotInfo where pilotLevel='六类机长'")
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>各类机长详细信息</title>
	<!-- 表格样式引用 -->
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- 表格样式引用end -->
</head>
<body>
<div>
	<div>
	<table class="table table-striped"border="1"frame="hsides">
	<thead>
		<tr>
			<td>员工编号</td>
			<td>姓名</td>
		</tr>
		<tr>
			<td></td>
			<td>姓名</td>
		</tr>
		
	<thead>
	</table>
	</div>
</div>
</body>
</html>