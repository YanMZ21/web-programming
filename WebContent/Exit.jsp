<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>退出登录</title>
	</head>
	<body>
		<%session.setAttribute("userName", null);%>
		<jsp:forward page="Login.jsp"></jsp:forward>
	</body>
</html>