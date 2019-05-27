package isd.model.dao;

import isd.model.Movie;
import java.sql.*;
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

    private Statement st;

    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    //Find student by ID in the database
    public ArrayList<Movie> findMovie(int ID) throws SQLException {
        ArrayList<Movie> list = new ArrayList<Movie>();
        String query = "SELECT * FROM MOVIES WHERE ID = "+ID;
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

    //Add a student-data into the database
    public void addMovie(int ID, String name, String genre, String description, String posterref, Double Price, int stock, int sold) throws SQLException {
        String query = "INSERT INTO MOVIES (ID, NAME, GENRE, DESCRIPTION, POSTERREF, PRICE, STOCK, SOLD) VALUES (" + ID + ",'" + name + "','" + genre + "','" + description + "','" + posterref + "'," + Price + "," + stock + "," + sold + ")";
        //String query = "INSERT INTO MOVIES (ID, NAME, GENRE, DESCRIPTION, POSTERREF, PRICE, STOCK, SOLD) VALUES ('100','timbs','timbs','timbs','timbs','10','10','10')";
        st.executeUpdate(query);
    }

    //update a student details in the database
    public void updateMoive(String ID, String email, String name, String password, String dob, String favcol) throws SQLException {
        //code for update-operation
    }

    //delete a student from the database
    public void deleteMovie(int ID) throws SQLException {
        String query = "DELETE FROM MOVIES WHERE ID = " + ID;
        st.executeUpdate(query);
    }
}
