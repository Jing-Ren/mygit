<!-- #include file="conn_db.asp" -->

<%

	tipDetail = request.form("tipDetail")
	response.write vipInfoID


	
	sql ="Update tipInfo Set tipDetail ='"&tipDetail&"' where tipInfoID=6"
	conn.Execute sql

	response.redirect("infoSchedule_Jovia.asp")
%>

















