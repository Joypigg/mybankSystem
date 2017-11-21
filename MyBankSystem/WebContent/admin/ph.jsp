<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*,com.bank.zg.util.*,com.bank.zg.po.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<% 
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Customer> list=new ArrayList<Customer>();
       
       try{
        conn=DBUtil.getconn();
        String sql="select custname cn,custmoney cm,rownum from (select custname,custmoney from customer order by custmoney desc) where rownum<4";
        ps=conn.prepareStatement(sql);
        rs=ps.executeQuery();
        while(rs.next()){
        	Customer cu=new Customer();
            cu.setCusname(rs.getString("cn"));
        	cu.setCusmoney(rs.getDouble("cm"));
        	cu.setCusnumber(rs.getInt("rownum"));
        	list.add(cu);
        }
        request.setAttribute("Clist", list);
        }catch(Exception e){
        	e.getMessage();
        }finally{
        	DBUtil.replease(rs, ps, conn);
        }
        
     %>
<div>
<h2 align="center">ZG银行</h2>
<h3 align="center">富豪排行榜</h3>
  <div align="center">
     <table border=0>
     <tr><td id="d">姓名</td><td>&nbsp;&nbsp;</td><td>总金额</td><td>&nbsp;&nbsp;</td><td>排名</td></tr>    
     
     <c:forEach items="${ Clist }" var="Clist">
         <tr>
             <td id="d">${ Clist.cusname }</td>
             <td>&nbsp;&nbsp;</td>
             <td>${ Clist.cusmoney }</td>
             <td>&nbsp;&nbsp;</td>
             <td>${ Clist.cusnumber }</td>
          </tr>
     </c:forEach>    
    
     </table>
  </div>
</div>
</body>
</html>