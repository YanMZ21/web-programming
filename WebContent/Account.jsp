<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>账号管理界面</title>
		<link rel="stylesheet" type="text/css" href="CSS/main.css">
		<link rel="stylesheet" type="text/css" href="CSS/account.css">
		<script type="text/javascript">
			window.onload=function(){
				var tab=document.getElementById("tab");
				var topic=tab.getElementsByTagName("li");
				var content=document.getElementById("content");
				var div=content.getElementsByTagName("div");
				for(var i=0; i<topic.length ;i++){
					topic[i].index=i;
					topic[i].onclick=function(){
						for(var j=0; j<topic.length ;j++){
							topic[j].className='';
							div[j].className='hide';
						}
						topic[this.index].className='act';
						div[this.index].className='';
					}
				}
			}
			function comparePsd(strc){
				var strp=document.getElementById("password").value;
				var info=document.getElementById("error");
				var sub=document.getElementById("sub");
				if(strp!=strc){
					info.style.display='block';
					sub.style.display='none';
				}
				else{
					info.style.display='none';
					sub.style.display='block';
				}
			}
			function submitPsd(){
				
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
					<li><a href="RPManage.jsp">奖惩管理</a></li>
					<li><a href="Admin.jsp">系统管理</a></li>
				</ul>
			</div>
		</div>
	<% 
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/managesystem", "root", "123456");
		Statement stat=conn.createStatement();
		String userName=(String)session.getAttribute("userName");
		String ID="账号异常";
		String name="账号异常";
		String department="账号异常";
		String querySQL1="select aSID from account where username='"+userName+"'";
		ResultSet rs=stat.executeQuery(querySQL1);
		if(rs.next()){
			ID=rs.getString("aSID");
			String querySQL2="select * from staff where sID='"+ID+"'";
			rs=stat.executeQuery(querySQL2);
			if(rs.next()){
				name=rs.getString("sName");
				String dID=rs.getString("sDID");
				String querySQL3="select * from department where dID='"+dID+"'";
				rs=stat.executeQuery(querySQL3);
				if(rs.next()){
					department=rs.getString("dName");
				}
			}
			rs.close();
		}
		rs.close();
 		stat.close();
 		conn.close();
	%>
		<div id="footer">
			<div class="box">
				<img src="images/icon_account.png"/>
				<hr/>
				<h3>账号管理</h3>
				<ul id="tab">
					<li class="act">基本信息</li>
					<li>密码更改</li>
				</ul>
			</div>
			<div id="content">
				<div>
					<p>基本信息</p>
					<ul class="info">
						<li><span>昵称:</span><%=userName%></li>
						<li><span>姓名:</span><%=name%></li>
						<li><span>工号:</span><%=ID%></li>
						<li><span>部门:</span><%=department%></li>
					</ul>
				</div>
				<div class="hide">
					<p>密码更改</p>
					<form method="post" action="AccountChangeSuccess.jsp">
					<ul class="info">
						<li><span>修改密码:</span><input type="password" id="password" size=20></li>
						<li><span>确认密码:</span><input type="password" id="confirm" name="confirmPsd" size=20 onkeyup="comparePsd(this.value)"></li>
						<li id="error">*确认密码与输入密码不一致</li>
					</ul>
					<input type="submit" value="提交" id="sub" style="padding:5px;margin-left:30%;display:none;">
					</form>
				</div>
			</div>
		</div>
	</body>
</html>