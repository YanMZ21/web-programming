<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>员工信息查询</title>
	</head>
	<body>
	<% 
		//响应设置
		response.setContentType("text/html");  
		response.setHeader("Cache-Control", "no-store");  
		response.setHeader("Pragma", "no-cache");  
		response.setCharacterEncoding("utf-8");
		response.setDateHeader("Expires", 0);
		
		//从Staff页面取值形成SQL语句
		String attribute=request.getParameter("attribute");
		String values=request.getParameter("values");
		String querySQL;
		if(values.equals("")||values==null){
			querySQL="select * from staff";
		}
		else{
			querySQL="select * from staff where "+attribute+"='"+values+"'";
		}
		
		//数据库连接，此处数据库账户名为“root”，密码为123456
		Class.forName("com.mysql.jdbc.Driver");
 		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/managesystem", "root", "123456");
 		Statement stat=conn.createStatement();
 		ResultSet rs=stat.executeQuery(querySQL);
 		
 		//以表格形式显示查询结果
 		response.getWriter().write("<table>");
 		response.getWriter().write("<tr><th>员工号</th><th>姓名</th><th>性别</th><th>部门编号</th><th>工资</th></tr>");
 		while(rs.next()){
 			response.getWriter().write("<tr>");
 			response.getWriter().write("<td>"+rs.getString("sID")+"</td>");
 			response.getWriter().write("<td>"+rs.getString("sName")+"</td>");
 			response.getWriter().write("<td>"+rs.getString("sSex")+"</td>");
 			response.getWriter().write("<td>"+rs.getString("sDID")+"</td>");
 			response.getWriter().write("<td>"+rs.getFloat("sSalary")+"</td>");
 			response.getWriter().write("</tr>");
 		}
 		response.getWriter().write("</table>");
 		
 		//关闭连接
 		rs.close();
 		stat.close();
 		conn.close();
	%>
	</body>
</html>