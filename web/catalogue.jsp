<%-- 
    Document   : catalogue
    Created on : 09/04/2019, 12:06:55 PM
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
                <form method="post" action="index.jsp" style="display: inline-block">
                    <input type="HIDDEN" name="logout" value="invalidate">
                    <input class="navbarTxt3" type="submit" value="Logout"><!--this was going to be a button with javascript but using a form has the same effect-->
                </form>
                <%  }
                %>
            </div>
        </div>

        <div class="sixth">
            <table>
                <%
                    for (int i = 0; i < 3; i++) {
                %>
                <tr>
                    <% for (int i2 = 0; i2 < 4; i2++) {
                    %>
                    <td>
                        <div class="poster">
                            <img src="images/poster1.jpg" alt="Image not found">
                            <p>Back to the Future</p>
                            <p>$14.99</p>
                        </div>
                    </td>
                    <%
                        }
                    %>
                </tr>
                <%   }
                %>
            </table>
        </div>
        <div class="third">

        </div>
    </body>
</html>
