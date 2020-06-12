<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>奖惩管理界面</title>
		<link rel="stylesheet" type="text/css" href="CSS/main.css">
		<link rel="stylesheet" type="text/css" href="CSS/worker.css">
		<script type="text/javascript" src="javascript/top.js"></script>
		<script type="text/javascript">
			function showAdd(){
				document.getElementById("add").style.display="block";
				document.getElementById("delete").style.display="none";
			}
			function hideAdd(){
				document.getElementById("add").style.display="none";
			}
			function showDelete(){
				document.getElementById("delete").style.display="block";
				document.getElementById("add").style.display="none";
			}
			function hideDelete(){
				document.getElementById("delete").style.display="none";
			}
			function queryRP(){
				var attribute=document.getElementById("attribute").value;
				var values=document.getElementById("values").value;
				var xmlhttp=new XMLHttpRequest();
				xmlhttp.onreadystatechange=function(){
					if (xmlhttp.readyState==4 && xmlhttp.status==200)
					{
				    	document.getElementById("txtShow").innerHTML=xmlhttp.responseText;
				    }
				}
				xmlhttp.open("GET","RPChange/RPQuery.jsp?attribute="+attribute+"&values="+values,true);
				xmlhttp.send();
			}
			function addRP(){
				var addID=document.getElementById("addID").value;
				var addSID=document.getElementById("addSID").value;
				var addSalary=document.getElementById("addSalary").value;
				if(addID==""||addSID==""||addSalary==""){
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
				xmlhttp.open("GET","RPChange/RPAdd.jsp?rpID="+addID+"&rpSID="+addSID+"&rpSalary="+addSalary,true);
				xmlhttp.send();
			}
			function deleteRP(){
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
				xmlhttp.open("GET","StaffChange/StaffDelete.jsp?sID="+deleteID,true);
				xmlhttp.send();
			}
		</script>
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
					<li><a href="RPManage.jsp"  id="checked">奖惩管理</a></li>
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
			<div id="query">
				<select id="attribute" style="height:30px;">
					<option value="rpID">记录号</option>
					<option value="rpSID">员工号</option>
				</select>
				<input type="text" id="values" style="height:28px;">
				<input type="button" value="查询" onclick="queryRP" class="button-style">
				<input  type="button" value="添加记录" onclick="showAdd()" class="button-style">
				<input  type="button" value="删除记录" onclick="showDelete()" class="button-style">
			</div>
			<div id="txtShow"></div>
			<div id="add" class="block">
				<p>添加记录</p>
				<label for="addID">记录号:</label><input type="text" id="addID"><br/>
				<label for="addSID">员工号:</label><input type="text" id="addSID"><br/>
				<label for="addSalary">工资变动:</label><input type="text" id="addSalary"><br/>
				<div id="addError"></div>
				<div class="position">
					<input type="button" value="添加" class="button-style" onclick="addRP()">
					<input type="button" value="取消" class="button-style" onclick="hideAdd()">
				</div>
			</div>
			<div id="delete" class="block">
				<p>删除记录</p>
				<label for="deleteID">要删除员工员工号:</label><input type="text" id="deleteID"><br/>
				<div id="deleteError"></div>
				<div class="position">
					<input type="button" value="删除" class="button-style" onclick="deleteRP">
					<input type="button" value="取消" class="button-style" onclick="hideDelete()">
				</div>
			</div>
		</div>
	</body>
</html>