<%-- 
    Document   : login
    Created on : 09/04/2019, 12:06:15 PM
    Author     : mougi
--%>

<%@page import="isd.model.User"%>
<%@page import="isd.model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <% String filePath = application.getRealPath("WEB-INF/users.xml");%>
        <jsp:useBean id="usersApp" class="isd.model.usersApp" scope="application">
            <jsp:setProperty name="usersApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean> 
        <div class="navbar">
            <div class="navbar2">
                <a class="navbarTxt" href="index.jsp">Main</a>
                <a class="navbarTxt" href="catalogue.jsp">Movies</a>
                <%  //add check user //if(user == null){
                %>
                <a class="navbarTxt" href="register.jsp">Register</a>
                <a class="navbarTxt" href="login.jsp">Login</a>
                <%  //}
                %>
            </div>
        </div>
        <div class="filler1"></div>
        <div class="second">
            <div class="fourth">
                <%
                    String uname = request.getParameter("userName");
                    String pword = request.getParameter("password");
                    Users users = usersApp.getUsers();
                    if (uname != null) {  //if this is the first time accessng the link, display form, else, perform users.login
                        User user = users.login(uname, pword);
                        if (user != null) {
                            session.setAttribute("user", user);
                %>
                <p>Login Successful</p>
                <p>Click <a href="main.jsp">here</a> to proceed</p>
                <%} else {%>
                <p>Login failed</p>                     /
                <p>Click <a href="login.jsp">here</a> to try again</p>
                <%}
                } else {%>
                <h2>Login</h2>
                <form method="post" action="login.jsp">
                    <table>
                        <tr><td>Username :</td><td><input type="text" name="userName"></td></tr>
                        <tr><td>Password :</td><td><input type="password" name="password"></td></tr>
                        <tr><td></td><td><input type="submit" value="Login"></td></tr>
                    </table>            
                </form>
                <p>Click here to <u><a href="register.jsp">Register</a></u>.</p>
                        <%}%>
            </div>
            <div class="filler1"></div>
            <div class="third">

            </div>
    </body>
</html>
