<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import java.lang.*%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%
	String flag = request.getParameter("flag");
	if (flag != null && flag.equals("3")) {
		out.print("<span style='color:red'>存款失败！</span>");
	} else if (flag != null && flag.equals("2")) {
		out.print("<span>存款成功！</span>");
	} else if (flag != null && flag.equals("1")) {
		out.print("<span style='color:red'>输入有误，请重新输入！</span>");
	}
%>
<style type="text/css">
ul {
	line-height: 30px;
}

a {
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}
</style>
</head>
<body background="img/bg2.jpg" alink="#2894ff" vlink="#2894ff"
	link="#2894ff">
	<div>
		<ul>
			<li><a href="cusqk.jsp" target="main">取款</a></li>
			<li><a href="cusck.jsp" target="main">存款</a></li>
			<li><a href="cusye.jsp" target="main">查询余额</a></li>
			<li><a href="cuszz.jsp" target="main">转账</a></li>
			<li><a href="cusgm.jsp" target="main">修改密码</a></li>
		</ul>
	</div>
</body>
</html>