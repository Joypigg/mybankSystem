<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,com.bank.zg.util.*,com.bank.zg.po.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<%
   request.setCharacterEncoding("utf-8");
   String name=request.getParameter("name");
   String pwd=request.getParameter("pwd");
   String type=request.getParameter("s");
   Customer cs=new Customer();
   if(type.equals("1")){
	   if (name == null || name.trim().equals("")) {
			response.sendRedirect("index.jsp");
		}else if (pwd == null || pwd.trim().equals("")) {
			response.sendRedirect("index.jsp");
		}else{
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM customer where custname=? and custpwd=? ";
			conn = DBUtil.getconn();
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, name);
				ps.setString(2, pwd);
				rs = ps.executeQuery();
				if (rs.next()) {
					cs.setCusidcard(rs.getString("custidcard"));
					cs.setCusmoney(rs.getDouble("custmoney"));
					cs.setCuspwd(rs.getString("custpwd"));
					session.setAttribute("name", name);
					request.getRequestDispatcher("custom.jsp").forward(request, response);
					
					session.setAttribute("cardid", cs.getCusidcard());				
					session.setAttribute("cusmoney", cs.getCusmoney());
					session.setAttribute("cuspwd", cs.getCuspwd());
				} else {
					request.getRequestDispatcher("index.jsp?flag=1").forward(request, response);
				}
			} catch (Exception e) {
				e.getMessage();
			} finally {
				DBUtil.replease(rs, ps, conn);
			}
		} 
   }else if(type.equals("2")){
		if (name == null || name.trim().equals("")) {
			response.sendRedirect("index.jsp");
		}else if (pwd == null || pwd.trim().equals("")) {
			response.sendRedirect("index.jsp");
		}else{
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM admin where adminname=? and adminpwd=? ";
			conn = DBUtil.getconn();
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, name);
				ps.setString(2, pwd);
				rs = ps.executeQuery();
				if (rs.next()) {
					session.setAttribute("name", name);
					request.getRequestDispatcher("Admin1/admin.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("index.jsp?flag=1").forward(request, response);
				}
			} catch (Exception e) {
				e.getMessage();
			} finally {
				DBUtil.replease(rs, ps, conn);
			}
		}
   }else{
	   response.sendRedirect("index.jsp");
   }
%>
</body>
</html>