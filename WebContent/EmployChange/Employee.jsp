<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>招聘</title>
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
		String sID=request.getParameter("sID");
		float sSalary=Float.parseFloat(request.getParameter("eSalary"));
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/managesystem", "root", "123456");
		Statement stat=conn.createStatement();
		String querySQL="select * from employ where eID='"+eID+"'";
		ResultSet rs=stat.executeQuery(querySQL);
		if(rs.next()){
			String sName=rs.getString("eName");
			String sSex=rs.getString("eSex");
			String sDID=rs.getString("eDID");
			String insertSQL="insert into staff values ('"+sID+"','"+sName+"','"+sSex+"','"+sDID+"','"+sSalary+"')";
			stat.executeUpdate(insertSQL);
			String deleteSQL="delete from employ where eID='"+eID+"'";
			stat.executeUpdate(deleteSQL);
		}
		
		rs.close();
 		stat.close();
 		conn.close();
	%>
	</body>
</html>