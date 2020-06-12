<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>部门管理界面</title>
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
				width:140px;
				margin:10px auto;
			}
		</style>
		<script type="text/javascript">
			function showAdd(){
				document.getElementById("add").style.display="block";
				document.getElementById("delete").style.display="none";
			}
			function hideAdd(){
				document.getElementById("add").style.display="none";
				document.getElementById("delete").style.display="none";
			}
			function showDelete(){
				document.getElementById("delete").style.display="block";
				document.getElementById("add").style.display="none";
			}
			function hideDelete(){
				document.getElementById("delete").style.display="none";
				document.getElementById("add").style.display="none";
			}
			function addDepartment(){
				var addID=document.getElementById("addID").value;
				var addName=document.getElementById("addName").value;
				if(addID==""||addName==""){
					document.getElementById("addError").innerHTML="*信息请填写完整";
					return;
				}
				var xmlhttp=new XMLHttpRequest();
				xmlhttp.onreadystatechange=function(){
					if (xmlhttp.readyState==4 && xmlhttp.status==200)
					{
						document.getElementById("addError").innerHTML=xmlhttp.responseText;
						window.location.reload();
				    }
				}
				xmlhttp.open("GET","DepartmentChange/DepartmentAdd.jsp?dID="+addID+"&dName="+addName,true);
				xmlhttp.send();
			}
			function deleteDepartment(){
				var deleteID=document.getElementById("deleteID").value;
				var xmlhttp=new XMLHttpRequest();
				var message;
				xmlhttp.onreadystatechange=function(){
					if (xmlhttp.readyState==4 && xmlhttp.status==200)
					{
						document.getElementById("deleteError").innerHTML=xmlhttp.responseText;
						window.location.reload();
				    }
				}
				xmlhttp.open("GET","DepartmentChange/DepartmentDelete.jsp?dID="+deleteID,true);
				xmlhttp.send();
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
					<li><a href="Department.jsp"  id="checked">部门管理</a></li>
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
			<h2>所有部门</h2>
		<%
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/managesystem", "root", "123456");
 			Statement stat=conn.createStatement();
 			String querySQL="select * from department";
 			ResultSet rs=stat.executeQuery(querySQL);
 		%>
 			<table id="ta">
 				<tr><th>部门编号</th><th>部门名</th></tr>
 			<%
 				while(rs.next()){
 			%>
 					<tr><td><%=rs.getString("dID")%></td><td><%=rs.getString("dName")%></td></tr>
 			<%
 				}
	 			rs.close();
	 	 		stat.close();
	 	 		conn.close();
			%>
 			</table>
 			<div id="b">
 				<input type="button" value="添加部门" class="button-style" onclick="showAdd()">
				<input type="button" value="删除部门" class="button-style" onclick="showDelete()">
 			</div>
 			<div id="add" class="block">
				<p>添加信息</p>
				<label for="addID">部门编号:</label><input type="text" id="addID"><br/>
				<label for="addName">部门名:</label><input type="text" id="addName"><br/>
				<div id="addError"></div>
				<div class="position">
					<input type="button" value="添加" class="button-style" onclick="addDepartment()">
					<input type="button" value="取消" class="button-style" onclick="hideAdd()">
				</div>
			</div>
			<div id="delete" class="block">
				<p>添加信息</p>
				<label for="deleteID">要删除部门编号:</label><input type="text" id="deleteID"><br/>
				<div id="deleteError"></div>
				<div class="position">
					<input type="button" value="删除" class="button-style" onclick="deleteDepartment()">
					<input type="button" value="取消" class="button-style" onclick="hideAdd()">
				</div>
			</div>
		</div>
	</body>
</html>