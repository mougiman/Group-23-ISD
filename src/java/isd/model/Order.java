/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package isd.model;

import java.io.Serializable;

/**
 *
 * @author Zce
 */
public class Order implements Serializable{
    private String ID;   
    private String date;   
    private String cusid;    

    public Order() { }
    
    public Order(String ID, String date,String cusid) {
        this.ID = ID;
        this.date = date;
        this.cusid = cusid;

    }
    
    /*public void updateDetails(String name, String email, String password, String dob, String favcol){
        this.name = name;
        this.email = email;
        this.password = password;
        this.dob = dob;
        this.favcol = favcol;   
    }*/

    public boolean matchID(String ID){
        return this.ID.equals(ID.trim());
    }
    
    public boolean matchCusid(String cusid){
        return this.cusid.equals(cusid.trim());
    }


    
    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getCusid() {
        return cusid;
    }

    public void setCusid(String cusid) {
        this.cusid = cusid;
    }

}//end class

    

