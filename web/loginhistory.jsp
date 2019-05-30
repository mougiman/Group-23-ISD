<%-- 
    Document   : loginhistory
    Created on : 2019-5-28, 21:49:02
    Author     : Cai weize
--%>

<%@page import="isd.model.dao.DBConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="isd.model.dao.DBManager"%>
<%@page import="isd.model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Store Online</title>
        <div class="navbar-colored">
            </head>
            <body>

            <div class="navbar2">
                <a class="navbarTxt" href="index.jsp">MAIN</a>
                <a class="navbarTxt" href="catalogue.jsp">MOVIES</a>
            </div>
            <div class="navbar3">
               
        
        <link rel="stylesheet" href="styles.css">
   
        <form method="post" action="loginhistory.jsp">
            <div>
                <p><strong>Search by date</strong></p>
            
        <input type="date" name="date" value="">
        <input type="submit" value="search">
          <form action="loginhistory.jsp">
                        <input type="HIDDEN" name="delete" value="delete">
                        <input type="submit" value="DELETE all">
                    </form>
        <table style="width:100%" border="1" align="left">
  <tr>
      <th>ID</th>
    
     <th>Login time</th> 
     <th>Login date</th> 
     <th>Logout time</th> 
     <th>Logout date</th>
  </tr>
  <% 
        DBManager manager = (DBManager)session.getAttribute("manager");
            User user = new User();
            
           
             user = (User) session.getAttribute("user");
      String sDate = request.getParameter("date");
      String delete = request.getParameter("delete");
      if(delete!=null)
      {
      manager.remove(user);
      }
      
      
      
      
    Object thisUser = session.getAttribute("user");
    if(thisUser!=null)
    {
        user = (User) thisUser;
         
        ArrayList<Login> list = new ArrayList<Login>();
       if(list != null)
        {
        if(sDate == null){
         list = manager.getLoginT(user.getId());
        } 
        else {list = manager.searchLoginT(user.getId(), sDate);
        }
        }
        
              for (Login login : list)
              {

             %>
              <tr>
                <td><p class="p6"><%=login.getID()%></p></td>
                <td><p class="p6"><%=login.getinTime()%></p></td>
                <td><p class="p6"><%=login.getinDate()%> 
                  
                 </p></td>
                <td><p class="p6"><%=login.getoutTime()%></p></td>
                <td><p class="p6"><%=login.getoutDate()%></p></td>
              </tr>
            <%}
          }
    


%>

</table>
        </div>
        </form>
    </body>
</html>
