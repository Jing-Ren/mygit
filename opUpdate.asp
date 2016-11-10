<!-- #include file="conn_db.asp" -->
<%		
	flightOperationID = CInt(request.QueryString("flightOperationID"))
	response.write(typename(flightOperationID))
	Set op = conn.Execute("select * from flightOperation where flightOperationID="&flightOperationID)
 %>
 <!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>更新运行信息</title>
</head>
<body>
		
	
	<form align="center" method="post" action="operationUpdate.asp">
		<table width="560px"heigth="350px"border="3"align="center"cellspacing="5px"cellpadding="5px"frame="box" rules="all">
		<thead>
		<tr>
			<td hidden="true">ID</td>
			<td>保障时间</td>
			<td>保障航班量 </td>
			<td>飞机日利用率</td>
			<td>备降次数 </td>
			<td>飞行部原因延误航班数 </td>
			
		</tr>
		
		<tr>
		    
			<td hidden="true"><input type="text"align="center"name="flightOperationID"value="<%=op("flightOperationID")%>"></td>
			<td ><input type="text"align="center"name="flightTime"value="<%=op("flightTime")%>"></td>
			<td ><input type="text"align="center"name="flightCount"value="<%=op("flightCount")%>"></td>
			<td ><input type="text"align="center"name="flightUsage"value="<%=op("flightUsage")%>"></td>		
			<td ><input type="text"align="center"name="diversionNum"value="<%=op("diversionNum")%>"></td>		
			<td ><input type="text"align="center"name="flight_DelayNum"value="<%=op("flight_DelayNum")%>"></td>	
				
		</tr>
		
		</thead>
		</table>
		<br><br>
		<div align="center"><button class="easyui-linkbutton"type="submit">提交</button></div>
		</form>
	</div>
</body>	

</html>