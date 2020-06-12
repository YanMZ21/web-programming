<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>招聘管理界面</title>
		<link rel="stylesheet" type="text/css" href="CSS/main.css">
		<link rel="stylesheet" type="text/css" href="CSS/worker.css">
		<script type="text/javascript" src="javascript/top.js"></script>
		<script type="text/javascript">
			function showAdd(){
				document.getElementById("add").style.display="block";
				document.getElementById("update").style.display="none";
				document.getElementById("delete").style.display="none";
				document.getElementById("employ").style.display="none";
			}
			function hideAdd(){
				document.getElementById("add").style.display="none";
			}
			function showUpdate(){
				document.getElementById("update").style.display="block";
				document.getElementById("add").style.display="none";
				document.getElementById("delete").style.display="none";
				document.getElementById("employ").style.display="none";
			}
			function hideUpdate(){
				document.getElementById("update").style.display="none";
			}
			function showDelete(){
				document.getElementById("delete").style.display="block";
				document.getElementById("add").style.display="none";
				document.getElementById("update").style.display="none";
				document.getElementById("employ").style.display="none";
			}
			function hideDelete(){
				document.getElementById("delete").style.display="none";
			}
			function showEmploy(){
				document.getElementById("employ").style.display="block";
				document.getElementById("add").style.display="none";
				document.getElementById("update").style.display="none";
				document.getElementById("delete").style.display="none";
			}
			function hideEmploy(){
				document.getElementById("employ").style.display="none";
			}
			function queryEmploy(){
				var attribute=document.getElementById("attribute").value;
				var values=document.getElementById("values").value;
				var xmlhttp=new XMLHttpRequest();
				xmlhttp.onreadystatechange=function(){
					if (xmlhttp.readyState==4 && xmlhttp.status==200)
					{
				    	document.getElementById("txtShow").innerHTML=xmlhttp.responseText;
				    }
				}
				xmlhttp.open("GET","EmployChange/EmployQuery.jsp?attribute="+attribute+"&values="+values,true);
				xmlhttp.send();
			}
			function addEmploy(){
				var addID=document.getElementById("addID").value;
				var addName=document.getElementById("addName").value;
				var addSex=document.getElementById("addSex").value;
				var addD=document.getElementById("addD").value;
				if(addID==""||addName==""||addSex==""||addD==""){
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
				xmlhttp.open("GET","EmployChange/EmployAdd.jsp?eID="+addID+"&eName="+addName+"&eSex="+addSex+"&eDID="+addD,true);
				xmlhttp.send();
			}
			function updateEmploy(){
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
				xmlhttp.open("GET","EmployChange/EmployUpdate.jsp?eID="+updateID+"&select="+updateSelect+"&content="+updateContent,true);
				xmlhttp.send();
			}
			function deleteEmploy(){
				var deleteID=document.getElementById("deleteID").value;
				var xmlhttp=new XMLHttpRequest();
				xmlhttp.onreadystatechange=function(){
					if (xmlhttp.readyState==4 && xmlhttp.status==200)
					{
						window.location.reload();
				    }
				}
				xmlhttp.open("GET","EmployChange/EmployDelete.jsp?eID="+deleteID,true);
				xmlhttp.send();
			}
			function employ(){
				var employID=document.getElementById("employID").value;
				var staffID=document.getElementById("staffID").value;
				var employSalary=document.getElementById("employSalary").value;
				var xmlhttp=new XMLHttpRequest();
				xmlhttp.onreadystatechange=function(){
					if (xmlhttp.readyState==4 && xmlhttp.status==200)
					{
						window.location.reload();
				    }
				}
				xmlhttp.open("GET","EmployChange/Employee.jsp?eID="+employID+"&sID="+staffID+"&eSalary="+employSalary,true);
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
					<li><a href="Staff.jsp">员工管理</a></li>
					<li><a href="Employ.jsp"  id="checked">招聘管理</a></li>
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
			<div id="query" style="width:560px;">
				<select id="attribute" style="height:30px;">
					<option value="eID">编号</option>
					<option value="eName">姓名</option>
					<option value="eDID">期望部门</option>
				</select>
				<input type="text" id="values" style="height:28px;">
				<input type="button" value="查询" onclick="queryEmploy()" class="button-style">
				<input  type="button" value="添加记录" onclick="showAdd()" class="button-style">
				<input  type="button" value="修改记录" onclick="showUpdate()" class="button-style">
				<input  type="button" value="删除记录" onclick="showDelete()" class="button-style">
				<input  type="button" value="人员招聘" onclick="showEmploy()" class="button-style">
			</div>
			<div id="txtShow"></div>
			<div id="add" class="block">
				<p>添加信息</p>
				<label for="addID">编号:</label><input type="text" id="addID"><br/>
				<label for="addName">姓名:</label><input type="text" id="addName"><br/>
				<label for="addSex">性别:</label><input type="text" id="addSex"><br/>
				<label for="addD">期望部门编号:</label><input type="text" id="addD"><br/>
				<div id="addError"></div>
				<div class="position">
					<input type="button" value="添加" class="button-style" onclick="addEmploy()">
					<input type="button" value="取消" class="button-style" onclick="hideAdd()">
				</div>
			</div>
			<div id="update" class="block">
				<p>修改信息（编号不可修改）</p>
				<label for="updateID">要修改记录编号:</label><input type="text" id="updateID"><br/>
				<select id="updateSelect" style="height:30px;">
					<option value="eName">姓名</option>
					<option value="eDID">部门编号</option>
				</select>
				<input type="text" id="updateContent" style="height:28px;">
				<div id="updateError"></div>
				<div class="position">
					<input type="button" value="修改" class="button-style" onclick="updateEmploy()">
					<input type="button" value="取消" class="button-style" onclick="hideUpdate()">
				</div>
			</div>
			<div id="delete" class="block">
				<p>删除信息</p>
				<label for="deleteID">要删除员工员工号:</label><input type="text" id="deleteID"><br/>
				<div id="deleteError"></div>
				<div class="position">
					<input type="button" value="删除" class="button-style" onclick="deleteEmploy()">
					<input type="button" value="取消" class="button-style" onclick="hideDelete()">
				</div>
			</div>
			<div id="employ" class="block">
				<p>招聘信息</p>
				<label for="employID">要招聘人员编号:</label><input type="text" id="employID"><br/>
				<label for="staffID">设置员工号:</label><input type="text" id="staffID"><br/>
				<label for="employSalary">薪水设置:</label><input type="text" id="employSalary"><br/>
				<div id="employError"></div>
				<div class="position">
					<input type="button" value="招聘" class="button-style" onclick="employ()">
					<input type="button" value="取消" class="button-style" onclick="hideEmploy()">
				</div>
			</div>
		</div>
	</body>
</html>