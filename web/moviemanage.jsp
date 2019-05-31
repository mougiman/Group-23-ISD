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
            
            boolean deleteAll = false;
            delete = Boolean.parseBoolean(request.getParameter("deleteAll"));
            if (delete == true) {
                manager.deleteAllMovie();
            }

            boolean search = false;
            ArrayList<Movie> searchList = new ArrayList<Movie>();
            search = Boolean.parseBoolean(request.getParameter("search"));
            if (search == true) {
                searchList = manager.searchMovie(request.getParameter("searchVal"));
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
            <%
                if (name != null) {
            %>
            <div class="seventh">
                <p class="p2">"<%=name%>" has been added to the Catalogue</p>
            </div>
            <div class="filler1"></div>
            <%
                }
            %>
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
                                list = searchList;                              
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
                <form method="post" action="editmovie.jsp" class="alt-table">
                    <table>
                        <tr><td><p class="p3">Enter ID:</p></td><td><input type="text" name="id"></td></tr> 
                        <tr>
                            <td><input type="submit" value="Edit"></td>
                        </tr>
                    </table>
                </form>
                <form method="post" action="moviemanage.jsp" class="alt-table">
                    <table>
                        <tr><td><p class="p3">Enter ID:</p></td><td><input type="text" name="id"></td></tr> 
                        <tr>
                        <input type="HIDDEN" name="delete" value="true">
                        <td><input type="submit" value="Delete"></td>
                        </tr>
                    </table>
                </form>
                <form method="post" action="moviemanage.jsp" class="alt-table">
                    <table>
                        <tr><td><p class="p3">Enter Name or Genre:</p><p class="p3">(Upper and Lower Case Specific)</p></td><td><input type="text" name="searchVal">
                                </td></tr> 
                        <tr>
                        <input type="HIDDEN" name="search" value="true">
                        <td><input type="submit" value="Search"></td>
                        </tr>
                    </table>
                </form>
                <form method="post" action="moviemanage.jsp" class="alt-table">
                    <table>
                        <tr><td><p class="p3">Delete All Movies</p></td></tr> 
                        <tr>
                        <input type="HIDDEN" name="deleteAll" value="true">
                        <td><input type="submit" value="Delete All"></td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="filler1"></div>
            <div class="seventh">
                <form method="post" action="moviemanage.jsp">
                    <table>
                        <tr><td><p class="p2">Name     :</p></td><td><input type="text" name="name"></td></tr>
                        <tr><td><p class="p2">Genre    :</p></td>
                            <td>
                                <select name="genre">
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
                            </td>
                        </tr>
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
