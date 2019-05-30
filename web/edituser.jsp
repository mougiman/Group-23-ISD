<%-- 
    Document   : edituser
    Created on : 30/05/2019, 12:45:07 PM
    Author     : mougi
--%>

<%@page import="isd.model.dao.DBManager"%>
<%@page import="isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Account</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <%
            User user = (User) session.getAttribute("user");
            String logout = request.getParameter("logout");
            if (logout != null) {
                session.invalidate();
            }

            DBManager manager = (DBManager) session.getAttribute("manager");

            boolean edit = false;
            edit = Boolean.parseBoolean(request.getParameter("edit"));

            boolean delete = false;
            delete = Boolean.parseBoolean(request.getParameter("delete"));
            if (delete == true) {
                manager.deleteUser(user.getId());
            }

            if (edit) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String dob = request.getParameter("dob");
                String username = request.getParameter("username");
                String address = request.getParameter("address");
                manager.updateUser(user.getId(), email, name, password, dob, username, address);
            }

        %>

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
        <div class="sixth">
            <div class="seventh">
                <% if (edit) {%>
                <p>Movie has been updated</p>
                <%}%>
                <div class="second">
                    <%
                        if (user != null) {
                    %>
                    <div class="fourth">
                        <form action="register.jsp" method="post">
                            <table>
                                <tr>
                                    <td><p class="p1">Username</p></td>
                                    <td><input type="text" name="username" value="<%=user.getUserName()%>"></td>
                                </tr>
                                <tr>
                                    <td><p class="p1">Email</p></td>
                                    <td><input type="text" name="email" value="<%=user.getEmail()%>"></td>
                                </tr>
                                <tr>
                                    <td><p class="p1">Full name</p></td>
                                    <td><input type="text" name="name" value="<%=user.getName()%>"></td>
                                </tr>
                                <tr>
                                    <td><p class="p1">Password</p></td>
                                    <td><input type="password" name="password" value="<%=user.getPassword()%>"></td>
                                </tr>
                                <tr>
                                    <td><p class="p1">Date of Birth</p></td>
                                    <td><input type="date" name="dob" value="<%=user.getDob()%>"></td>
                                </tr>
                                <tr>
                                    <td><p class="p1">Address</p></td>
                                    <td><input type="text" name="address" value="<%=user.getAddress()%>"></td>
                                </tr>  
                                <tr>
                                    <td></td>
                                    <td><input type="submit" value="Updare details"></td>  
                                </tr>                    
                            </table>
                        </form>  
                        <form method="post" action="moviemanage.jsp" class="alt-table">
                            <input type="HIDDEN" name="delete" value="true">
                            <td><input type="submit" value="Delete Account"></td>
                        </form>
                    </div>
                </div>
                <%
                } else {
                %>
                <div class="fourth">
                    <p class="p1">You must be <a href="login.jsp">logged in</a> to edit account details</p>
                </div >
                <%
                    }
                %>
                <div class="third">

                </div>
                </body>
                </html>
