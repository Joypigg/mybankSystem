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
   <h1>ZG银行</h1>
   <h3>修改密码</h3>
   <div>
   <form action="ncusgm.jsp" method="post" target="_top">
     <table border=0>
       <tr><td id="d">请输入旧密码:</td><td><input type="password" name="jmm"/></td></tr>
       <tr><td id="d">请输入新密码:</td><td><input type="password" name="xmm"/></td></tr>
       <tr><td id="d">请再次确认新密码:</td><td><input type="password" name="zmm"/></td></tr>
       <tr><td colspan="2" align="center"><input type="submit" value="确定" >&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"></td></tr>
       <tr><td colspan="2" align="center">
        <% 
           String flag=request.getParameter("flag");
           if(flag!=null && flag.equals("3")){
     	       out.print("<span style='color:red'>旧密码错误,请重新输入！</span>");
           }else if(flag!=null && flag.equals("2")){
     	       out.print("<span style='color:red'>修改失败,两次密码不一致,请重新输入！</span>");
           }else if(flag!=null && flag.equals("1")){
     	       out.print("<span style='color:red'>输入有误,密码不能为空,请重新输入！</span>");
           }else if(flag!=null && flag.equals("4")){
   	           //out.print("<span>修改成功!</span>");
   	           request.getRequestDispatcher("index.jsp?flag=2").forward(request, response);
   	           response.setHeader("refresh", "0;url=index.jsp");  	           
           }
          
        %>     
       </td></tr>
     </table>
   </form>
   </div>
</div>
</body>
</html>