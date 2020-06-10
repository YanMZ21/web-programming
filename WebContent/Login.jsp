<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>登录界面</title>
		<style>
			body{ 
				margin:0;
				padding:0;
				text-align:center;
				background-image: url(images/login_bg.jpg);
			}
			#message{
				color:red;
			}
			#content{
				margin:10% auto;
				padding:20px;
				width:400px;
				height:200px;
				background-image: url(images/password_bg.jpg);
				border:2px solid;
				border-radius:10px;
			}
			#content div{
				margin:0;
				padding:0;
				border:none;
				outline: none;
			}
		</style>
	</head>
	<body>
		<div id="content">
			<h3>人力资源管理系统</h3>
			<form method="post" action="LoginCheck.jsp">
				<div>
					账户:<input type="text" name="userName" style="width:150px;height:16">
				</div>
				<br/>
				<div>
					密码:<input type="password" name="psd" style="width:150px;height:16">
				</div>
				<span id="message">
				<%
					if(request.getParameter("message")!=null){
						out.print(request.getParameter("message"));
					}
				%>
				</span>
				<br/>
				<br/>
				<div><input type="submit" value="登录"></div>
			</form>
		</div>
	</body>
</html>