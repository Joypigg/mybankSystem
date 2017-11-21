<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
 body{
    background-image: url("../img/bg2.jpg");
  }
ul{
  line-height: 30px;
  list-style-type: none;
  }
  #d{
   text-align: left;
  
  }
</style>
</head>
<body>
<div align="center">
   <h1>添加顾客</h1>
   <div>
<form action="Aaddcus.jsp" method="post">
  <table border=0>
     <tr><td id="d">请输入顾客卡号:</td><td><input type="text" name="cardid" placeholder="请输入六位数卡号"></td></tr>
     <tr><td id="d">请输入顾客名：</td><td><input type="text" name="name" placeholder="请输入用户名"/></td></tr>
     <tr><td id="d">请输入顾客密码：</td><td> <input type="password" name="pwd" placeholder="请输入密码"/></td></tr>
     <tr><td id="d">请输入顾客身份证号：</td><td><input type="text" name="id" placeholder="请输入身份证号"/></td></tr>
     <tr><td id="d">请输入储蓄额度：</td><td><input type="text" name="money" placeholder="请输入开户金额"/></td></tr>
     <tr><td id="d">请输入开户日期:</td><td><input type="text" name="data" placeholder="日期(格式:2017/10/1)"/></td></tr>
     <tr><td colspan="2" align="center"><input type="submit" value="提交"/>&nbsp;&nbsp;&nbsp;&nbsp;
     <input type="reset" value="重置"/></td></tr>
     <tr><td colspan="2" align="center"><font>
     <% 
        String flag1=request.getParameter("flag");
        if(flag1!=null && flag1.equals("2")){
         out.print("添加用户成功！");
        }    
     %>    
     </font>
     <span style="color: red">
     <% 
         String flag=request.getParameter("flag"); 
         if(flag!=null && flag.equals("1")){
    	   out.print("添加失败！<br>输入的信息格式有误！请检查后重新输入！");
       }else if(flag!=null && flag.equals("3")){
    	   out.print("添加失败！<br>输入的卡号格式有误！请检查后重新输入！");
       }else if(flag!=null && flag.equals("4")){
    	   out.print("添加失败！<br>输入的金额格式有误！请检查后重新输入！");
       }
     %>
     </span></td></tr>
  </table>
</form>
   </div>
</div>
</body>
</html>