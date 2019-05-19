/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package isd.model.dao;

/**
 *
 * @author Mougi
 */
import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.SQLException;

 

public class DBConnector {

 

private String URL = "jdbc:derby://localhost:1527/MovieDB";

private String dbuser = "MovieUser";

private String dbpass = "password";

private String driver = "org.apache.derby.jdbc.ClientDriver";

private Connection conn;

 

public DBConnector() throws ClassNotFoundException, SQLException {

Class.forName(driver);

conn = DriverManager.getConnection(URL, dbuser, dbpass);

}

 

public Connection openConnection(){

return this.conn;

}

 

public void closeConnection() throws SQLException {

this.conn.close();

}

}