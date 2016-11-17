
<!-- #include file="conn_db.asp" -->
<%
	guaranteeInfoID = CInt(request.Form("guaranteeInfoID"))
	response.write(typename(guaranteeInfoID))
	Set ss = conn.Execute("select * from guaranteeInfo where guaranteeInfoID="&guaranteeInfoID )

%>

<%

	guaranteeInfoID = request.form("guaranteeInfoID")
	response.write guaranteeInfoID

	weatherReason = request.form("weatherReason")
	response.write weatherReason

	flightChange = request.form("flightChange")
	response.write flightChange

	planReason = request.form("planReason")
	response.write planReason

	aircrewReason = request.form("aircrewReason")
	response.write aircrewReason
	
	administrativeChange = request.form("administrativeChange")
	response.write administrativeChange
	
	otherReason = request.form("otherReason")
	response.write otherReason

	
	sql ="Update guaranteeInfo Set weatherReason ='"&weatherReason&"',flightChange ='"&flightChange&"',planReason ='"&planReason&"',aircrewReason ='"&aircrewReason&"',administrativeChange ='"&administrativeChange&"',otherReason ='"&otherReason&"' where guaranteeInfoID="&guaranteeInfoID
	conn.Execute sql

	response.redirect("infoSchedule_Jovia.asp")
%>
