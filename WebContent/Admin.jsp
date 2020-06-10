<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>系统管理界面</title>
		<link rel="stylesheet" type="text/css" href="CSS/main.css">
		<script type="text/javascript" src="javascript/top.js"></script>
		<style type="text/css">
			
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
			<div class="user">
				<%=session.getAttribute("userName")%>
				<ul>
					<li><a href="Account.jsp">账号管理</a></li>
					<li><a href="Exit.jsp">退出</a></li>
				</ul>
			</div>
		</div>
		<div>
			
		</div>
	</body>
</html>