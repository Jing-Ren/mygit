<!-- #include file="conn_db.asp" -->
<%
	dim pilotLevel,matchLimit,airportLimit,nightLimit,remarks
	pilotLevel = request.Form("pilotLevel")
	Response.Write pilotLevel
	
	matchLimit = Request.Form("matchLimit")
	Response.Write matchLimit

	airportLimit = request.Form("airportLimit")
	Response.Write airportLimit

	nightLimit = request.Form("nightLimit")
	Response.Write nightLimit
	
	remarks = Request.Form("remarks")
	Response.Write remarks
%>
<% 
	sql = "update pilotMatch set matchLimit='"&matchLimit&"',airportLimit='"&airportLimit&"',nightLimit='"&nightLimit&"',remarks='"&remarks&"' where ID="&pilotLevel
	conn.Execute sql
	
	response.redirect("pilotQual_Jovia.asp#captaintype")
	
%>





 



