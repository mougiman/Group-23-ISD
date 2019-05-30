/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package isd.model;

import java.util.ArrayList;

/**
 *
 * @author Cai weize
 */
public class Logins {
       private ArrayList<Login> list = new ArrayList<Login>();
 
    public ArrayList<Login> getLogins() {
        return list;
    }
    
    public void addLogin(Login login) {
        list.add(login);
    }
    public void removeLogin(Login login) {
        list.remove(login);
    }
    
    public Login getLogin(String ID) {
        for (Login login : list) {
            if (login.getID().equals(ID)) {
                return login;
            }
        }
        return null;
    }

}
