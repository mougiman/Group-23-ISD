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
            
            if (delete) {
                manager.deleteUser(user.getId());
                session.invalidate();
                user = null;
            }

            if (edit) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String dob = request.getParameter("dob");
                String username = request.getParameter("username");
                String address = request.getParameter("address");
                manager.updateUser(user.getId(), email, name, password, dob, username, address);
                user = manager.findUser(username, password);
                session.setAttribute("user",user);      
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

            <% if (edit) {%>
            <div class="seventh">
                <p>User has been updated</p>
            </div>
            <%}%>
            
            <% if (delete) {%>
            <div class="seventh">
                <p>Account has been deleted</p>
            </div>
            <%}%>
            
            <%
                if (user != null) {
            %>
            <div class="fourth">
                <form action="edituser.jsp" method="post">
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
                            <td><input type="HIDDEN" name="edit" value="true">
                                <input type="submit" value="Update details"></td>  
                        </tr>                    
                    </table>
                </form>  
                <form method="post" action="edituser.jsp" class="alt-table" style="margin: auto">
                    <input type="HIDDEN" name="delete" value="true">
                    <td><input type="submit" value="Delete Account"></td>
                </form>
            </div>

            <%
            } else {
            %>
            <div class="seventh">
                <p class="p1">You must be <a href="login.jsp">logged in</a> to edit account details</p>
            </div >
            <%
                }
            %>
        </div>
        <div class="third">

        </div>
    </body>
</html>
