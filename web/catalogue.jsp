<%-- 
    Document   : catalogue
    Created on : 09/04/2019, 12:06:55 PM
    Author     : mougi
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="isd.model.Movie"%>
<%@page import="isd.model.dao.DBManager"%>
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
            }
        %>    
        <div class="navbar-colored">
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
                    DBManager manager = (DBManager) session.getAttribute("manager");
                    ArrayList<Movie> list = new ArrayList<Movie>();
                    list = manager.allMovie();
                    int row = 0;
                    for (Movie movie : list) {
                        if (row == 0) {
                %>
                <tr>
                    <td>
                        <div class="poster">
                            <div class="<%=movie.getGenre()%>">
                                <p><%=movie.getName()%></p>
                            </div>
                            <p><%=movie.getName()%></p>
                            <p><%=movie.getGenre()%></p>
                            <p><%=movie.getPrice()%></p>
                            <a href="">Add to checkout</a>
                        </div>
                    </td>
                    <%
                        row++;
                    } else if (row == 5) {
                    %>
                    <td>
                        <div class="poster">
                            <div class="<%=movie.getGenre()%>">
                                <p><%=movie.getName()%></p>
                            </div>
                            <p><%=movie.getName()%></p>
                            <p><%=movie.getGenre()%></p>
                            <p><%=movie.getPrice()%></p>
                            <a href="">Add to checkout</a>
                        </div>
                    </td>
                </tr>
                <%
                    row = 0;
                } else {
                %>
                <td>
                    <div class="poster">
                        <div class="<%=movie.getGenre()%>">
                                <p><%=movie.getName()%></p>
                            </div>
                        <p><%=movie.getName()%></p>
                        <p><%=movie.getGenre()%></p>
                        <p><%=movie.getPrice()%></p>
                        <a href="">Add to checkout</a>
                    </div>
                </td>
                <%
                            row++;
                        }
                    }
                %>              
            </table>
        </div>
        <div class="third">

        </div>
    </body>
</html>
