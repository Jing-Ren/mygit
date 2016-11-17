<!-- #include file="conn_db.asp" -->
<%	
	caseLabID = CInt(request.Form("caseLabID"))
	Set ca = conn.Execute("select * from caseLab where caseLabID="&caseLabID )
%>
<%
	caseLab = request.Form("caseLabID")
	Response.Write caseLabID
	
	caseTime = request.Form("caseTime")
	Response.Write caseTime
	
	caseType = Request.Form("caseType")
	Response.Write caseType

	caseDetail = request.Form("caseDetail")
	Response.Write caseDetail

	sql = "Update caseLab set  caseTime='"&caseTime&"',caseType='"&caseType&"',caseDetail='"&caseDetail&"' where caseLabID="&caseLabID
	conn.Execute sql
	response.redirect("infoSchedule_Jovia.asp")
	
%>