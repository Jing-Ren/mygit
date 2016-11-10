<!-- #include file="conn_db.asp" -->

<%
	localGuaranteeID = CInt(request.QueryString("localGuaranteeID"))
	
	Set ss = conn.Execute("select * from localGuarantee where localGuaranteeID="&localGuaranteeID )

%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>本场保障信息更新</title>
</head>
<body>
	<form method="post" action="localUpdate(database).asp">
		<table width="560px"heigth="350px"border="3"align="center"cellspacing="5px"cellpadding="5px"frame="box" rules="all">
			<tr>
					<th width="100"hidden="true">ID</th>
					<th width="100">本场类型</th>
					<th width="100">计划任务</th>
					<th width="100">已完成情况</th>
					<th width="100">未完成原因</th>
			</tr>
			<tr>	
					<td hidden="true"><input type="text" name="localGuaranteeID" value="<%=ss("localGuaranteeID")%>"></td>
					<td><input type="text" name="localType" value="<%=ss("localType")%>"></td>
					<td><input type="text" name="localPlan" value="<%=ss("localPlan")%>"></td>
					<td><input type="text" name="performance" value="<%=ss("performance")%>"></td>
					<td><input type="text" name="unfinishReason" value="<%=ss("unfinishReason")%>"></td>
			
			</tr>
		</table>
		<br><br>
				<p align="center"><input type="submit" name="" value="更新"></p>
	</form>
</body>

</html>
