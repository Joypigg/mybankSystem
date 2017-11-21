<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.bank.zg.dao.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<title></title>
<style type="text/css">
 body{
    background-image: url("../img/bg2.jpg");
  }
 #d{
   text-align: left;
  
  }
</style>
</head>
<body>
<%!
   AdminDao ad=new AdminDao();
   double d=ad.zm();
   int i=ad.rs();
%>
<div>
<h2 align="center">ZG银行</h2>
  <div align="center">
     <table border=0>
     <tr><td id="d">拥有客户人数：</td><td><%=i %></td></tr>
     <tr><td id="d">总储蓄金额为：</td><td><%=d %></td></tr>
     </table>
  </div>
</div>
</body>
</html>