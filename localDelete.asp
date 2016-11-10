<!-- #include file="conn_db.asp" -->

<%
	localGuaranteeID = request.querystring("localGuaranteeID")
	conn.Execute "delete from localGuarantee where localGuaranteeID="&localGuaranteeID
	response.redirect("infoSchedule_Jovia.asp")
	
%>