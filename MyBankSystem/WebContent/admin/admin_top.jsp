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
	width: 262px;
	height: 64px;
	margin-top: 0px;
	margin-right: 0px;
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
	margin-right: 150px;
	float: right;
}
</style>
</head>
<body background="../img/bg2.jpg" leftmargin="0" topmargin="0">
	<div id="maindiv">
		<div id="logodiv"></div>
		<div id="exitdiv">
			<a href="../index.jsp" target="_top"><img src="../img/out.gif" alt="安全退出" ></a>
		</div>
		<div id="textdiv">
			管理员：<strong><%=session.getAttribute("name") %></strong> 您好，感谢登陆使用！
		</div>
	</div>
</body>

</html>