<!-- #include file="conn_db.asp" -->

<%
	vipInfoID = CInt(request.QueryString("vipInfoID"))
	
	Set ss = conn.Execute("select * from vipInfo where vipInfoID="&vipInfoID )

%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>要客信息更新</title>
</head>
<body>
	<form method="post" action="vipUpdate(database).asp">
		<table width="560px"heigth="350px"border="3"align="center"cellspacing="5px"cellpadding="5px"frame="box" rules="all">
			<tr>
					<th width="100"hidden="true">ID</th>
					<th width="100">时间</th>
					<th width="100">要客姓名</th>
					<th width="100">职务</th>
					<th width="100">级别</th>
					<th width="100">航班号</th>
					<th width="100">保障名单</th>
			</tr>
			<tr>	
					<td hidden="true"><input type="text" name="vipInfoID" value="<%=ss("vipInfoID")%>"></td>
					<td><input type="text" name="vipTime" value="<%=ss("vipTime")%>"></td>
					<td><input type="text" name="vipName" value="<%=ss("vipName")%>"></td>
					<td><input type="text" name="vipDuty" value="<%=ss("vipDuty")%>"></td>
					<td><input type="text" name="vipTitle" value="<%=ss("vipTitle")%>"></td>
					<td><input type="text" name="flightNum" value="<%=ss("flightNum")%>"></td>
					<td><input type="text" name="guaranteeList" value="<%=ss("guaranteeList")%>"></td>
			</tr>
		</table>
				<p align="center"><input type="submit" name="" value="更新"></p>
	</form>
</body>

</html>
