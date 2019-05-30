<%-- 
    Document   : moviedesc
    Created on : 30/05/2019, 1:34:30 PM
    Author     : mougi
--%>

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
             <div class="poster">
                            <div class="<%=movie.getGenre()%>">
                                <p><%=movie.getName()%></p>
                            </div>
                            <p><b><%=movie.getName()%></b></p>
                            <p><%=movie.getGenre()%></p>
                            <p>$<%=movie.getPrice()%></p>
                            <p><%=movie.getDescription()%></p>
                            
                            <form method="post" action="moviedesc.jsp">
                                <input name="quantity">
                                <input type="HIDDEN" name="id" value="<%=movie.getID()%>">
                                <input class="" type="submit" value="Add to Order"><!--this was going to be a button with javascript but using a form has the same effect-->
                            </form>
                        </div>
            
            
    </body>
</html>
