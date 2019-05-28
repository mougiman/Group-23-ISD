<%-- 
    Document   : addmovie
    Created on : 16/05/2019, 12:59:08 PM
    Author     : Mougi
--%>

<%@page import="isd.model.Movies"%>
<%@page import="java.util.ArrayList"%>
<%@page import="isd.model.dao.DBManager"%>
<%@page import="isd.model.Movie"%>
<%@page import="java.util.Random"%>
<%@page import="isd.model.User"%>
<%@page import="isd.model.*"%>
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

            boolean delete = false;
            delete = Boolean.parseBoolean(request.getParameter("delete"));
            if (delete == true) {
                manager.deleteMovie(Integer.parseInt(request.getParameter("id")));
            }

            boolean search = false;
            ArrayList<Movie> searchList;
            search = Boolean.parseBoolean(request.getParameter("search"));
            if (search == true) {
                 searchList = manager.searchMovie(Integer.parseInt(request.getParameter("id")));
            }

            String name = request.getParameter("name");
            if (name != null) {
                String genre = request.getParameter("genre");
                String posterref = request.getParameter("posterref");
                Double price = Double.parseDouble(request.getParameter("price"));
                String desc = request.getParameter("desc");
                int stock = Integer.parseInt(request.getParameter("stock"));
                Random rand = new Random();
                int id = rand.nextInt(9999);
                manager.addMovie(id, name, genre, desc, posterref, price, stock, 0);
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
                    <input type="HIDDEN" name="logout" value="invalidate"><!--idk if this does anything-->
                    <input class="navbarTxt3" type="submit" value="Logout"><!--this was going to be a button with javascript but using a form has the same effect-->
                </form>
                <%  }
                %>
            </div>
        </div>

        <div class="sixth">
            <div class="seventh">
                <table class="tablescroll">
                    <thead>
                        <tr>
                            <td><p class="p4">ID</p></td>
                            <td><p class="p4">Name</p></td>
                            <td><p class="p4">Genre</p></td>
                            <td><p class="p4">PosterRef</p></td>
                            <td><p class="p4">Description</p></td>
                            <td><p class="p4">Price</p></td>
                            <td><p class="p4">Sold</p></td>
                            <td><p class="p4">Stock</p></td>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                                ArrayList<Movie> list = new ArrayList<Movie>();
                                if (search == false) {
                                    list = manager.allMovie();
                                } else {
                                    list = manager.searchMovie(Integer.parseInt(request.getParameter("id")));
;
                                }
                            
                            for (Movie movie : list) {
                        %>
                        <tr>
                            <td><p class="p3"><%=movie.getID()%></p></td>
                            <td><p class="p3"><%=movie.getName()%></p></td>
                            <td><p class="p3"><%=movie.getGenre()%></p></td>
                            <td><p class="p3"><%=movie.getPosterRef()%></p></td>
                            <td><p class="p3"><%=movie.getDescription()%></p></td>
                            <td><p class="p3">$<%=movie.getPrice()%></p></td>
                            <td><p class="p3"><%=movie.getSold()%></p></td>
                            <td><p class="p3"><%=movie.getStock()%></p></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <form method="post" action="editmovie.jsp">
                    <table>
                        <tr><td><p class="p3">Enter ID:</p></td><td><input type="text" name="id"></td></tr> 
                        <tr>
                        <td><input type="submit" value="Edit"></td>
                        </tr>
                    </table>
                </form>
                <form method="post" action="moviemanage.jsp">
                    <table>
                        <tr><td><p class="p3">Enter ID:</p></td><td><input type="text" name="id"></td></tr> 
                        <tr>
                        <input type="HIDDEN" name="delete" value="true">
                        <td><input type="submit" value="Delete"></td>
                        </tr>
                    </table>
                </form>
                <form method="post" action="moviemanage.jsp">
                    <table>
                        <tr><td><p class="p3">Enter ID:</p></td><td><input type="text" name="id"></td></tr> 
                        <tr>
                        <input type="HIDDEN" name="search" value="true">
                        <td><input type="submit" value="Search"></td>
                        </tr>
                    </table>
                </form>

            </div>
            <div class="filler1"></div>
            <div class="seventh">
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
