<!-- #include file="conn_db.asp" -->
<%
	Dim vipTime,vipName,vipDuty,vipTitle,flightNum,guaranteeList
	
	vipTime = request.Form("vipTime")
	vipName = request.Form("vipName")
	vipDuty = request.Form("vipDuty")
	vipTitle = request.Form("vipTitle")
	flightNum = request.Form("flightNum")
	guaranteeList = request.Form("guaranteeList")
%>

<%
	conn.Execute "Insert into vipInfo(vipTime,vipName,vipDuty,vipTitle,flightNum,guaranteeList) values('"&vipTime&"','"&vipName&"','"&vipDuty&"','"&vipTitle&"','"&flightNum&"','"&guaranteeList&"');"
	response.redirect("infoSchedule_Jovia.asp")
%>