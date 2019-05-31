<%-- 
    Document   : order.jsp
    Created on : 30/05/2019, 1:15:45 AM
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
        <h4 align="center">Order Detail</h4>
        
        <% 
            //Activate the database search-validate once DBManager functions are completed
            ArrayList<MovieInOrder> list = new ArrayList<MovieInOrder>();
            if (list != null) {
            list = manager.findOrderMovie(cID);
            
            for (MovieInOrder mio : list) {
            int ID = Integer.parseInt(mio.getMovieID());
            /*
            int sID = manager.findOrderMovie2(cID);
            int ID;
            if (sID < 0) {
                ID = -1; //Integer.parseInt();
            } else { 
                ID = sID;
            }
            */
            
            Movie savedOrder = manager.findOrderedMoive(ID); 
            if (savedOrder != null){
        %>
        <%--<h4 align="center"><%=list.get(0)%></h4> --%>
             <table align="center" class="order">
            <thead class="h">
                <tr>
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
                 
                <td class="a"><%=savedOrder.getName()%></td>
                <td class="a"><%=savedOrder.getPrice()%></td>
                <td class="a"><%=quantity%> </td>
                  
               
             
                </tr>
            </tbody>
        </table>        
      
   <%}  }
} 
   %>
        
        <br>
        <div style="text-align:right">
            <form action="order.jsp" method="POST">
                <input type="submit" name="Cancel" value="Cancel Order">
                <input type="HIDDEN" name="delete" value="delete">
                <% if(request.getParameter("delete")!= null){
                    if (cur!= null){
                    manager.cancelOrder(cur);
                    
                    }
                    response.sendRedirect("index.jsp");
                } 
                    %>
            </form>

        
        </div>
        
        <br>        
        <div style="text-align:center">   

        <button type="button" onclick="location.href = 'catalogue.jsp'" > Update Order </button>
        &nbsp;
        <button type="button" onclick="location.href = 'orderhistory.jsp'" > Order History </button>
        &nbsp;
        <button type="button" onclick="location.href = 'orderSubmission.jsp'" > Submit Order </button>
        </div>
        

    </body>
</html>
