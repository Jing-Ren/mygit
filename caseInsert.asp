<!-- #include file="conn_db.asp" -->
<%
	dim caseTime,caseType,caseDetail
	
	caseTime = request.Form("caseTime")
	Response.Write caseTime
	
	caseType = Request.Form("caseType")
	Response.Write caseType

	caseDetail = request.Form("caseDetail")
	Response.Write caseDetail

%>
<% 
	conn.Execute "Insert into caseLab(caseTime,caseType,caseDetail) values('"&caseTime&"','"&caseType&"','"&caseDetail&"');"
	response.redirect("infoSchedule_Jovia.asp")
	
%>