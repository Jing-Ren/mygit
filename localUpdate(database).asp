
<!-- #include file="conn_db.asp" -->
<%
	localGuaranteeID = CInt(request.Form("localGuaranteeID"))
	Set ss = conn.Execute("select * from localGuarantee where localGuaranteeID="&localGuaranteeID )

%>

<%

	localGuaranteeID = request.form("localGuaranteeID")
	response.write localGuaranteeID

	localType = request.form("localType")
	response.write localType

	localPlan = request.form("localPlan")
	response.write localPlan

	performance = request.form("performance")
	response.write performance

	unfinishReason = request.form("unfinishReason")
	response.write unfinishReason

	
	sql ="Update localGuarantee Set localType ='"&localType&"',localPlan ='"&localPlan&"',performance ='"&performance&"',unfinishReason ='"&unfinishReason&"' where localGuaranteeID="&localGuaranteeID
	conn.Execute sql

	response.redirect("infoSchedule_Jovia.asp")
%>
