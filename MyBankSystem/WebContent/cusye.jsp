<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.bank.zg.dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
 body{
    background-image: url("img/bg2.jpg");
  }
  #d{
   text-align: left;
  
  }
</style>
</head>
<body>
<div align="center">
   <h1>ZG银行</h1>
   <div>
  <table border=0>
  <%  
      CustomerDao cd=new CustomerDao();
      double money=cd.ye((String)session.getAttribute("cardid"));
     // pageContext.setAttribute("money", money);
  
  %>
     <tr><td id="d">您当前卡上余额为:</td><td><%=money %></td></tr>
  </table>
   </div>
</div>
</body>
</html>