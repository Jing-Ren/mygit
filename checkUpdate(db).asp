<!-- #include file="conn_db.asp"-->
<%
	checkListID = CInt(request.Form("checkListID"))
	set ss = conn.Execute("select * from checkList where checkListID="&checkListID)

%>
<%
	checkListID = request.Form("checkListID")
	response.write checkListID
	
	checkTime = request.Form("checkTime")
	response.write checkTime
	
	checkProject = request.Form("checkProject")
	response.write checkProject
	
	isFinish = request.Form("isFinish")
	response.write isFinish
	
	remarks = request.Form("remarks")
	response.write remarks
	
	sql ="Update checkList Set checkTime ='"&checkTime&"',checkProject ='"&checkProject&"',isFinish ='"&isFinish&"',remarks ='"&remarks&"' where checkListID="&checkListID
	conn.Execute sql

	response.redirect("infoSchedule_Jovia.asp")
	
	
%>