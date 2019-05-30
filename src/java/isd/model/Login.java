/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package isd.model;

/**
 *
 * @author Cai weize
 */
public class Login {
    String ID;
    String inTime;
    String inDate;
    String outTime;
    String outDate;
    public Login(String ID,String inTime,String inDate,String outTime,String outDate)
    {
    this.ID=ID;
    this.inTime = inTime;
    this.inDate=inDate;
    this.outTime=outTime;
    this.outDate=outDate;
    }
    public String getinTime()
    {return inTime;}
    public String getinDate()
    {return inDate;}
    public String getoutTime()
    {return outTime;}
    public String getoutDate()
    {return outDate;}
    public String getID()
    {return ID;}
    
    
    
}
