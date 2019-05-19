<%-- 
    Document   : addmovie
    Created on : 16/05/2019, 12:59:08 PM
    Author     : Mougi
--%>

<%@page import="isd.model.dao.DBManager"%>
<%@page import="isd.model.Movie"%>
<%@page import="java.util.Random"%>
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

            //Movie register code
            String name = request.getParameter("name");
            String genre = request.getParameter("genre");
            String posterref = request.getParameter("posterref");
            Double price = Double.parseDouble(request.getParameter("name"));
            String desc = request.getParameter("desc");
            int stock = Integer.parseInt(request.getParameter("address"));
            Random rand = new Random();
            int id = rand.nextInt(9999);
            //Movie movie = new Movie(id, name, genre, desc, posterref, price, stock, 0);
            //Might not need this ^
            DBManager manager = (DBManager)session.getAttribute("manager");
            manager.addMovie(id, name, genre, desc, posterref, price, stock, 0);


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
            <div class="fifth">

            </div>
            <div class="fifth">
                <form method="post" action="moviemanage.jsp">
                    <table>
                        <tr><td><p class="p2">Name     :</p></td><td><input type="text" name="name"></td></tr>
                        <tr><td><p class="p2">Genre    :</p></td><td><input type="text" name="genre"></td></tr>
                        <tr><td><p class="p2">Poster Referance:</p></td><td><input type="text" name="posterref"></td></tr>
                        <tr><td><p class="p2">Price    :</p></td><td><input type="text" name="price"></td></tr>
                        <tr><td><p class="p2">Stock    :</p></td><td><input type="text" name="stock"></td></tr>
                        <tr><td><p class="p2">Description:</p></td><td><input type="text" name="desc"></td></tr>
                        <tr><td></td><td><input type="submit" value="Add Movie"></td></tr>
                    </table> 
                </form>
            </div>
        </div>
        <div class="third">

        </div>
    </body>
</html>
