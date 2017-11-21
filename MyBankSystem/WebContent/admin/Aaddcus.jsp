<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.bank.zg.dao.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
   request.setCharacterEncoding("utf-8");
   String cardid=request.getParameter("cardid");
   String name=request.getParameter("name");
   String pwd=request.getParameter("pwd");
   String id=request.getParameter("id");
   String money=request.getParameter("money");
   CustomerDao cd=new CustomerDao();
   //double money=Double.parseDouble(request.getParameter("money"));
   String data=request.getParameter("data");
   if(cardid==null || cardid.trim().equals("")){
	   request.getRequestDispatcher("addcus.jsp?flag=1").forward(request, response);
   }else if(!cd.isNumeric(cardid)){
	   request.getRequestDispatcher("addcus.jsp?flag=3").forward(request, response);
   }else if(name==null || name.trim().equals("")){
	   request.getRequestDispatcher("addcus.jsp?flag=1").forward(request, response);
   }else if(pwd==null || pwd.trim().equals("")){
	   request.getRequestDispatcher("addcus.jsp?flag=1").forward(request, response);
   }else if(id==null || id.trim().equals("")){
	   request.getRequestDispatcher("addcus.jsp?flag=1").forward(request, response);
   }else if(money==null || money.trim().equals("")){
	   request.getRequestDispatcher("addcus.jsp?flag=4").forward(request, response);
   }else if(!cd.isNumeric(money)){
	   request.getRequestDispatcher("addcus.jsp?flag=1").forward(request, response);
   }else if(data==null || data.trim().equals("")){
	   request.getRequestDispatcher("addcus.jsp?flag=1").forward(request, response);
   }else{
   AdminDao ad=new AdminDao();
   double mon=Double.parseDouble(money);
   
  
	   int a=ad.addcus(id, name, pwd, cardid, mon, data);
       if(a>0){
	       request.getRequestDispatcher("addcus.jsp?flag=2").forward(request, response);       
        }
   
  }
%>

</body>
</html>