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
   String m=request.getParameter("qk");
   Object ob=session.getAttribute("cusmoney"); 
   double dm=0.0;
   double d=0.0;
   CustomerDao cd=new CustomerDao();
   if(m==null || m.trim().equals("")){
		  request.getRequestDispatcher("cusqk.jsp?flag=1").forward(request, response); 
	}else if(!cd.isNumeric(m)){
		   request.getRequestDispatcher("cusqk.jsp?flag=1").forward(request, response);
	}else if(ob!=null){
	    dm=Double.parseDouble(m);
        d=(double)ob;
        if(dm<d){
	       cd.qk((String)session.getAttribute("cardid"), dm);
	       request.getRequestDispatcher("cusqk.jsp?flag=2").forward(request, response);	
	       //session.removeAttribute("cusmoney");
       }else{
	      request.getRequestDispatcher("cusqk.jsp?flag=3").forward(request, response);
       }
	}
%>
</body>
</html>