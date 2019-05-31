/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package isd.model;

/**
 *
 * @author Zce
 */
import java.io.Serializable;


public class MovieInOrder implements Serializable{
    private String ID;
    private String orderID;
    private String movieID;   
    private String movieNum;    

    public MovieInOrder() { }
    
    public MovieInOrder(String ID, String orderID,String movieID, String movieNum) {
        this.ID = ID;
        this.orderID = orderID;
        this.movieID = movieID;
        this.movieNum = movieNum;

    }
    
    /*public void updateDetails(String name, String email, String password, String dob, String favcol){
        this.name = name;
        this.email = email;
        this.password = password;
        this.dob = dob;
        this.favcol = favcol;   
    }

    public boolean matchID(String ID){
        return this.ID.equals(ID.trim());
    }
    
    public boolean matchCusid(String cusid){
        return this.cusid.equals(cusid.trim());
    }
*/

    
    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOderID(String orderID) {
        this.orderID = orderID;
    }

    public String getMovieID() {
        return movieID;
    }

    public void setMovieID(String movieID) {
        this.movieID = movieID;
    }
    
    public String getMovieNum() {
        return movieNum;
    }

    public void setMovieNum(String movieNum) {
        this.movieNum = movieNum;
    }

}//end class