<!-- #include file="conn_db.asp" -->
<%
	flightOperationID = request.querystring("flightOperationID")
	conn.Execute "delete from flightOperation where flightOperationID="&flightOperationID
	response.redirect("infoSchedule_Jovia.asp")
	
%>
