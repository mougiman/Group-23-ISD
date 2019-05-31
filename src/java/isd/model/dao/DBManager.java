package isd.model.dao;

import isd.model.Login;
import isd.model.Movie;
import isd.model.MovieInOrder;
import isd.model.Order;
import isd.model.User;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 *
 * @author George
 *
 * DBManager is the primary DAO class to interact with the database and perform
 * CRUD operations with the db. Firstly, complete the existing methods and
 * implement them into the application.
 *
 * So far the application uses the Read and Create operations in the view.
 * Secondly, improve the current view to enable the Update and Delete
 * operations.
 */
public class DBManager {

    private DBConnector db;
    private Statement st;

    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    //Find student by ID in the database
    public Movie findMovie(int ID) throws SQLException {
        Movie movie = new Movie();
        String query = "SELECT * FROM MOVIES WHERE ID = " + ID;
        ResultSet rs = st.executeQuery(query);
        while (rs.next()) {
            int id = Integer.parseInt(rs.getString(1));
            String name = rs.getString(2);
            String genre = rs.getString(3);
            String desc = rs.getString(4);
            String posterref = rs.getString(5);
            Double price = Double.parseDouble(rs.getString(6));
            int stock = Integer.parseInt(rs.getString(7));
            int sold = Integer.parseInt(rs.getString(8));
            movie = new Movie(id, name, genre, desc, posterref, price, stock, sold);
        }
        return movie;
    }

    public User findUser(String username, String password) throws SQLException {

        String query = "SELECT * FROM USERDB WHERE USERNAME = '" + username + "' and PASSWORD ='" + password + "'";
        ResultSet rs = st.executeQuery(query);
        while (rs.next()) {
            String cUsername = rs.getString(2);
            String cPassword = rs.getString(4);
            if (cUsername.equals(username) && cPassword.equals(password)) {
                String userID = rs.getString(1);
                String name = rs.getString(7);
                String email = rs.getString(3);
                String dob = rs.getString(5);
                String address = rs.getString(6);
                Boolean staff = rs.getBoolean(8);
                int activated = rs.getInt(9);
                String phone = rs.getString(10);
                User user = new User(userID, email, name, password, dob, username, address, staff, activated, phone);
                return user;
            }
        }
        return null;
    }

    //Check if a student exist in the database
    public ArrayList<Movie> allMovie() throws SQLException {
        ArrayList<Movie> list = new ArrayList<Movie>();
        String query = "SELECT * FROM MOVIES";
        ResultSet rs = st.executeQuery(query);
        while (rs.next()) {
            int id = Integer.parseInt(rs.getString(1));
            String name = rs.getString(2);
            String genre = rs.getString(3);
            String desc = rs.getString(4);
            String posterref = rs.getString(5);
            Double price = Double.parseDouble(rs.getString(6));
            int stock = Integer.parseInt(rs.getString(7));
            int sold = Integer.parseInt(rs.getString(8));
            Movie movie = new Movie(id, name, genre, desc, posterref, price, stock, sold);
            list.add(movie);
        }
        return list;
    }

    public ArrayList<Movie> searchMovie(String search) throws SQLException {
        ArrayList<Movie> list = new ArrayList<Movie>();
        String query = "SELECT * FROM MOVIES WHERE NAME LIKE '%" + search + "%' OR GENRE LIKE '%" + search + "%'";
        ResultSet rs = st.executeQuery(query);
        while (rs.next()) {
            int id = Integer.parseInt(rs.getString(1));
            String name = rs.getString(2);
            String genre = rs.getString(3);
            String desc = rs.getString(4);
            String posterref = rs.getString(5);
            Double price = Double.parseDouble(rs.getString(6));
            int stock = Integer.parseInt(rs.getString(7));
            int sold = Integer.parseInt(rs.getString(8));
            Movie movie = new Movie(id, name, genre, desc, posterref, price, stock, sold);
            list.add(movie);
        }
        return list;
    }

    //Add a student-data into the database
    public void addMovie(int ID, String name, String genre, String description, String posterref, Double Price, int stock, int sold) throws SQLException {
        String query = "INSERT INTO MOVIES (ID, NAME, GENRE, DESCRIPTION, POSTERREF, PRICE, STOCK, SOLD) VALUES (" + ID + ",'" + name + "','" + genre + "','" + description + "','" + posterref + "'," + Price + "," + stock + "," + sold + ")";
        st.executeUpdate(query);
    }

    //update a student details in the database
    public void updateMovie(int ID, String name, String genre, String description, String posterref, Double Price, int stock, int sold) throws SQLException {
        String query = "UPDATE MOVIES SET NAME = '" + name + "', GENRE = '" + genre + "', DESCRIPTION = '" + description + "', POSTERREF = '" + posterref + "', Price = " + Price + ", STOCK = " + stock + ", SOLD = " + stock + " WHERE ID =" + ID;
        st.executeUpdate(query);
    }

    //delete a student from the database
    public void deleteMovie(int ID) throws SQLException {
        String query = "DELETE FROM MOVIES WHERE ID = " + ID;
        st.executeUpdate(query);
    }

    public void deleteAllMovie() throws SQLException {
        String query = "DELETE FROM MOVIES";
        st.executeUpdate(query);
    }

    public ArrayList<Login> getLoginT(String ID) throws SQLException {
        ArrayList<Login> list = new ArrayList<Login>();
        String query = "SELECT * FROM LOGINHISTORY WHERE ID = '" + ID + "'";
        ResultSet rs = st.executeQuery(query);
        while (rs.next()) {
            String time = rs.getString(2);
            String date = rs.getString(3);
            String outTime = rs.getString(4);
            String outDate = rs.getString(5);
            Login login = new Login(ID, time, date, outTime, outDate);
            list.add(login);
        }
        return list;
    }

    public ArrayList<Login> searchLoginT(String ID, String date) throws SQLException {
        ArrayList<Login> list = new ArrayList<Login>();
        String query = "SELECT * FROM LOGINHISTORY WHERE ID = '" + ID + "' AND LOGINDATE= '" + date + "' OR ID = '" + ID + "' AND LOGOUTDATE ='" + date + "'  ";
        ResultSet rs = st.executeQuery(query);
        while (rs.next()) {
            String time = rs.getString(2);
            String outTime = rs.getString(4);
            if (time == null) {
                Login login = new Login(ID, time, "null", outTime, date);
                list.add(login);
            } else {
                Login login = new Login(ID, time, date, outTime, "null");
                list.add(login);
            }
        }
        return list;
    }

    public String getTime() {
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
        java.util.Date date = new java.util.Date();
        return timeFormat.format(date);
    }

    public String getDate() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date date = new java.util.Date();
        return dateFormat.format(date);
    }

    public void record(User user) throws SQLException {

        String update = "INSERT INTO LOGINHISTORY(ID,LOGINTIME,LOGINDATE) VALUES('" + user.getId() + "','" + getTime() + "','" + getDate() + "') ";
        st.executeUpdate(update);
    }

    public void recordOut(User user) throws SQLException {

        String update = "INSERT INTO LOGINHISTORY(ID,LOGOUTTIME,LOGOUTDATE) VALUES('" + user.getId() + "','" + getTime() + "','" + getDate() + "') ";
        st.executeUpdate(update);
    }

    public void remove(User user) throws SQLException {
        String update = " DELETE FROM LOGINHISTORY WHERE ID = '" + user.getId() + "' ";
        st.executeUpdate(update);
    }

    public ArrayList<User> searchUser(String ID) throws SQLException {
        ArrayList<User> list = new ArrayList<User>();

        String query = "SELECT * FROM USERDB WHERE ID =" + ID;
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
            String userID = rs.getString(1);
            String userPass = rs.getString(4);
            String email = rs.getString(3);
            String name = rs.getString(7);
            String dob = rs.getString(5);
            String userName = rs.getString(2);
            String address = rs.getString(6);
            Boolean staff = rs.getBoolean(8);
            int activated = rs.getInt(9);
            String phone = rs.getString(10);
            User user = new User(userID, email, name, userPass, dob, userName, address, staff, activated, phone);
            list.add(user);
        }
        return list;
    }

    //Add a student-data into the database
    public void addUser(String ID, String email, String name, String password, String dob, String userName, String address) throws SQLException {
        String query = "INSERT INTO USERDB (ID, EMAIL, NAME, PASSWORD, DOB, USERNAME, ADDRESS) VALUES ('" + ID + "','" + email + "','" + name + "','" + password + "','" + dob + "','" + userName + "','" + address + "')";
        st.executeUpdate(query);
    }

    //update a student details in the database
    public void updateUser(String ID, String email, String name, String password, String dob, String userName, String address) throws SQLException {
        String query = "UPDATE USERDB SET EMAIL = '" + email + "', NAME = '" + name + "', PASSWORD = '" + password + "', DOB = '" + dob + "', USERNAME = '" + userName + "', ADDRESS = '" + address + "' WHERE ID = '" + ID + "'";
        st.executeUpdate(query);
    }

    public void deleteUser(String ID) throws SQLException {
        String query = "DELETE FROM USERDB WHERE ID = '" + ID + "'";
        st.executeUpdate(query);
    }

    public void activateUser(User u) throws SQLException {
        Statement statement = null;
        try {
            statement = db.openConnection().createStatement();
            String sql = "UPDATE huser SET User_Activate = 1 WHERE User_id = " + u.getId();

            statement.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            statement.close();
            db.closeConnection();
        }
    }

    public void deactivateUser(User u) throws SQLException {
        Statement statement = null;
        try {
            db = new DBConnector();
            statement = db.openConnection().createStatement();
            String sql = "UPDATE huser SET User_Activate = 0 WHERE User_id = " + u.getId();

            statement.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            statement.close();
            db.closeConnection();
        }
    }

        public Movie findOrderedMoive(int ID) throws SQLException {
        //setup the select sql query string
        String searchQueryString = "select * from MOVIES where ID=" + ID ;
        //execute this query using the statement field
       //add the results to a ResultSet
         ResultSet rs = st.executeQuery(searchQueryString);
        //search the ResultSet for a student using the parameters
         boolean hasOrderedMoive = rs.next();
         Movie movieFromDB = null;
                 
         if(hasOrderedMoive){
         
             int oID = Integer.parseInt(rs.getString("ID"));
             double oPrice = Double.parseDouble(rs.getString("price")); 
             String oName = rs.getString("name"); 
             String oGenre = rs.getString("genre"); 
             String oDesc = rs.getString("description");
             String oPosterref = rs.getString("posterref");
             int oStock = Integer.parseInt(rs.getString("stock"));
             int oSold = Integer.parseInt(rs.getString("sold")); 

             
             movieFromDB = new Movie (oID, oName, oGenre, oDesc, oPosterref, oPrice, oStock, oSold);
         }
        
         rs.close();
        // st.close();
         
         return movieFromDB;
         
    }
    
    public void addOrder(String orderID, String orderDate, String cusid) throws SQLException {        
        //code for add-operation
        
         String createQueryString = "insert into ORDERS" + " values ('" + orderID + "', '" + orderDate + "', '" + cusid + "')";
         boolean recrodCreated = st.executeUpdate(createQueryString) > 0;
         
         if (recrodCreated){
         System.out.println("record created");
         }
         else {
         System.out.println("record not created");
         }
             
    }
    
    public void addMovInOrder(String ID, String orderID, String movieID, String movieNum) throws SQLException {        
        //code for add-operation
        
         String createQueryString = "insert into MOVIEINORDER" + " values ('" + ID + "', '" + orderID + "', '" + movieID + "', '" + movieNum + "')";
         boolean recrodCreated = st.executeUpdate(createQueryString) > 0;
         
         if (recrodCreated){
         System.out.println("record created");
         }
         else {
         System.out.println("record not created");
         }
             
    }
    
    public String findOrderID (String userID, String date) throws SQLException {        
        //code for add-operation
        //String today = LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        String query = "SELECT * FROM ORDERS WHERE CUSID = '" + userID + "' and ORDERDATE ='" + date + "'";
        ResultSet rs = st.executeQuery(query);
        boolean hasOrder = rs.next();
        //Order orderFromDB = null;
        
        String oID = "";
         if(hasOrder){
         
             oID = rs.getString("ID");
             //String oDate = rs.getString("orderDate"); 
             //String cusid = rs.getString("cusid");
            
             //orderFromDB = new Order (oID, oDate, cusid);
    
         } 
         rs.close();
         
         return oID;
               
    }
    public ArrayList<MovieInOrder> findOrderMovie (String cID) throws SQLException {        
        //code for add-operation
        ArrayList<MovieInOrder> list = new ArrayList<>();
        //String today = LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        String query = "SELECT MOVIEINORDER.ID,MOVIEINORDER.ORDERID, MOVIEID, MOVIENUM ,ORDERS.CUSID FROM MOVIEINORDER, ORDERS WHERE cusID = '" + cID + "' AND MOVIEINORDER.ORDERID = ORDERS.ORDERID ";
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
            String ID = rs.getString("ID");
            String orderID = rs.getString("orderID");
            String movID = rs.getString("movieID");
            String quantity = rs.getString("movieNum");

            MovieInOrder movInOr = new MovieInOrder(ID,orderID,movID, quantity);
            list.add(movInOr);
            
        }
        return list;
    }
        
    public int findOrderMovie2 (String oID) throws SQLException {        
        //code for add-operation
        //ArrayList<MovieInOrder> list = new ArrayList<MovieInOrder>();
        //String today = LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        String query = "SELECT * FROM MOVIEINORDER WHERE ORDERID = '" + oID + "'";
        ResultSet rs = st.executeQuery(query);
        boolean hasOrder = rs.next();
        int movieID = 0;
        if (hasOrder){
            
            

           movieID = Integer.parseInt(rs.getString("movieid"));
        }
        return movieID;
    }
    
    public void cancelOrder(Order cur) throws SQLException {
        String update = " DELETE FROM ORDERS WHERE CUSID = '" + cur.getCusid() + "' ";
        st.executeUpdate(update);
    }
    
    public MovieInOrder findOrder (String orderID, String date) throws SQLException {        
        //code for add-operation
        //String today = LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        String query = "SELECT * FROM MOVIEINORDER WHERE ORDERID = '" + orderID + "'";
        ResultSet rs = st.executeQuery(query);
        boolean hasOrder = rs.next();
        //Order orderFromDB = null;
        
        
        
        String ID="";
        String movID="";
        String quantity="";
        
        
        if(hasOrder){
            ID = rs.getString("ID");
            
            movID = rs.getString("movieID");
            quantity = rs.getString("movieNum");
        
             //String oDate = rs.getString("orderDate"); 
             //String cusid = rs.getString("cusid");
            
             //orderFromDB = new Order (oID, oDate, cusid);
    
         } 
         MovieInOrder mio = new MovieInOrder(ID,orderID,movID,quantity);
         
         return mio;
               
    }
    
    public void stocktoSold(int movID, int num) throws SQLException{
        String update = " UPDATE MOVIES SET STOCK = STOCK - " + num +", SOLD = SOLD +" + num + "WHERE ID = " + movID ;
        st.executeUpdate(update);
    }
}
