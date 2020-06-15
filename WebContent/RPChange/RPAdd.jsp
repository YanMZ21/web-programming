<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>奖惩记录增加</title>
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
		String rpID=request.getParameter("rpID");
		String rpSID=request.getParameter("rpSID");
		float rpSalary=Float.parseFloat(request.getParameter("rpSalary"));
		
		//数据库连接，此处数据库账户名为“root”，密码为123456
		Class.forName("com.mysql.jdbc.Driver");
 		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/managesystem", "root", "123456");
 		Statement stat=conn.createStatement();
 		
 		//判断添加的主键是否冲突
 		String querySQL1="select * from rp where rpID='"+rpID+"'";
 		ResultSet rs=stat.executeQuery(querySQL1);
 		if(rs.next()){//冲突，返回错误信息
 			response.getWriter().write("*记录号已存在");
 		}
 		else{//不冲突，添加信息
 			response.getWriter().write("");
 			String insertSQL="insert into rp values ('"+rpID+"','"+rpSID+"','"+rpSalary+"')";
 			stat.executeUpdate(insertSQL);
 			String querySQL2="select * from staff where sID='"+rpSID+"'";
 			rs=stat.executeQuery(querySQL2);
 			if(rs.next()){
 				float salary=rs.getFloat("sSalary");
	 			//response.getWriter().write(Float.toString(salary));
	 			salary+=rpSalary;
	 			//response.getWriter().write(Float.toString(salary));
	 			String sSalary=Float.toString(salary);
	 			String updateSQL="update staff set sSalary='"+sSalary+"' where sID='"+rpSID+"'";
	 			stat.executeUpdate(updateSQL);
 			}
 		}
 		
 		//关闭连接
 		rs.close();
 		stat.close();
 		conn.close();
	%>
	</body>
</html>