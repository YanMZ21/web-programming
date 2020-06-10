<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>员工管理界面</title>
		<link rel="stylesheet" type="text/css" href="CSS/main.css">
		<script type="text/javascript" src="javascript/top.js"></script>
		<style type="text/css">
			.button-style{
				padding:5px;
			}
			.position{
				margin:5px 160px;
				width:100px;
			}
			#content{
				width:800px;
				height:400px;
				border-radius:30px;
				border:1px solid;
				background-color:#F5F5DC;
				margin:5% auto;
			}
			#query{
				width:350px;
				margin:5% auto;
			}
			#add{
				width:400px;
				height:200px;
				margin:5% auto;
				display:none;
				border:1px solid;
				border-radius:30px;
			}
			#add p{
				margin:20px 70px;
				margin-bottom:10px;
				font-weight:bold;
			}
			#add input{
				height:28px;
				margin-top:5px;
			}
			#add label{
				text-align:right;
				display: inline-block;
				width:160px;
				margin-right:10px;
			}
		</style>
		<script type="text/javascript">
			function showAdd(){
				document.getElementById("add").style.display="block";
			}
			function hideAdd(){
				document.getElementById("add").style.display="none";
			}
			function queryStaff(){
				var attribute=document.getElementById("attribute").value;
				var values=document.getElementById("values").value;
				
			}
		</script>
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
		<div id="content">
			<div id="query">
				<select id="attribute" style="height:30px;">
					<option value="sID">员工号</option>
					<option value="sName">姓名</option>
					<option value="sDID">所在部门</option>
					<option value="sSalary>">薪水大于</option>
					<option value="sSalary<">薪水小于</option>
				</select>
				<input type="text" id="values" style="height:28px;">
				<input type="button" value="查询" onclick="queryStaff()" class="button-style">
				<input  type="button" value="添加记录" onclick="showAdd()" class="button-style">
			</div>
			<div id="add">
				<p>添加信息</p>
				<label for="name">姓名:</label><input type="text" id="name"><br/>
				<label for="department">所在部门编号:</label><input type="text" id="department"><br/>
				<label for="salary">工资:</label><input type="text" id="salary"><br/>
				<div class="position">
					<input type="button" value="添加" class="button-style" onclick="">
					<input type="button" value="取消" class="button-style" onclick="hideAdd()">
				</div>
			</div>
		</div>
	</body>
</html>