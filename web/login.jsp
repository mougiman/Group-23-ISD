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
        <%
            User user = (User) session.getAttribute("user");
            String logout = request.getParameter("logout");
            if (logout != null) {
                session.invalidate();
               // user = (User) session.getAttribute("user");
            }
        %>    
        <div class="navbar">
            <div class="navbar2">
                <a class="navbarTxt" href="index.jsp">Main</a>
                <a class="navbarTxt" href="catalogue.jsp">Movies</a>
            </div>
            <div class="navbar3">
                <%  if (user == null) {
                %>
                <a class="navbarTxt3" href="register.jsp">Register</a>
                <a class="navbarTxt3" href="login.jsp">Login</a>
                <%  } else {
                %>
                <p class="navbarTxt2"><%=user.getUserName()%></p>
                <form method="post" action="index.jsp" style="display: inline-block">
                    <input type="HIDDEN" name="logout" value="invalidate">
                    <input class="navbarTxt3" type="submit" value="Logout"><!--this was going to be a button with javascript but using a form has the same effect-->
                </form>
                <%  }
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
                        User newUser = users.login(uname, pword);
                        if (newUser != null) {
                            session.setAttribute("user", newUser);
                %>
                <p class="p1">Login Successful</p>
                <p class="p1">Click <a href="index.jsp">here</a> to proceed</p>
                <%} else {%>
                <p class="p1">Login failed</p>                     
                <p class="p1">Click <a href="login.jsp">here</a> to try again</p>
                <%}
                } else {%>
                <h2  class="p1">Login</h2>
                <form method="post" action="login.jsp">
                    <table>
                        <tr><td><p class="p1">Username :</p></td><td><input type="text" name="userName"></td></tr>
                        <tr><td><p class="p1">Password :</p></td><td><input type="password" name="password"></td></tr>
                        <tr><td></td><td><input type="submit" value="Login"></td></tr>
                    </table>            
                </form>
                <p class="p1">Click here to <u><a href="register.jsp">Register</a></u>.</p>
                        <%}%>
            </div>
            <div class="filler1"></div>
            <div class="third">

            </div>
    </body>
</html>
