<%-- 
    Document   : moviedesc
    Created on : 30/05/2019, 1:34:30 PM
    Author     : mougi
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Random"%>
<%@page import="isd.model.Order"%>
<%@page import="isd.model.Movie"%>
<%@page import="isd.model.dao.DBManager"%>
<%@page import="isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Description</title>
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
            Movie movie = manager.findMovie(Integer.parseInt(request.getParameter("id")));

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
            <div class="poster">
                <div class="<%=movie.getGenre()%>">
                    <p><%=movie.getName()%></p>
                </div>
                <p><b><%=movie.getName()%></b></p>
                <p><%=movie.getGenre()%></p>
                <p>$<%=movie.getPrice()%></p>
                <p><%=movie.getDescription()%></p>

                <form method="post" action="moviedesc.jsp">
                    <select name="quantity">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select>
                    <input type="HIDDEN" name="id" value="<%=movie.getID()%>">
                    <input class="" type="submit" value="Add to Order"><!--this was going to be a button with javascript but using a form has the same effect-->
                </form>
                     <% 
                                String quantity = request.getParameter("quantity");
                            if (quantity != null && Integer.parseInt(quantity) <= movie.getStock()) { %>
                                
                            You have added <%=quantity%> copies into your order!
                            
                            <%  
                                
                                
                                
                                int key2 = (new Random()).nextInt(999999);
                                
                                
                                //String orderDate = cur2.getDate();
                                //String cusid = cur2.getCusid();
                                String ID = "" + key2;
                                
                                int key = (new Random()).nextInt(99999);                   
                                String orderID = "" + key;
                                String cusid = "";
                                if (user != null){ cusid = user.getId(); } else { cusid = "anonymous";}
                                String orderDate = LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
    

                                String movieID = "" + movie.getID();
                                String movieNum = quantity;

                                Order cur = new Order(orderID, orderDate, cusid);
                                session.setAttribute("cur", cur);
                                manager.addOrder(orderID, orderDate, cusid);
                                manager.addMovInOrder(ID, orderID, movieID, movieNum);
                                
                                manager.stocktoSold(Integer.parseInt(movieID), Integer.parseInt(movieNum));
                                
                                
                               }  else if (quantity != null && Integer.parseInt(quantity) > movie.getStock()){
                               out.print("No enough stock, sorry");
                            } 
                            %>
            </div>
        </div>
        <div class="third">

        </div>

    </body>
</html>
