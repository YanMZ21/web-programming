<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>员工管理界面</title>
		<link rel="stylesheet" type="text/css" href="CSS/main.css">
		<link rel="stylesheet" type="text/css" href="CSS/worker.css">
		<script type="text/javascript" src="javascript/top.js"></script>
		<script type="text/javascript">
			function showAdd(){
				document.getElementById("add").style.display="block";
				document.getElementById("update").style.display="none";
				document.getElementById("delete").style.display="none";
			}
			function hideAdd(){
				document.getElementById("add").style.display="none";
			}
			function showUpdate(){
				document.getElementById("update").style.display="block";
				document.getElementById("add").style.display="none";
				document.getElementById("delete").style.display="none";
			}
			function hideUpdate(){
				document.getElementById("update").style.display="none";
			}
			function showDelete(){
				document.getElementById("delete").style.display="block";
				document.getElementById("add").style.display="none";
				document.getElementById("update").style.display="none";
			}
			function hideDelete(){
				document.getElementById("delete").style.display="none";
			}
			function queryStaff(){
				var attribute=document.getElementById("attribute").value;
				var values=document.getElementById("values").value;
				var xmlhttp=new XMLHttpRequest();
				xmlhttp.onreadystatechange=function(){
					if (xmlhttp.readyState==4 && xmlhttp.status==200)
					{
				    	document.getElementById("txtShow").innerHTML=xmlhttp.responseText;
				    }
				}
				xmlhttp.open("GET","StaffChange/StaffQuery.jsp?attribute="+attribute+"&values="+values,true);
				xmlhttp.send();
			}
			function addStaff(){
				var addID=document.getElementById("addID").value;
				var addName=document.getElementById("addName").value;
				var addSex=document.getElementById("addSex").value;
				var addD=document.getElementById("addD").value;
				var addSalary=document.getElementById("addSalary").value;
				if(addID==""||addName==""||addSex==""||addD==""||addSalary==""){
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
				xmlhttp.open("GET","StaffChange/StaffAdd.jsp?sID="+addID+"&sName="+addName+"&sSex="+addSex+"&sDID="+addD+"&sSalary="+addSalary,true);
				xmlhttp.send();
			}
			function updateStaff(){
				var updateID=document.getElementById("updateID").value;
				var updateSelect=document.getElementById("updateSelect").value;
				var updateContent=document.getElementById("updateContent").value;
				if(updateID==""||updateSelect==""){
					document.getElementById("updateError").innerHTML="*信息请填写完整";
					return;
				}
				var xmlhttp=new XMLHttpRequest();
				xmlhttp.onreadystatechange=function(){
					if (xmlhttp.readyState==4 && xmlhttp.status==200)
					{
						window.location.reload();
				    }
				}
				xmlhttp.open("GET","StaffChange/StaffUpdate.jsp?sID="+updateID+"&select="+updateSelect+"&content="+updateContent,true);
				xmlhttp.send();
			}
			function deleteStaff(){
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
					<li><a href="Staff.jsp"  id="checked">员工管理</a></li>
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
			<div id="query">
				<select id="attribute" style="height:30px;">
					<option value="sID">员工号</option>
					<option value="sName">姓名</option>
					<option value="sDID">部门编号</option>
					<option value="sSalary">薪水</option>
				</select>
				<input type="text" id="values" style="height:28px;">
				<input type="button" value="查询" onclick="queryStaff()" class="button-style">
				<input  type="button" value="添加记录" onclick="showAdd()" class="button-style">
				<input  type="button" value="修改记录" onclick="showUpdate()" class="button-style">
				<input  type="button" value="删除记录" onclick="showDelete()" class="button-style">
			</div>
			<div id="txtShow"></div>
			<div id="add" class="block">
				<p>添加信息</p>
				<label for="addID">员工号:</label><input type="text" id="addID"><br/>
				<label for="addName">姓名:</label><input type="text" id="addName"><br/>
				<label for="addSex">性别:</label><input type="text" id="addSex"><br/>
				<label for="addD">所在部门编号:</label><input type="text" id="addD"><br/>
				<label for="addSalary">工资:</label><input type="text" id="addSalary"><br/>
				<div id="addError"></div>
				<div class="position">
					<input type="button" value="添加" class="button-style" onclick="addStaff()">
					<input type="button" value="取消" class="button-style" onclick="hideAdd()">
				</div>
			</div>
			<div id="update" class="block">
				<p>修改信息（员工号不可修改）</p>
				<label for="updateID">要修改员工员工号:</label><input type="text" id="updateID"><br/>
				<select id="updateSelect" style="height:30px;">
					<option value="sName">姓名</option>
					<option value="sDID">部门编号</option>
					<option value="sSalary">薪水</option>
				</select>
				<input type="text" id="updateContent" style="height:28px;">
				<div id="updateError"></div>
				<div class="position">
					<input type="button" value="修改" class="button-style" onclick="updateStaff()">
					<input type="button" value="取消" class="button-style" onclick="hideUpdate()">
				</div>
			</div>
			<div id="delete" class="block">
				<p>删除信息（管理员信息无法删除）</p>
				<label for="deleteID">要删除员工员工号:</label><input type="text" id="deleteID"><br/>
				<div id="deleteError"></div>
				<div class="position">
					<input type="button" value="删除" class="button-style" onclick="deleteStaff()">
					<input type="button" value="取消" class="button-style" onclick="hideDelete()">
				</div>
			</div>
		</div>
	</body>
</html>