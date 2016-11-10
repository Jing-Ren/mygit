<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%Session.CodePage = 65001%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
	Set conn=server.CreateObject("adodb.connection")
	conn.provider="microsoft.ACE.oledb.12.0"
	conn.open server.mappath("db_pilot.accdb") 	
%>