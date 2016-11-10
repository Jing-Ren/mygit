<!-- #include file="conn_db.asp" -->
<%
	dim pilotLevel,matchLimit,airportLimit,remarks
	pilotLevel = request.Form("pilotLevel")
	Response.Write pilotLevel
	
	matchLimit = Request.Form("matchLimit")
	Response.Write matchLimit

	airportLimit = request.Form("airportLimit")
	Response.Write airportLimit

	remarks = Request.Form("remarks")
	Response.Write remarks
%>
<% 
	sql = "update pilotMatch set matchLimit='"&matchLimit&"',airportLimit='"&airportLimit&"',remarks='"&remarks&"' where ID="&pilotLevel
	conn.Execute sql
	response.redirect("pilotQual_Jovia.asp")
	
%>





 



