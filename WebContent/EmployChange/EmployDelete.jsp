<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>招聘信息删除</title>
	</head>
	<body>
	<%
		//响应设置
		response.setContentType("text/html");  
		response.setHeader("Cache-Control", "no-store");  
		response.setHeader("Pragma", "no-cache");  
		response.setCharacterEncoding("utf-8");
		response.setDateHeader("Expires", 0); 
		
		String eID=request.getParameter("eID");
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/managesystem", "root", "123456");
		Statement stat=conn.createStatement();
		String deleteSQL="delete from employ where eID='"+eID+"'";
		stat.executeUpdate(deleteSQL);
 		stat.close();
 		conn.close();
	%>
	</body>
</html>