<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>修改密码成功</title>
		<link rel="stylesheet" type="text/css" href="CSS/main.css">
		<script type="text/javascript" src="javascript/top.js"></script>
		<style type="text/css">
			a{
				color:gray;
			}
			#content div{
				width:200px;
				margin:5% auto;
				text-align:center;
			}
			#content{
				width:800px;
				margin:5% auto;
				border:1px solid;
				border-radius:30px;
				background-color:#F5F5DC;
			}
		</style>
	</head>
	<body>
	<%
		if(session.getAttribute("userName")==null){
		%>
			<jsp:forward page="Login.jsp"></jsp:forward>
		<%	
		}
	%>
		<div id="header">
			<img src="images/icons.png"/>
		</div>
		<div id="top-bar">
			<div class="bar">
				<ul>
					<li><a href="Main.jsp">首页</a></li>
					<li><a href="Department.jsp">部门管理</a></li>
					<li><a href="Staff.jsp">员工管理</a></li>
					<li><a href="Employ.jsp">招聘管理</a></li>
					<li><a href="Trainee.jsp">培训管理</a></li>
					<li><a href="RPManage.jsp">奖惩管理</a></li>
					<li><a href="Admin.jsp">系统管理</a></li>
				</ul>
			</div>
		</div>
		<div id="content">
		<%
			String password=request.getParameter("confirmPsd");
			String userName=(String)session.getAttribute("userName");
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/managesystem", "root", "123456");
			Statement stat=conn.createStatement();
			String updateSQL="update account set password='"+password+"' where userName='"+userName+"'";
			stat.executeUpdate(updateSQL);
		%>
				<div><h1>修改密码成功</h1></div>
				<div><a href="Account.jsp">返回账户管理页面</a></div>
		<%
	 		stat.close();
	 		conn.close();
		%>
		</div>
	</body>
</html>