<!-- #include file="conn_db.asp" -->
<%
	caseLabID = request.querystring("caseLabID")
	conn.Execute "delete from caseLab where caseLabID="&caseLabID
	response.redirect("infoSchedule_Jovia.asp")
	
%>
