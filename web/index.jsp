<%-- 
    Document   : index
    Created on : 02/04/2019, 1:14:52 PM
    Author     : mougi
--%>

<%@page import="isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store Online</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
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
                <form method="post" action="index.jsp">
                    <input type="HIDDEN" name="logout" value="invalidate">
                    <input class="navbarTxt3" type="submit" value="Logout"><!--this was going to be a button with javascript but using a form has the same effect-->
                </form>
                <%  }
                %>
            </div>
        </div>
        <div class="first">
            <div class="text">
                <p><strong>Movie Store Online</strong></p>
            </div>
        </div>
        <div class="second">
            <div class="fifth">
                <h2>"Because Dvds never go out of fashion"</h2>
                <h4>Services</h4>
                <p>Here at 'Movie Store Online' we are dedicated to proving the newest and greatest movies of all time to out customers</p>
                <p>Movies delivered within a week or they're free</p>
                <p>Place and order now</p>
            </div>
        </div>
        <div class="third">

        </div>
    </body>
</html>
