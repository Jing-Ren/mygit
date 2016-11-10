<!-- #include file="conn_db.asp" -->
<%
	Dim localType,localPlan,performance,unfinishReason
	
	localType = request.Form("localType")
	localPlan = request.Form("localPlan")
	performance = request.Form("performance")
	unfinishReason = request.Form("unfinishReason")

%>

<%
	conn.Execute "Insert into localGuarantee(localType,localPlan,performance,unfinishReason) values('"&localType&"','"&localPlan&"','"&performance&"','"&unfinishReason&"');"
	response.redirect("infoSchedule_Jovia.asp")
%>