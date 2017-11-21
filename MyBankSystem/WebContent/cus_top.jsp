<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
#maindiv {
	width: 100%;
	height: 64px;
}

#logodiv {
    font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #2894ff;
	width: 262px;
	height: 64px;
	text-align:center;
	margin-top: 10px;
	margin-right: 10px;
	float: left;
}

#exitdiv {
	width: 46px;
	height: 15px;
	margin-top: 10px;
	margin-right: 20px;
	float: right;
}

#exitdiv img {
	width: 46px;
	height: 20px;
	border: 0px;
}

#textdiv {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #2894ff;
	text-decoration: none;
	width: 250px;
	height: 38px;
	margin-top: 10px;
	margin-right: 200px;
	float: right;
}
</style>
</head>
<body background="img/bg2.jpg" leftmargin="0" topmargin="0">
	<div id="maindiv">
		<div id="logodiv"><strong><%=session.getAttribute("name") %></strong>&nbsp;先生(女士),您好! ZG银行欢迎您！</div>
		<div id="exitdiv">
			<a href="index.jsp" target="_top"><img src="img/out.gif" alt="安全退出" ></a>
		</div>
		<div id="textdiv">当前在线人数 1 人</div>
	</div>
</body>

</html>