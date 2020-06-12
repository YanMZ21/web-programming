<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>系统管理界面</title>
		<link rel="stylesheet" type="text/css" href="CSS/main.css">
		<link rel="stylesheet" type="text/css" href="CSS/worker.css">
		<script type="text/javascript" src="javascript/top.js"></script>
		<style type="text/css">
			#ta{
				width:500px;
				margin:10px auto;
				border:1px solid gray;
				border-collapse: collapse;
			}
			#ta tr{
				height:30px;
			}
			#ta th{
				border-bottom:1px solid gray;
				width:160px;
				text-align:center;
			}
			#ta td{
				width:200px;
				text-align:center;
			}
			#content h2{
				margin-top:30px;
				text-align:center;
			}
			#b{
				width:80px;
				margin:10px auto;
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
					<li><a href="Department.jsp" >部门管理</a></li>
					<li><a href="Staff.jsp">员工管理</a></li>
					<li><a href="Employ.jsp">招聘管理</a></li>
					<li><a href="RPManage.jsp">奖惩管理</a></li>
					<li><a href="Admin.jsp" id="checked">管理员列表</a></li>
				</ul>
			</div>
			<div class="user">
				<%=session.getAttribute("userName")%>
				<ul>
					<li><a href="Account.jsp">账号管理</a></li>
					<li><a href="Exit.jsp">退出</a></li>
				</ul>
			</div>
		</div>
		<div id="content">
			<h2>管理员列表</h2>
		<%
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/managesystem", "root", "123456");
 			Statement stat=conn.createStatement();
 			String querySQL="select * from account";
 			ResultSet rs=stat.executeQuery(querySQL);
 		%>
 			<table id="ta">
 				<tr><th>账户名</th><th>员工号</th></tr>
 			<%
 				while(rs.next()){
 			%>
 					<tr><td><%=rs.getString("userName")%></td><td><%=rs.getString("aSID")%></td></tr>
 			<%
 				}
	 			rs.close();
	 	 		stat.close();
	 	 		conn.close();
			%>
 			</table>
		</div>
	</body>
</html>