<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.bank.zg.dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<% 
   String m=request.getParameter("ck");
   Object ob=session.getAttribute("cusmoney"); 
   double cm=0.0;
   double d=0.0;
   CustomerDao cd=new CustomerDao();
   if(m==null || m.trim().equals("")){
	  request.getRequestDispatcher("cusck.jsp?flag=1").forward(request, response); 
   }else if(!cd.isNumeric(m)){
	   request.getRequestDispatcher("cusck.jsp?flag=1").forward(request, response);
   }else if(ob!=null){
	   cm=Double.parseDouble(m);
       d=(double)ob;
       if(cm>0){
	      cd.ck((String)session.getAttribute("cardid"), cm);
	      request.getRequestDispatcher("cusck.jsp?flag=2").forward(request, response);	  
       }else{
	      request.getRequestDispatcher("cusck.jsp?flag=3").forward(request, response);
       }
   }
%>
</body>
</html>