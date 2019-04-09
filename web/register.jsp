<%-- 
    Document   : register
    Created on : 09/04/2019, 12:06:04 PM
    Author     : mougi
--%>

<%@page import="isd.model.Users"%>
<%@page import="isd.model.User"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <div class="navbar">
            <div class="navbar2">
                <a class="navbarTxt" href="index.jsp">Main</a>
                <a class="navbarTxt" href="catalogue.jsp">Movies</a>
                <%  //add check user //if(user == null){
                %>
                <a class="navbarTxt" href="register.jsp">Register</a>
                <a class="navbarTxt" href="login.jsp">Login</a>
                }
            </div>
        </div>
        <div class="second">

            <%
                if (request.getParameter("email") == null) {
            %>
            <div class="fourth">
                <form action="register.jsp" method="post">
                    <table>
                        <tr>
                            <td>Username</td>
                            <td><input type="text" name="username"></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><input type="text" name="email"></td>
                        </tr>
                        <tr>
                            <td>Full name</td>
                            <td><input type="text" name="name"></td>
                        </tr>
                        <tr>
                            <td>Password</td>
                            <td><input type="password" name="password"></td>
                        </tr>
                        <tr>
                            <td>Date of Birth</td>
                            <td><input type="date" name="dob"></td>
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td><input type="text" name="address"></td>
                        </tr>  
                        <tr>
                            <td>Agree to TOS</td>
                            <td><input type="checkbox" name="tos" value="true"><br>
                        </tr>  
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Register"></td>  
                        </tr>                    
                    </table>
                </form>  
            </div>
            <%
            } else {
                Boolean tos = Boolean.parseBoolean(request.getParameter("tos"));
                if (tos == true) {
                    String username = request.getParameter("username");
                    String email = request.getParameter("email");
                    String name = request.getParameter("name");
                    String pword = request.getParameter("password");
                    String dob = request.getParameter("dob"); //this might not work
                    String address = request.getParameter("address");
                    Random rand = new Random();
                    String id = "" + rand.nextInt(9999);
                    User user = new User(username, email, name, pword, dob, address, id);
                    Users users = new Users();
                    users.addUser(user);
            %>
            <p>Thank You!</p>
            <p>Your account has been created</p>
            <%            } else {
            %>
            <p>Sorry, you must agree to the Terms of Service</p>
            <p>Click <a href="register.jsp">here</a> to go back.</p>
            <%
                    }
                }
            %>
        </div>
        <div class="third">

        </div>
    </body>
</html>
