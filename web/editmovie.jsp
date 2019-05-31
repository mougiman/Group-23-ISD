<%-- 
    Document   : editmovie
    Created on : 27/05/2019, 1:33:19 PM
    Author     : Mougi
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="isd.model.Movie"%>
<%@page import="java.util.Random"%>
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
                // user = (User) session.getAttribute("user");
            }

            //Movie register code
            DBManager manager = (DBManager) session.getAttribute("manager");
            int id = Integer.parseInt(request.getParameter("id"));
            Movie movie = manager.findMovie(id);

            boolean edit = false;
            edit = Boolean.parseBoolean(request.getParameter("edit"));

            if (edit) {
                String name = request.getParameter("name");
                String genre = request.getParameter("genre");
                String posterref = request.getParameter("posterref");
                Double price = Double.parseDouble(request.getParameter("price"));
                String desc = request.getParameter("desc");
                int stock = Integer.parseInt(request.getParameter("stock"));
                manager.updateMovie(id, name, genre, desc, posterref, price, stock, movie.getSold());
                movie = manager.findMovie(id);
            }
        %>    
        <div class="navbar-colored">
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

        <div class="sixth">
            <div class="seventh">
                <% if (edit) {%>
                <p>Movie has been updated</p>
                <%}%>
                <form method="post" action="editmovie.jsp">
                    <table>
                        <tr><td><p class="p2">Name     :</p></td><td><input type="text" name="name" value="<%=movie.getName()%>"></td></tr>
                        <tr><td><p class="p2">Genre    :</p></td>                            <td>
                                <select name="genre">
                                    <option value="<%=movie.getGenre()%>"><%=movie.getGenre()%></option>
                                    <option value="Fantasy">Fantasy</option>
                                    <option value="Horror">Horror</option>
                                    <option value="Adventure">Adventure</option>
                                    <option value="Action">Action</option>
                                    <option value="Romance">Romance</option>
                                    <option value="Crime">Crime</option>
                                    <option value="Sci-Fi">Sci-Fi</option>
                                    <option value="Western">Western</option>
                                    <option value="Other">Other</option>
                                </select>
                            </td></tr>
                        <tr><td><p class="p2">Poster Referance:</p></td><td><input type="text" name="posterref" value="<%=movie.getPosterRef()%>"></td></tr>
                        <tr><td><p class="p2">Price    :</p></td><td><input type="text" name="price" value="<%=movie.getPrice()%>"></td></tr>
                        <tr><td><p class="p2">Stock    :</p></td><td><input type="text" name="stock" value="<%=movie.getStock()%>"></td></tr>
                        <tr><td><p class="p2">Description:</p></td><td><input type="text" name="desc" value="<%=movie.getDescription()%>"></td></tr>
                        <tr><td></td><td><input type="HIDDEN" name="id" value=<%=movie.getID()%>><input type="HIDDEN" name="edit" value="true"><input type="submit" value="Edit Movie"></td><td><a href="moviemanage.jsp" class="p4">Go Back</a></td></tr>
                    </table> 
                </form>
            </div>
        </div>
        <div class="third">

        </div>
    </body>
</html>
