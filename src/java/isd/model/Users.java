/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package isd.model;

import java.util.ArrayList;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author mougi
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "users")

public class Users {
        @XmlElement(name = "user")
    private ArrayList<User> list = new ArrayList<User>();
 
    public ArrayList<User> getList() {
        return list;
        }
    public void addUser(User user) {
        list.add(user);
    }
    public void removeUser(User user) {
        list.remove(user);
    }
    
    public User getUser(String email) {
        for (User user : list) {
            if (user.getEmail().equals(email) == true) {
                return user;
            }
        }
        return null;
    }
    public User login(String uname, String password) {
        // For each user in the list...
        for (User user : list) {
            if (user.getUserName().equals(uname) && user.getPassword().equals(password))
                return user; // Login correct. Return this user.
        }
        return null; // Login incorrect. Return null.
    }
    
    public User logine(String email) {
        // For each user in the list...
        for (User user : list) {
            if (user.getEmail().equals(email))
                return user; // Login correct. Return this user.
        }
        return null; // Login incorrect. Return null.
    }
}
