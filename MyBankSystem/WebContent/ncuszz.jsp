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
    String kh=request.getParameter("kh");
    String je=request.getParameter("je");
    Object ob=session.getAttribute("cardid");
    Object ob1=session.getAttribute("cusmoney");
    CustomerDao cd=new CustomerDao();
    String b=null;
    double m=0.0;
    double d=0.0;
    if(kh==null || kh.trim().equals("")){
    	 request.getRequestDispatcher("cuszz.jsp?flag=1").forward(request, response); 
    }else if(je==null || je.trim().equals("")){
   	 request.getRequestDispatcher("cuszz.jsp?flag=1").forward(request, response); 
    }else if(!cd.isNumeric(je)){
 	   request.getRequestDispatcher("cuszz.jsp?flag=1").forward(request, response);
    }else if(ob!=null && ob1!=null){
    	 b=(String)ob;
    	 m=(double)ob1;
    	 d=Double.parseDouble(je);
    	 if(b.equals(kh)){
    		 request.getRequestDispatcher("cuszz.jsp?flag=3").forward(request, response);
    	 }else if(d>m){
    		 request.getRequestDispatcher("cuszz.jsp?flag=4").forward(request, response);
    	 }else{
    		 cd.qk(b, d);
    		 cd.ck(kh, d);
    		 request.getRequestDispatcher("cuszz.jsp?flag=2").forward(request, response);
    	 }
    }


%>
</body>
</html>