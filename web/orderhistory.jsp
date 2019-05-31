<%-- 
    Document   : order.jsp
    Created on : 29/05/2019, 12:15:45 PM
    Author     : Zce
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="isd.model.*"%>
<%@page import="isd.model.dao.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store Online</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>

        <div class="navbar-colored">
            <div class="navbar2">
                <a class="navbarTxt" href="index.jsp">Main</a>
                <a class="navbarTxt" href="catalogue.jsp">Movies</a>
            </div>
            <div class="navbar3">
        
        <% DBManager manager = (DBManager)session.getAttribute("manager");
        
        Order cur = (Order) session.getAttribute("cur");
        String cID= "";
        if (cur!= null){
           cID = cur.getCusid();}
        User user = (User) session.getAttribute("user");
            if (user != null){
            String username = user.getUserName(); 
        %>
                <a class="navbarTxt" href="edituser.jsp"><%=username%></a>
                <% } %>
            </div>
        </div>
        <h4 align="center">Order History</h4>
        
        <% 
            //Activate the database search-validate once DBManager functions are completed
            ArrayList<MovieInOrder> list = new ArrayList<MovieInOrder>();
            if (list != null) {
            list = manager.findOrderMovie(cID);
            
            for (MovieInOrder mio : list) {
            int ID = Integer.parseInt(mio.getMovieID());

            
            Movie savedOrder = manager.findOrderedMoive(ID); 
            if (savedOrder != null && mio != null){
        %>

        
        <table align="center" class="order">
            <thead class="h">
                <tr>
                    <td class="a">Order ID</td>
                    <td class="a">Movie Name</td>
                    <td class="a">Price (per copy)</td>
                    <td class="a">quantity</td>
                    
                </tr>
            </thead>
            <tbody >
         
                <% 
                    int quantity = Integer.parseInt(mio.getMovieNum());
                    %>
                <tr>
                
                <td class="a"><%=mio.getOrderID()%></td>
                <td class="a"><%=savedOrder.getName()%></td>
                <td class="a"><%=savedOrder.getPrice()%></td>
                <td class="a"><%=quantity%> </td>
                  
               
             
                </tr>
            </tbody>
        </table>        
      
   <%}  }
} 
   %>
    <h2>Search</h2>
      <div style="text-align:right">
            <form action="orderhistory.jsp" method="POST">
                
                Order ID: <input type="text" name="oID">
                Order Date: <input type="text" name="oDate" value="dd/mm/yyyy">
                <input type="submit" name="submit" value="search">

                <% 
                    String oid = request.getParameter("oID");
                    String odate = request.getParameter("oDate");
                    MovieInOrder mio = new MovieInOrder();
                    if(oid != null && odate != null){
                    if (cur!= null){
                    
                           mio = manager.findOrder(oid,odate);
                    }
                    
                } 
                    
                %>
            </form>
            
            <table align="center" class="search">
                <tr> 
                    <td class="a">Order id</td>
                    <td class="a">Movie id</td>
                    <td class="a">Ordered copies</td>
                </tr>
                
                <tr>
                <td class="a"><%=mio.getOrderID()%></td>
                <td class="a"><%=mio.getMovieID()%></td>
                <td class="a"><%=mio.getMovieNum()%></td>
                </tr>
            </table>    
                

        
        </div> 
  

    </body>
</html>   