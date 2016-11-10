<!-- #include file="conn_db.asp" -->
<%	
	flightOperationID = CInt(request.Form("flightOperationID"))
	Set op = conn.Execute("select * from flightOperation where flightOperationID="&flightOperationID )
%>

<%
	flightOperationID = request.Form("flightOperationID")
	flightTime = request.Form("flightTime")
	flightCount = request.Form("flightCount")
	flightUsage = request.Form("flightUsage")
	diversionNum = request.Form("diversionNum")
	flight_DelayNum = request.Form("flight_DelayNum")

%>
<%
	op = "Update flightOperation set flightTime='"&flightTime&"',flightCount='"&flightCount&"',flightUsage='"&flightUsage&"',diversionNum='"&diversionNum&"',flight_DelayNum='"&flight_DelayNum&"' where flightOperationID="&flightOperationID
	conn.Execute op
	response.redirect("infoSchedule_Jovia.asp")
%>


 



