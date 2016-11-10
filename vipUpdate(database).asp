<!-- #include file="conn_db.asp" -->
<%
	vipInfoID = CInt(request.Form("vipInfoID"))
	Set ss = conn.Execute("select * from vipInfo where vipInfoID="&vipInfoID )

%>

<%

	vipInfoID = request.form("vipInfoID")
	response.write vipInfoID

	vipTime = request.form("vipTime")
	response.write vipTime

	vipName = request.form("vipName")
	response.write vipName

	vipDuty = request.form("vipDuty")
	response.write vipDuty

	vipTitle = request.form("vipTitle")
	response.write vipTitle

	flightNum = request.form("flightNum")
	response.write flightNum

	guaranteeList = request.form("guaranteeList")
	response.write guaranteeList

	
	sql ="Update vipInfo Set vipTime ='"&vipTime&"',vipName ='"&vipName&"',vipDuty ='"&vipDuty&"',vipTitle ='"&vipTitle&"',flightNum ='"&flightNum&"',guaranteeList ='"&guaranteeList&"' where vipInfoID="&vipInfoID
	conn.Execute sql

	response.redirect("infoSchedule_Jovia.asp")
%>

















