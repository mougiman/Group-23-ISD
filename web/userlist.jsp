<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>userlist</title>
<style type="text/css">
	p{color:white;text-align:center;}
</style>
</head>
<body>
	<div class="sixth">
		<div class="seventh">
			<form method="get" action="UserController1">
				<center>
				  <h4 style="color: black; font-size:20px">search</h4>
					  <a href="adduser.jsp"><input type="button" value="Add user" style="color:#090"></a>
					  <input type="text" size="30" name="fullname" placeholder="full name" style="align:center">
					  <input type="text" size="30" name="phone"  placeholder="phone number" style="align:center">
				  	  <input type="submit" value="search" style="color:#090">
				  </center>
			  </form>
			<table class="tablescroll" style="background-color: black;width:90%;margin:auto;">
				<thead>
					<tr>
						<td><p class="p4">ID</p></td>
						<td><p class="p4">Username</p></td>
						<td><p class="p4">Email</p></td>
						<td><p class="p4">DOB</p></td>
						<td><p class="p4">PhoneNumber</p></td>
						<td><p class="p4">Operation</p></td>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="l">
						<tr>
							<td><p class="p3">${l.userID }</p></td>
							<td><p class="p3">${l.username }</p></td>
							<td><p class="p3">${l.email }</p></td>
							<td><p class="p3">${l.DOB }</p></td>
							<td><p class="p3">${l.phone }</p></td>
							<td><p class="p3">
									<a href="UserController1?opr=activate&id=${l.userID }"><input type="button" value="Activite"></a>
									<a href="UserController1?opr=deactivate&id=${l.userID }"><input type="button" value="Deactivite"></a>
									<a href="UserController1?opr=delete&id=${l.userID }"><input type="button" value="Delete"></a>
								</p>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


		</div>
	</div>
</body>
</html>