<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>员工信息修改</title>
	</head>
	<body>
	<% 
		//响应设置
		response.setContentType("text/html");  
		response.setHeader("Cache-Control", "no-store");  
		response.setHeader("Pragma", "no-cache");  
		response.setCharacterEncoding("utf-8");
		response.setDateHeader("Expires", 0); 	
	
		//从Staff页面取值
		String sID=request.getParameter("sID");
		String select=request.getParameter("select");
		String content=request.getParameter("content");
		
		//数据库连接，此处数据库账户名为“root”，密码为123456
		Class.forName("com.mysql.jdbc.Driver");
 		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/managesystem", "root", "123456");
 		Statement stat=conn.createStatement();
 		
 		//更新数据
 		String updateSQL="update staff set "+select+"='"+content+"' where sID='"+sID+"'";
 		stat.executeUpdate(updateSQL);
 		response.getWriter().write("none");
 		
 		//关闭连接
 		stat.close();
 		conn.close();
	%>
	</body>
</html>