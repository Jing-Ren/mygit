<!-- #include file="conn_db.asp" -->
<%
	dim flightTime,flightCount,flightUsage,diversionNum,flight_DelayNum
	
	flightTime = request.Form("flightTime")
	Response.Write flightTime
	
	flightCount = Request.Form("flightCount")
	Response.Write flightCount

	flightUsage = request.Form("flightUsage")
	Response.Write airportLimit

		
	diversionNum = Request.Form("diversionNum")
	Response.Write diversionNum
		
	flight_DelayNum = Request.Form("flight_DelayNum")
	Response.Write flight_DelayNum
%>
<% 
	conn.Execute "Insert into flightOperation(flightTime,flightCount,flightUsage,diversionNum,flight_DelayNum) values('"&flightTime&"','"&flightCount&"','"&flightUsage&"','"&diversionNum&"','"&flight_DelayNum&"');"
	response.redirect("infoSchedule_Jovia.asp")
	
%>