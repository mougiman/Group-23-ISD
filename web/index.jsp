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
        <div class="first">
            <div class="navbar-transparent" id="navbar">
                <div class="navbar2">
                    <a class="navbarTxt" href="index.jsp">MAIN</a>
                    <a class="navbarTxt" href="catalogue.jsp">MOVIES</a>

                    <%  if (user == null) {
                    %>
                    <a class="navbarTxt3" href="register.jsp">REGISTER</a>
                    <a class="navbarTxt3" href="login.jsp">LOGIN</a>
                    <%  } else {
                        if (user.getStaff() == true) {
                    %>
                    <a class="navbarTxt" href="moviemanage.jsp">MANAGE MOVIES</a>
                    <form action="UserController1" method="get" style="display: inline-block">
                        <input class="navbarTxt3" type="submit" value="MANAGE USERS"/>
                    </form>
                    <a class="navbarTxt" href="order.jsp">ORDER</a>

                    <%
                        }
                    %>
                    <a class="navbarTxt3" href="loginhistory.jsp" class="navbarTxt3"><%=user.getUserName()%></a>
                    <form method="post" action="index.jsp" style="display: inline-block">
                        <input type="HIDDEN" name="logout" value="invalidate">
                        <input class="navbarTxt3" type="submit" value="LOGOUT"><!--this was going to be a button with javascript but using a form has the same effect-->
                    </form>
                    <%  }
                    %>
                </div>
            </div>

            <div class="text">
                <p><strong>Movie Store Online</strong></p>
            </div>
        </div>
        <div class="fifth">
            <h2>Because Dvds never go out of fashion</h2>
            <h4>Services</h4>
            <p>Here at 'Movie Store Online' we are dedicated to proving the newest and greatest movies of all time to out customers</p>
            <p>Movies delivered within a week or they're free</p>
            <p>Place and order now</p>
        </div>
        <div class="second">

        </div>
        <div class="third">
        </div>
        <jsp:include page="/ConnServlet" flush="true" />
    </body>
</html>
