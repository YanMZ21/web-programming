<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>主界面</title>
		<link rel="stylesheet" type="text/css" href="CSS/main.css">
		<script type="text/javascript" src="javascript/top.js"></script>
		<style type="text/css">
			#content{
				width:800px;
				margin:15% auto;
				font-size:200%;
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
					<li><a href="Main.jsp" id="checked">首页</a></li>
					<li><a href="Department.jsp">部门管理</a></li>
					<li><a href="Staff.jsp">员工管理</a></li>
					<li><a href="Employ.jsp">招聘管理</a></li>
					<li><a href="RPManage.jsp">奖惩管理</a></li>
					<li><a href="Admin.jsp">管理员列表</a></li>
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
			<h1>欢迎进入人力资源管理系统</h1>
		</div>
	</body>
</html>