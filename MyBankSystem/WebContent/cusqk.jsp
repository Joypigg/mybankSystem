<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   <h1>取款</h1>
   <div>
<form action="ncusqk.jsp" method="post">
  <table border=0>
     <tr><td id="d">请输入取款金额:</td><td><input type="text" name="qk" placeholder="请输入取款金额"/>(元)</td></tr>
     <tr><td colspan="2" align="center"><input type="submit" value="确定"/>&nbsp;&nbsp;&nbsp;&nbsp;
     <input type="reset" value="重置"/></td></tr>
     <tr><td colspan="2">
     <% 
     String flag=request.getParameter("flag");
     if(flag!=null && flag.equals("3")){
     	out.print("<span style='color:red'>取款失败！</span>");
     }else if(flag!=null && flag.equals("2")){
     	out.print("<span>取款成功！</span>");
     }else if(flag!=null && flag.equals("1")){
     	out.print("<span style='color:red'>输入有误，请重新输入！</span>");
     }
     %>
     </td></tr>
</table>
</form>
   </div>
</div>
</body>
</html>