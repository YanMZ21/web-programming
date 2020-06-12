<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>密码比对</title>
	</head>
	<body>
	<%
		String userName=request.getParameter("userName");
 		String password=request.getParameter("psd");
 		if(userName==""||password==""){
 		%>
 			<jsp:forward page="Login.jsp">
 				<jsp:param name="message" value="Account and password cannot be empty!" />
 			</jsp:forward>
 		<%
 		}
 		else{
	 		Class.forName("com.mysql.jdbc.Driver");
	 		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/managesystem", "root", "123456");
	 		Statement stat=conn.createStatement();
	 		String querySQL="select * from account where username='"+userName+"'and password='"+password+"'";
	 		ResultSet rs=stat.executeQuery(querySQL);
	 		if(rs.next()){
	 			session.setAttribute("userName", userName);	
	 		%>
	 			<jsp:forward page="Main.jsp"></jsp:forward>
	 		<%
	 		}
	 		else{
	 		%>
	 			<jsp:forward page="Login.jsp">
	 				<jsp:param name="message" value="Account or password is wrong!" />
	 			</jsp:forward>
	 		<%
	 		}
	 		rs.close();
	 		stat.close();
	 		conn.close();
 		}
 	%>
	</body>
</html>