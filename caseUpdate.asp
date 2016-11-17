<!-- #include file="conn_db.asp" -->
<%		
	caseLabID = CInt(request.QueryString("caseLabID"))
	response.write(typename(caseLabID))
	Set ca = conn.Execute("select * from caseLab where caseLabID="&caseLabID)
 %>
 <!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>更新案例</title>
</head>
<body>
		
	
	<form align="center" method="post" action="caseUpdate(db).asp">
		<table width="560px"heigth="350px"border="3"align="center"cellspacing="5px"cellpadding="5px"frame="box" rules="all">
		<thead>
		<tr>
			<td hidden="true">ID</td>
			<td>时间</td>
			<td>案例类型 </td>
			<td>详细内容</td>		
		</tr>
		
		<tr>    
			<td hidden="true"><input type="text"align="center"name="caseLabID"value="<%=ca("caseLabID")%>"></td>
			<td ><input type="text"align="center"name="caseTime"value="<%=ca("caseTime")%>"></td>
			<td ><input type="text"align="center"name="caseType"value="<%=ca("caseType")%>"></td>
			<td ><input type="text"align="center"name="caseDetail"value="<%=ca("caseDetail")%>"></td>		
		</tr>
		
		</thead>
		</table>
		<br><br>
		<div align="center"><button class="easyui-linkbutton"type="submit">提交</button></div>
		</form>
	</div>
</body>	

</html>