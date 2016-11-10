<!-- #include file="conn_db.asp" -->

<%
	vipInfoId = request.querystring("vipInfoID")
	conn.Execute "delete from vipInfo where vipInfoID="&vipInfoID
	response.redirect("infoSchedule_Jovia.asp")
	
%>
