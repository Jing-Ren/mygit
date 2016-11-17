<!-- #include file="conn_db.asp" -->
<%
	pilotLevel = request.querystring("pilotLevel")
	
	Set ss = conn.Execute("select * from pilotInfo where pilotLevel='"&pilotLevel&"'")
%>
<!DOCTYPE html>
<html >
<head>
	<meta charset="UTF-8">
	<title>各类机长详细信息</title>
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
<br>
<button type="submit"><a href="pilotQual_Jovia.asp">返回上一级</a></button>
</div>
<br>
<br>
<div align="center">
<div style="width:20%">
	<form method="post" >
	
	<h4><%response.write pilotLevel%>详细信息</h4>
		<table class="table table-striped"frame="hsides"border="1">
			<tr>
					<td >员工编号</td>
					<td >姓名</td>
					
			</tr>
			<%do while not ss.eof%>
			<tr>	
					<td><%=ss("pilotID")%></td>
					<td><%=ss("pilotName")%></td>
			</tr>
			<%ss.movenext
			loop%>
		</table>
		<br><br>
	</form>
	</div>
	</div>
</body>

</html>







