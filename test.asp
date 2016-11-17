 <!-- #include file="conn_db.asp" -->
<!-- 下面六条语句为从数据库的pilotInfo表中查询相应资质分类的机长信息 -->
<%
	set c1=conn.Execute("select * from pilotInfo where pilotLevel='一类机长'")
	Set c2=conn.Execute("select * from pilotInfo where pilotLevel='二类机长'")
	Set c3=conn.Execute("select * from pilotInfo where pilotLevel='三类机长'")
	Set c4=conn.Execute("select * from pilotInfo where pilotLevel='四类机长'")
	Set c5=conn.Execute("select * from pilotInfo where pilotLevel='五类机长'")
	Set c6=conn.Execute("select * from pilotInfo where pilotLevel='六类机长'")
%>
	
	<!DOCTYPE html>
    <html>
    <head>
    	<meta charset="UTF-8">
    	<title>Message Box Position - jQuery EasyUI Demo</title>
    	<!-- easyui样式引用 -->
		<link rel="stylesheet" type="text/css" href="resource/css/common.css" />
		<link rel="stylesheet" type="text/css" href="resource/css/main.css" />
		<script type="text/javascript" src="resource/js/libs/modernizr.min.js"></script>
		<link rel="stylesheet" type="text/css"href="./jquery-easyui-1.4.4/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css"href="./jquery-easyui-1.4.4/themes/icon.css">
		<script type="text/javascript" src="./jquery-easyui-1.4.4/jquery.min.js"></script>
		<script type="text/javascript"src="./jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
		<script type="text/javascript"src="./jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
		
   </head>
    <body>
    	<h2>Message Box Position</h2>
    	<p></p>
    	<div style="margin:20px 0;">
    		
    		<p>
    			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="firstCaptain()">一类机长</a>
    			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="secondCaptain()">二类机长</a>
    			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="thirdCaptain()">三类机长</a>
    			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="fourthCaptain()">四类机长</a>
    			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="fifthCaptain()">五类机长</a>
    			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="sixthCaptain()">六类机长</a>
    		</p>
    		
    	</div>
    	<script>
    		function firstCaptain(){
			$.messager.show({
				title:'一类机长详细信息',
				msg:'<table border="1"frame="hsides"><tr><td>员工编号</td><td>姓名</td></tr><% do while not c1.eof%><tr><td><%=c1("pilotID")%></td><td><%=c1("pilotName")%></td></tr><% c1.movenext 
				loop%></table>',
				showType:'fade',
				style:{
					right:'',
					bottom:''
				}
			});
			}
			function secondCaptain(){
			$.messager.show({
				title:'二类机长详细信息',
				msg:'<table border="1"frame="hsides"><tr><td>员工编号</td><td>姓名</td></tr><% do while not c2.eof%><tr><td><%=c2("pilotID")%></td><td><%=c2("pilotName")%></td></tr><% c2.movenext 
				loop%></table>',
				showType:'fade',
				style:{
					right:'',
					bottom:''
				}
			});
			}
			function thirdCaptain(){
			$.messager.show({
				title:'三类机长详细信息',
				msg:'<table border="1"frame="hsides"><tr><td>员工编号</td><td>姓名</td></tr><% do while not c3.eof%><tr><td><%=c3("pilotID")%></td><td><%=c3("pilotName")%></td></tr><% c3.movenext 
				loop%><table>',
				showType:'fade',
				style:{
					right:'',
					bottom:''
				}
			});
			}
			function fourthCaptain(){
			$.messager.show({
				title:'四类机长详细信息',
				msg:'<table border="1"frame="hsides"><tr><td>员工编号</td><td>姓名</td></tr><% do while not c4.eof%><tr><td><%=c4("pilotID")%></td><td><%=c4("pilotName")%></td></tr><% c4.movenext 
				loop%></table>',
				showType:'fade',
				style:{
					right:'',
					bottom:''
				}
			});
			}
			function fifthCaptain(){
			$.messager.show({
				title:'五类机长详细信息',
				msg:'<table border="1"frame="hsides"><tr><td>员工编号</td><td>姓名</td></tr><% do while not c5.eof%><tr><td><%=c5("pilotID")%></td><td><%=c5("pilotName")%></td></tr><% c5.movenext 
				loop%></table>',
				showType:'fade',
				style:{
					right:'',
					bottom:''
				}
			});
			}
			function sixthCaptain(){
			$.messager.show({
				title:'六类机长详细信息',
				msg:'<table border="1"frame="hsides"><tr><td>员工编号</td><td>姓名</td></tr><% do while not c6.eof%><tr><td><%=c6("pilotID")%></td><td><%=c6("pilotName")%></td></tr><% c6.movenext 
				loop%></table>',
				showType:'fade',
				style:{
					right:'',
					bottom:''
				}
			});
			}
    	
    	</script>
    </body>
    </html>