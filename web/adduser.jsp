<%@ page language="java" import="java.util.*" pageEncoding="BIG5"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'adduser.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>

<body>
	<form action="UserController1?opr=add" method="post">
	<div style="background-color: black">
		<h4 style="color: white; font-size:20px">name</h4>
		<input type="text" name="name" size="30" style="align:center">
		<h4 style="color: white; font-size:20px">username</h4>
		<input type="text" name="username" size="30" style="align:center">
		<h4 style="color: white; font-size:20px">password</h4>
		<input type="text" name="password" size="30" style="align:center">
		<h4 style="color: white; font-size:20px">email</h4>
		<input type="text" name="email" size="30" style="align:center">
		<h4 style="color: white; font-size:20px">phone number</h4>
		<input type="text" name="phone" size="30" style="align:center">
		<br> <input type="submit" value="Add">
	</div>
	</form>
</body>
</html>
