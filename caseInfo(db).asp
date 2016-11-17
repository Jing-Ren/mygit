<!--#include file = "conn_db.asp"-->
<%
	caseInfoID = request.Form("caseInfoID")
	response.write caseInfoID
	Set ss = conn.Execute("select * from caseInfo where caseInfoID = "&caseInfoID

%>
<%
	caseInfoID = request.Form("caseInfoID")
	caseTime = request.Form("caseTime")
	caseType = request.Form("caseType")
	caseDetail request.Form("caseDetail")
	
	sql = "Update caseInfo set caseTime = '"&caseTime&"',caseType = '"&caseType&"',caseDetail ='"&caseDetail&"' where caseInfoID="&caseInfoID

%>