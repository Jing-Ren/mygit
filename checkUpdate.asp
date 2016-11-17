<!-- #include file="conn_db.asp" -->
<%
	checkListID = CInt(request.QueryString("checkListID"))
	'response.write(typename(checkListID))
	Set ss = conn.Execute("select * from checkList where checkListID="&checkListID )
%>
<!DOCTYPE html>
<html >
<head>
	<meta charset="UTF-8">
	<title>飞行计划检查单更新</title>
	<!-- 表格样式引用 -->
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- 表格样式引用end -->
</head>
<body>
<div align="center">
<div style="width:60%">
	<form method="post" action="checkUpdate(db).asp">
		<table class="table table-striped"frame="hsides"border="1">
			<tr>
					<td width="100"hidden="true">ID</td>
					<td width="100">时间</td>
					<td width="100">项目</td>
					<td width="100">是否完成</td>
					<td width="100">备注</td>
			</tr>
			<tr>	
					<td hidden="true"><input type="text" name="checkListID" value="<%=ss("checkListID")%>"></td>
					<td><input type="text" name="checkTime" value="<%=ss("checkTime")%>"></td>
					<td><input type="text" name="checkProject" value="<%=ss("checkProject")%>"></td>
					<td>
					<select name="isFinish">
						<option value="完成"> 完成</option>
						<option value="未完成"> 未完成</option>
					</select>
					</td>
					<td><input type="text" name="remarks" value="<%=ss("remarks")%>"></td>
			</tr>
		</table>
		<br><br>
				<p align="center"><input type="submit" name="" value="更新"></p>
	</form>
	</div>
	</div>
</body>

</html>







