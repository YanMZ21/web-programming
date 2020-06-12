<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>员工信息删除</title>
	</head>
	<body>
	<%
		//响应设置
		response.setContentType("text/html");  
		response.setHeader("Cache-Control", "no-store");  
		response.setHeader("Pragma", "no-cache");  
		response.setCharacterEncoding("utf-8");
		response.setDateHeader("Expires", 0); 
		
		String sID=request.getParameter("sID");
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/managesystem", "root", "123456");
		Statement stat=conn.createStatement();
		String querySQL="select * from account where aSID='"+sID+"'";
		ResultSet rs=stat.executeQuery(querySQL);
		if(!rs.next()){
			String deleteSQL="delete from staff where sID='"+sID+"'";
			stat.executeUpdate(deleteSQL);
		}
		else{
			response.getWriter().write("*该员工为管理员");
		}
		rs.close();
 		stat.close();
 		conn.close();
	%>
	</body>
</html>