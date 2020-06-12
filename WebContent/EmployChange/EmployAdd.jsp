<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>招聘信息增加</title>
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
		String eID=request.getParameter("eID");
		String eName=request.getParameter("eName");
		String eSex=request.getParameter("eSex");
		String eDID=request.getParameter("eDID");
		
		//数据库连接，此处数据库账户名为“root”，密码为123456
		Class.forName("com.mysql.jdbc.Driver");
 		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/managesystem", "root", "123456");
 		Statement stat=conn.createStatement();
 		
 		//判断添加的主键是否冲突
 		String querySQL="select * from employ where eID='"+eID+"'";
 		ResultSet rs=stat.executeQuery(querySQL);
 		if(rs.next()){//冲突，返回错误信息
 			response.getWriter().write("*员工号已存在");
 		}
 		else{//不冲突，添加信息
 			response.getWriter().write("");
 			String insertSQL="insert into employ values ('"+eID+"','"+eName+"','"+eSex+"','"+eDID+"')";
 			stat.executeUpdate(insertSQL);
 		}
 		
 		//关闭连接
 		rs.close();
 		stat.close();
 		conn.close();
	%>
	</body>
</html>