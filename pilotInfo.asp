<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
	Set conn=server.CreateObject("adodb.connection")
	conn.provider="microsoft.ACE.oledb.12.0"
	conn.open server.mappath("db_pilot.accdb") 	
%>
<%
    Set rs = conn.Execute("select * from pilotInfo")
%>

<%
	pageNo = Request("pageNo")
	if not IsNumeric(pageNo) or pageNo = "" then 
		pageNo = 1
	Else
		pageNo = cInt(pageNo)
	end if
	Set rs = server.CreateObject("ADODB.Recordset")
	rs.open "select * from pilotInfo",conn,3
	rs.pagesize = 15   
	pageS = rs.pagesize
	rs.absolutepage = pageNo
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>详细信息页面</title>
	<style type="text/css">
		#div1{ float: left; }
	
		#tab1{
				border:"0";
				cellspacing:"1";
				background-color:#3CF;
				margin:auto;
				position:relative;
				}
	</style>
</head>
<body>
<br/>
<div style="width:100%" >  <!-- 第一个盒子 -->
	<div align="center">
		<select>
			<option value="1">员工编号</option>
			<option value="2">姓名</option>
			<option value="3">号位</option>
			<option value="4">资质分类</option>
		</select>

		<input type="text" name="">

		<button>查询</button>

	</div>

</div>
<br/><br/>
<div style="width:100%">  <!-- 第二个盒子 -->
	<div align="center">
		
		<table id="tab1">
			<form>
				<tr align="center">
					<!-- <th width="100">ID</th> -->
					<th width="100">员工编号</th>
					<th width="100">姓名</th>
					<th width="100">号位</th>
					<th width="100">资质分类</th>
					<th width="100">带飞时间</th>
					<th width="100">其他特殊限制</th>
					<th width="100">限制原因</th>
				</tr>

				<!-- 连接数据库，导出数据库表中记录 -->
				<% do while not rs.eof and pageS > 0 %>
				<tr>
					<!-- <td><% = rs("ID") %></td> -->
					<td><% = rs("pilotId") %></td>
					<td><% = rs("pilotName") %></td>
					<td><% = rs("pilotNum") %></td>
					<td><% = rs("pilotLevel") %></td>
					<td><% = rs("flyTime") %></td>
					<td><% = rs("otherLimit") %></td>
					<td><% = rs("limitReason") %></td>
					<td><% = rs("remark") %></td>
					<td align="center"><a href="详细信息更新.asp?ygbh=<%=rs("pilotID")%>">更新</a></td>
					<td align="center"><a href="详细信息删除.asp?ygbh=<%=rs("pilotID")%>">删除</a></td>
				</tr>
				<% pageS = pageS - 1
				rs.movenext
				loop	%>
			</form>

			<form method="post" action="详细信息增加.asp">
				<tr>
					<!-- <td><input type="text" name="ID"> </td> -->
					<td><input type="text" name="pilotID"> </td>
					<td><input type="text" name="pilotName"> </td>
					<td><input type="text" name="pilotNum"> </td>
					<td><input type="text" name="pilotLevel"> </td>
					<td><input type="text" name="flyTime"> </td>
					<td><input type="text" name="otherLimit"> </td>
					<td><input type="text" name="limitReason"> </td>
					<td><input type="text" name="remark"> </td>
					<td><input type="submit" value="添加"></td>
				</tr>
			</form>

		</table>
		

		<p><% 
		if pageNo <> 1 then 
			response.write"<a href='?pageNo=1'>首页</a>&nbsp&nbsp" 
			response.write"<a href='?pageNo="&pageNo-1&"'>上一页</a>&nbsp&nbsp"
		else
			response.write"首页"
			response.write"上一页"
		end if
		
		if pageNo < rs.PageCount then
			response.write "<a href='?pageNo="&pageNo+1&"'>下一页</a>&nbsp&nbsp;"
			response.write "<a href='?pageNo="&rs.PageCount&"'>末页</a>&nbsp&nbsp;"
		else
			response.write "下一页"
			response.write "末页"
		end if
			response.write"共"&rs.RecordCount&"条记录&nbsp&nbsp;"
			response.write pageNo&"/"&rs.PageCount&"页"
		%></p>

	</div>
</div>

</body>
</html>