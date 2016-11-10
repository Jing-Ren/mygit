<!-- #include file="conn_db.asp" -->


<html>
<head>
	<title>飞行员资质管理更新</title>
	<meta charset="utf-8">
</head>

<body topmargin="200">
	<form align="center" method="post" action="qualUpdate.asp" >
		飞 行员资质：
		<select name="pilotLevel" style="width:170px;height:20px" >
			<option value="1">一类机长</option>
			<option value="2">二类机长</option>
			<option value="3">三类机长</option>
			<option value="4">四类机长</option>
			<option value="5">五类机长</option>
			<option value="6">六类机长</option>
		</select>
		<br>
		<br>
		搭 配 限 制：<input type="text" name='matchLimit' maxlength="150" >
		<br>
		<br>
		机 场 限 制：<input type="text" name='airportLimit'>
		<br>
		<br>
		备&nbsp;&nbsp;&nbsp; 注：<input type="text" name='remarks'>
		<br>
		<br>
		<button type="submit">提交</button>
	</form>
</body>

</html>