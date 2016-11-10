<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%Session.CodePage=936%>
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>飞行部系统（测试）</title>
	 <style type="text/css">
        html
        {
            height: 100%;
        }
        .fit_frame
        {
            height: 100%;
            background: #33CCFF;
        }
    </style>
</head>
<frameset cols="*" rows="50, *" id="frame_main" border="0">
    <frame class="fit_frame" bgcolor="#33CCFF" noresize="noresize" name="header"src="top.html">
    <frameset cols="181, *">
        <frame src="left.asp" name="left" noresize="noresize" />
        <frameset rows="31,*" border="0">
        <frame class="fit_frame" bgcolor="#33CCFF" name="title" noresize="noresize">
        <frame src="pilotQualification.asp" name="list" noresize="noresize">
        </frameset>
    </frameset>
</frameset>
<noframes>
    <body>
    </body>
</noframes>
</html>