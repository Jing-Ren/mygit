<!-- #include file="conn_db.asp" -->
<%
	caseType = request.queryString("caseType")
	set ca = conn.Execute("select * from caseLab where caseType='"&caseType&"'")
%>
<!DOCTYPE html>
<html >
<head>
	<meta charset="UTF-8">
	<title>案例库</title>
	<!--bootstrap信息引用-->
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/crs/bootstrap.min.crs">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!--bootstrap信息引用end-->
	<!-- 表格样式引用 -->
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- 表格样式引用end -->
</head>
<body>
<br>
<br>
<br>
<div align="center">
<div class="input-group"style="width:20%">
    <input type="text"width="100px" class="form-control input-lg">
	<span class="input-group-addon btn btn-primary">搜索</span>
</div>
</div>
<br>
<br>
<br>
<div align="center">
<div style="width:50%">
	<form method="post" action="caseInfo(db).asp">
		<table class="table table-striped"frame="hsides"border="1">
			<tr>	
					<td >时间</td>
					<td >案例类型</td>
					<td >详细描述</td>
					
			</tr>
			<%do while not ca.eof%>
			<tr>
					<td><%=ca("caseTime")%></td>
					<td><%=ca("caseType")%></td>
					<td><%=ca("caseDetail")%></td>
			</tr>
			<%ca.movenext
			loop%>
		</table>
		<br><br>
	</form>
	</div>
	</div>
</body>

</html>







