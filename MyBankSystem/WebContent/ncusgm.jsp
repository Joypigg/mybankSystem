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
   String jmm=request.getParameter("jmm");
   String xmm=request.getParameter("xmm");
   String zmm=request.getParameter("zmm");
   Object ob=session.getAttribute("cuspwd");
   Object ob1=session.getAttribute("cardid");
   CustomerDao cd=new CustomerDao();
   String mm=null;
   String mm1=null;
   if(jmm==null || jmm.trim().equals("")){
	   request.getRequestDispatcher("cusgm.jsp?flag=1").forward(request, response);	   
   }else if(xmm==null || xmm.trim().equals("")){
	   request.getRequestDispatcher("cusgm.jsp?flag=1").forward(request, response);	   
   }else if(zmm==null || zmm.trim().equals("")){
	   request.getRequestDispatcher("cusgm.jsp?flag=1").forward(request, response);
   }else{
	   mm=(String)ob;
	   mm1=(String)ob1;
	   if(!jmm.equals(mm)){
		   request.getRequestDispatcher("cusgm.jsp?flag=3").forward(request, response);
	   }else if(!xmm.equals(zmm)){
		   request.getRequestDispatcher("cusgm.jsp?flag=2").forward(request, response);
	   }else{
		   cd.gm(mm1, xmm);
		   request.getRequestDispatcher("cusgm.jsp?flag=4").forward(request, response);
		  
	   }
   }



%>
</body>
</html>